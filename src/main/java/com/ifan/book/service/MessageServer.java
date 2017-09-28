package com.ifan.book.service;

import com.ifan.book.model.Message;

/**
 * 消息记录的
 */
public interface MessageServer {

    /**
     * 添加消息记录
     * @param message
     */
    void addMessage(Message message);

}
