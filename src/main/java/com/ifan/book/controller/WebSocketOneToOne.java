package com.ifan.book.controller;

import com.alibaba.fastjson.JSONObject;

import javax.persistence.criteria.CriteriaBuilder;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Created by iFan on 2017/8/7.
 * 实现一对一聊天
 */
@ServerEndpoint("/webSocket/{userId}")
public class WebSocketOneToOne {

    private static int username = 0;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    public static Map<Integer, WebSocketOneToOne> webSocketMap = new HashMap<Integer, WebSocketOneToOne>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    /**
     * 连接建立成功调用的方法
     *
     * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session) {
        System.out.println(session.getQueryString());
        this.username = Integer.parseInt(session.getQueryString().split("=")[1]);
        this.session = session;
        webSocketMap.put(this.username, this);
        System.out.println("有新连接加入！username - " + this.username);
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        webSocketMap.remove(this.username);  //从set中删除
        System.out.println("有一连接关闭！关闭的用户为 - " + this.username);
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
        JSONObject json = JSONObject.parseObject(message); //将字符串{'fromId':1,'toId':2,'message':'你好'}
        System.out.println("json = " + json);
        int from = json.getInteger("fromId");
        int to = json.getInteger("toId");
        String mes = json.getString("message");
        boolean flag = webSocketMap.containsKey(to);//判断需要发送给的用户是否在线
        if (flag)
            webSocketMap.get(json.getInteger("toId")).session.getAsyncRemote().sendText(json.getString("message"));
        else {
            mes = "自动回复:暂时离开。";
        }
        webSocketMap.get(from).session.getAsyncRemote().sendText(mes);//将该消息返回给发送人。
    }

    /**
     * 发生错误时调用
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("发生错误");
        error.printStackTrace();
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     *
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException {
        this.session.getAsyncRemote().sendText(message);
        System.out.println("message = " + message);
    }

}
