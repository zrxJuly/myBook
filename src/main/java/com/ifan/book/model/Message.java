package com.ifan.book.model;

import java.util.Date;

/**
 * 聊天记录和信息
 */
public class Message {
    private String from;//消息的发送人
    private String to;//消息的接收人
    private Date sendDate;//消息发送的时间
    private String message;//消息的内容
    private boolean state;//消息的状态
    // true: 已读, false: 未读

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Message{" +
                "from='" + from + '\'' +
                ", to='" + to + '\'' +
                ", sendDate=" + sendDate +
                ", message='" + message + '\'' +
                ", state=" + state +
                '}';
    }
}
