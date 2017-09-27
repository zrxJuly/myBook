package com.ifan.book.service.impl;

import com.ifan.book.dao.UserDao;
import com.ifan.book.model.User;
import com.ifan.book.service.UserService;
import com.ifan.book.utils.Invariable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.*;

@Service("UserService")
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;


    @Override
    public Map<String, Integer> login(String account, String password) {
        Map<String, Integer> user = userDao.login(account, password);
        if (null == user.get("id")) {
            user.put("id", -1);//没有找到账号
            return user;
        } else {
            return user;
        }
    }

    @Override
    public int register(User user) {
        //新注册的用户必须是普通的
        user.setStatus(Invariable.USER_STATE_ORDINARY);
        // 注册的时间是当前的时间
        user.setCreateDate(new Date());
        // 设置默认的用户的信用
        user.setIntegral(Invariable.ACQUIESCENT_USER_INTEGRAL);
        // 在用户注册的时候可能没有获取到用户的位置
        // 设置默认的用户位置
        if (user.getLongitude() == null || user.getLatitude() == null) {
            user.setLongitude(Invariable.POSITION_LONGITUDE);
            user.setLatitude(Invariable.POSITION_LATITUDE);
        }
        return userDao.register(user);
    }

    @Override
    public void updateUserBaseInfo(User user) {
        userDao.updateUserBaseInfo(user);
    }

    @Override
    public void updateUserPosition(int id, double latitude, double longitude) {
        userDao.updateUserPosition(id, latitude, longitude);
    }

    @Override
    public void updateUserPassword(int id, String password) {
        userDao.updateUserPassword(id, password);
    }

    @Override
    public void addUserIntegral(int id, float integral) {
        userDao.addUserIntegral(id, integral);
    }

    @Override
    public void updateUserStatus(int id, int status) {
        userDao.updateUserStatus(id, status);
    }

    @Override
    public List<User> getAllHotUser(User user) {
        List<User> users = new ArrayList<User>();
        int ci = 1;
        // 需要将活跃的用户的数量变成9
        while (users.size() < 10) {
            //根据用户当前的地理位置得到一定位置范围内的用户
            users = userDao.getUserInScope(user.getLatitude(), user.getLongitude(), Invariable.POSITION_SCOPE * ci);
            ci++;
        }

        // 得到这些用户的阅读量和评论量 根据这两个数据进行排序
        for (User u : users) {
            u.setSizeBorrow(userDao.getSizeBorrow(u.getId()));
            u.setSizeComment(userDao.getSizeComment(u.getId()));
        }
        //排序 评论数量优先
        Collections.sort(users, new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                int borrow = o1.getSizeBorrow() - o2.getSizeBorrow();
                int comment = o1.getSizeComment() - o2.getSizeComment();
                if (comment > 0) return 1;
                else if (borrow > 0) return 1;
                else if (borrow == 0) return 0;
                else return -1;
            }
        });
        return users;
    }

    @Override
    public User getUserBaseInfo(int id) {
        User user = userDao.getUserBaseInfo(id);
        user.setSizeComment(userDao.getSizeComment(id));
        user.setSizeBorrow(userDao.getSizeBorrow(id));
        user.setSizeCollect(userDao.getSizeCollect(id));
        user.setSizeReserve(userDao.getSizeReserve(id));
        return user;
    }

    @Override
    public Map<String, Double> getUserLocation(int id) {
        Map<String, Double> result = new HashMap<String, Double>();
        Map<String, BigDecimal> location = userDao.getUserLocation(id);
        result.put("longitude", location.get("longitude").doubleValue());
        result.put("latitude", location.get("latitude").doubleValue());
        return result;
    }

    @Override
    public boolean checkAccount(String account) {
        Integer id = userDao.checkAccount(account);
        if (id == null) return false;//账号不存在
        else return true;// 账号存在


    }

    @Override
    public int getSizeAllUser() {
        return userDao.getSizeAllUser();
    }
}
