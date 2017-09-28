package com.ifan.book.model;

import java.util.Date;

/**
 * 聊天记录和信息
 */
public class Message {
    private int from_id;//消息的发送人
    private int to_id;//消息的接收人
    private Date sendDate;//消息发送的时间
    private String message_content;//消息的内容
    private int status;//消息的状态
    // 1: 已读, 0: 未读

    public int getFrom_id() {
        return from_id;
    }

    public void setFrom_id(int from_id) {
        this.from_id = from_id;
    }

    public int getTo_id() {
        return to_id;
    }

    public void setTo_id(int to_id) {
        this.to_id = to_id;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public String getMessage_content() {
        return message_content;
    }

    public void setMessage_content(String message_content) {
        this.message_content = message_content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
