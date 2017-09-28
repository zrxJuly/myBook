package com.ifan.test.service;

import com.ifan.book.model.Message;
import com.ifan.book.service.MessageServer;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class MessageServiceTest {
    private static Logger log = Logger.getLogger(MessageServiceTest.class);

    @Resource
    private MessageServer messageServer;

    @Test
    public void test() {
        Message message = new Message();
        message.setFrom_id(0);
        message.setTo_id(1);
        message.setMessage_content("有人想要阅读你的图书");
        message.setStatus(1);
        messageServer.addMessage(message);
    }

}
