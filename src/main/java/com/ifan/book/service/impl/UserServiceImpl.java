package com.ifan.book.service.impl;

import com.ifan.book.dao.MessageDao;
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

        return userDao.login(account, password);

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
    public void updateUserIntegral(int id, float integral) {
        userDao.updateUserIntegral(id, integral);
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

    @Override
    public List<Map<String, String>> getUserByCondition(String condition) {
        condition = "'%" + condition + "%'";
        return userDao.getUserByCondition(condition);
    }

    @Override
    public void reserveAffirm(int book_id, int borrow_id, int reserve_id, String comment, float giveMark) {
        userDao.affirmGiveMe(book_id, reserve_id);
        userDao.reserveAffirm(book_id, borrow_id, comment, giveMark);
    }

    @Override
    public void borrowAffirm(int book_id, int borrow_id) {
        int reserve_id = userDao.getFirstReserve(book_id);
        if (userDao.getReserveGiveMe(book_id, reserve_id)) {//查看 预约表中 give_me字段是否已经更改
            // 将当前借阅的信息改为历史记录
            userDao.borrowAffirm(book_id, borrow_id, Invariable.BORROW_HISTORY);
            // 添加将当前预约人添加进借阅表
            userDao.addBorrow(book_id, reserve_id, Invariable.BORROW_IN);
            // 删除预约人的信息
            userDao.deleteReserve(book_id, reserve_id);
        }

    }

    @Override
    public void reserveBook(int book_id, int reserve_id) {
        userDao.reserveBook(book_id, reserve_id);
    }

    @Override
    public boolean isCollectThisBook(int book_id, int user_id) {
        if (userDao.isCollectThisBook(book_id, user_id) != null) {//收藏过
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean isReserveThisBook(int book_id, int user_id) {
        return userDao.isReserveThisBook(book_id, user_id) != null ? true : false;
    }
}
