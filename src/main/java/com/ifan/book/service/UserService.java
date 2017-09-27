package com.ifan.book.service;

import com.ifan.book.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    /**
     * 用户登录方法
     * @param account 账号
     * @param password 密码
     * @return 用户的id 如果不正确则返回-1
     */
    Map<String, Integer> login(String account,String password);

    /**
     * 用户注册方法
     * @param user 封装用户的信息
     * @return 用户的id
     */
    int register(User user);

    /**
     * 用户更新基本的个人信息
     * 昵称 头像 简介
     * @param user
     */
    void updateUserBaseInfo(User user);

    /**
     * 用户更新自己经纬度信息
     * @param id 用户的id
     * @param latitude 纬度
     * @param longitude 经度
     */
    void updateUserPosition(int id,double latitude,double longitude);

    /**
     * 用户更改密码
     * @param id 用户id
     * @param password 新密码
     */
    void updateUserPassword(int id,String password);

    /**
     * 为用户在原先积分的基础上增加积分
     * @param id 用户id
     * @param integral 增加的积分
     */
    void addUserIntegral(int id,float integral);

    /**
     * 更改用户的状态（身份）
     * @param id 用户的id
     * @param status 新的用户状态
     */
    void updateUserStatus(int id,int status);

    /**
     * 根据当前用户的信息，得到符合条件的活跃用户
     * @param user 当前用户
     * @return 根据当前用户得到的热门用户
     */
    List<User> getAllHotUser(User user);

    /**
     * 得到用户的基本信息
     * @param id
     * @return
     */
    User getUserBaseInfo(int id);

    /**
     * 得到用户的位置
     * @param id
     * @return
     */
    Map<String,Double> getUserLocation(int id);


    /**
     * 查询该账号是否存在
     * @param account 目标账号
     * @return true:存在 false:不存在
     */
    boolean checkAccount(String account);
}
