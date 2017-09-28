package com.ifan.book.service.impl;

import com.ifan.book.dao.MessageDao;
import com.ifan.book.model.Message;
import com.ifan.book.service.MessageServer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("MessageServer")
@Transactional(rollbackFor = Exception.class)
public class MessageServiceImpl implements MessageServer{

    @Resource
    private MessageDao messageDao;

    @Override
    public void addMessage(Message message) {
        messageDao.addMessage(message);
    }
}
