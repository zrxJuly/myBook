package com.ifan.test.service;

import com.ifan.book.model.User;
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
import java.util.Map;
import java.util.Random;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class UserServiceTest {
    private static Logger log = Logger.getLogger(UserServiceTest.class);

    @Resource
    private UserService userService;


    /**
     * 测试用户登录方法
     */
    @Test
    public void login() {
        Map<String,Integer> user = userService.login("11","23213");
        System.out.println(user==null);
    }

    /**
     * 测试用户注册方法
     */
    @Test
    public void register() {
        for (int i = 0; i <= 50; i++) {
            User user = new User();
            user.setId(i);
            user.setPassword(i+"");
            user.setAccount(i+"");
            user.setName("新用户" + i);
            user.setIntro("简介" + i);
            if(i%2==0){
                user.setLatitude(117.276822 + new Random().nextFloat());
                user.setLongitude(117.276822 + new Random().nextFloat());
            }else {
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
        userService.addUserIntegral(1, 0.2f);
    }


    @Test
    public void getUserBaseInfo(){
        User user = userService.getUserBaseInfo(1);
        System.out.println(user);
    }

    @Test
    public void getUserLocation(){
        //得到用户的位置
        Map<String,Double> map = userService.getUserLocation(1);
        System.out.println(map);
    }


}
