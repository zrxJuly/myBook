package com.ifan.book.dao;

import com.ifan.book.model.User;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Repository
public interface UserDao {
    //用户登录方法
    Map<String, Integer> login(@Param("account") String account, @Param("password") String password);

    //用户注册方法
    Integer register(User user);

    //用户更新个人信息
    void updateUserBaseInfo(User user);

    //用户更新自己当前的位置
    void updateUserPosition(@Param("id") int id, @Param("latitude") double latitude, @Param("longitude") double longitude);

    // 用户更改密码
    void updateUserPassword(@Param("id") int id, @Param("password") String password);

    // 修改用户的积分
    void updateUserIntegral(@Param("id") int id, @Param("integral") float integral);

    //修改用户的身份
    void updateUserStatus(@Param("id") int id, @Param("status") int status);

    // 获取一定范围的用户
    List<User> getUserInScope(@Param("latitude") Double latitude, @Param("longitude") Double longitude, @Param("ci") double scope);

    //得到该用户的阅读量
    Integer getSizeBorrow(@Param("id") int id);

    //得到用户的评论数量
    Integer getSizeComment(@Param("id") int id);

    //得到用户的收藏数量
    Integer getSizeCollect(@Param("id") int id);

    //得到用户的预约数量
    Integer getSizeReserve(@Param("id") int id);

    //得到用户的基本信息
    User getUserBaseInfo(@Param("id") int id);

    //得到用户的经纬度
    Map<String, BigDecimal> getUserLocation(@Param("id") int id);

    // 查询账号是否存在
    Integer checkAccount(@Param("account") String account);

    // 查询用户的数量
    int getSizeAllUser();

    // 根据条件查询用户
    List<Map<String, String>> getUserByCondition(@Param("condition") String condition);

    // 当前预约人确认该书已经到自己手中
    void affirmGiveMe(@Param("book_id") int book_id,@Param("reserve_id") int reserve_id);
    // 对上一位借阅人 评价和扣分
    void reserveAffirm(@Param("book_id") int book_id,@Param("borrow_id") int borrow_id,
                       @Param("comment") String comment,@Param("giveMark") float giveMark);

    //当前借阅人确认评价内容
    void borrowAffirm(@Param("book_id") int book_id,@Param("borrow_id") int borrow_id,
                      @Param("status") int status);

    // 得到该书的第一位预约人
    Integer getFirstReserve(@Param("book_id") int book_id);

    // 添加用户的借阅信息
    void addBorrow(@Param("book_id") int book_id,@Param("reserve_id") int reserve_id,
                   @Param("status") int status);

    // 删除预约信息
    void deleteReserve(@Param("book_id") int book_id,@Param("reserve_id") int reserve_id);
    // 查询预约表中的 give_me 字段
    boolean getReserveGiveMe(@Param("book_id") int book_id,@Param("reserve_id") int reserve_id);

    // 预约图书
    void reserveBook(@Param("book_id") int book_id,@Param("reserve_id") int reserve_id);
}
