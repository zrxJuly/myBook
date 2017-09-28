package com.ifan.test.service;

import com.ifan.book.model.Borrow;
import com.ifan.book.model.Message;
import com.ifan.book.model.User;
import com.ifan.book.service.BookService;
import com.ifan.book.service.MessageServer;
import com.ifan.book.service.UserService;
import com.ifan.book.utils.Invariable;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class UserServiceTest {
    private static Logger log = Logger.getLogger(UserServiceTest.class);

    @Resource
    private UserService userService;
    @Resource
    private BookService bookService;
    @Resource
    private MessageServer messageServer;


    /**
     * 测试用户登录方法
     */
    @Test
    public void login() {
        Map<String, Integer> user = userService.login("11", "23213");
        System.out.println(user == null);
    }

    /**
     * 测试用户注册方法
     */
    @Test
    public void register() {
        for (int i = 0; i <= 50; i++) {
            User user = new User();
            user.setId(i);
            user.setPassword(i + "");
            user.setAccount(i + "");
            user.setName("新用户" + i);
            user.setIntro("简介" + i);
            if (i % 2 == 0) {
                user.setLatitude(117.276822 + new Random().nextFloat());
                user.setLongitude(117.276822 + new Random().nextFloat());
            } else {
                user.setLatitude(117.276822 - new Random().nextFloat());
                user.setLongitude(117.276822 - new Random().nextFloat());
            }
            userService.register(user);
        }
    }

    @Test
    public void updateUserBaseInfo() {
        User user = new User();
        user.setId(2);
        user.setName("更新的name");
        userService.updateUserBaseInfo(user);
    }

    /**
     * 测试 更新地理位置
     */
    @Test
    public void updateUserLocation() {
        userService.updateUserPosition(1, Invariable.POSITION_LATITUDE, Invariable.POSITION_LONGITUDE);
    }

    @Test
    public void addUserIntegral() {
        userService.updateUserIntegral(1, 0.2f);
    }


    @Test
    public void getUserBaseInfo() {
        User user = userService.getUserBaseInfo(1);
        System.out.println(user);
    }

    @Test
    public void getUserLocation() {
        //得到用户的位置
        Map<String, Double> map = userService.getUserLocation(1);
        System.out.println(map);
    }

    @Test
    public void getUserByCondition() {
        List<Map<String, String>> user = userService.getUserByCondition("1");
        System.out.println(user);
    }

    @Test
    public void nextBook() {
        // 正常来说是预约人向当前借阅人借书
        // 但是还有一种情况是这本书并没有流转
        // 还有就是一对一借阅应该是什么流程
        // TODO: 没有测试
        // 当前预约人确认该书已经收到并对该书进行评价和对上一位借阅人进行打分
        //book_id,borrow_id,reserve_id,comment,giveMark
        userService.reserveAffirm(1, 1, 1, "hao", -0.1f);
        // 上一位借阅人对确认评价
        // book_id,borrow_id
        userService.borrowAffirm(1, 1);
        // 该书正式流转到预约人的手中
    }

    @Test
    public void reserveBook() {
        int book_id = 1;
        int reserve_id = 1;
        //用户预约图书
        userService.reserveBook(book_id, reserve_id);
        int status = bookService.getBookStatus(book_id);
        switch (status){
            case Invariable.BOOK_STATUS_FLOW_TRUE://正在流转
                break;
            case Invariable.BOOK_STATUS_AFFIRM_FALSE:// 准备流转
                //2.1 该用户是第一位预约人
                //2.2 添加消息 通知书主
                int owner_id = bookService.getBookOwner(book_id);
                bookService.addBorrow(book_id,owner_id);
                Message message = new Message();
                message.setFrom_id(0);
                message.setTo_id(owner_id);
                message.setMessage_content("有人想要阅读你的图书");
                message.setStatus(1);
                messageServer.addMessage(message);
        }
        // 查询该书的状态 流转 一对一借阅
        // 1. 流转状态
        //  1.1
        // 2. 没有正在流转，该书在书主的手中
        //
        //
        //TODO: 用户预约的图书在书主手中
    }

    @Test
    public void borrowOneToOne() {
        //用户一对一借阅图书
    }


}
