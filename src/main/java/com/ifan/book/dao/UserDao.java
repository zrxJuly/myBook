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
    Map<String,Integer> login(@Param("account") String account, @Param("password") String password);

    Integer register(User user);

    void updateUserBaseInfo(User user);

    void updateUserPosition(@Param("id")int id,@Param("latitude") double latitude,@Param("longitude") double longitude);

    void updateUserPassword(@Param("id") int id,@Param("password") String password);

    void addUserIntegral(@Param("id") int id,@Param("integral") float integral);

    void updateUserStatus(@Param("id") int id,@Param("status") int status);

    List<User> getUserInScope(@Param("latitude") Double latitude,@Param("longitude") Double longitude,@Param("ci") double scope);

    Integer getSizeBorrow(@Param("id") int id);//得到该用户的阅读量
    Integer getSizeComment(@Param("id") int id);//得到用户的评论数量
    Integer getSizeCollect(@Param("id") int id);//得到用户的收藏数量
    Integer getSizeReserve(@Param("id") int id);//得到用户的预约数量

    User getUserBaseInfo(@Param("id") int id);//得到用户的基本信息

    Map<String, BigDecimal> getUserLocation(@Param("id") int id);//得到用户的经纬度

    // 查询账号是否存在
    Integer checkAccount(@Param("account") String account);

    // 查询用户的数量
    int getSizeAllUser();
}
