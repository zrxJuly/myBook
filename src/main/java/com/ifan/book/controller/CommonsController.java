package com.ifan.book.controller;

import com.ifan.book.model.Comment;
import com.ifan.book.model.User;
import com.ifan.book.service.BookService;
import com.ifan.book.service.UserService;
import com.ifan.book.utils.Invariable;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by iFan on 2017/7/26.
 */
@Controller
@RequestMapping("/")
public class CommonsController {
    private Logger log = Logger.getLogger(CommonsController.class);
    @Resource
    private BookService bookService;
    @Resource
    private UserService userService;

    /**
     * 首页
     * 1. 获取
     *
     * @param model
     * @param request
     * @return index
     */
    @RequestMapping("/index.action")
    public String index(Model model, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();//根据请求数据，找到cookie数组
        if (cookies == null) {
            System.out.println("没有 cookie ");
        } else {
            for (Cookie cookie : cookies) {
                if (Invariable.COOKIE_KEY.equals(cookie.getName())) {
                    System.out.println(cookie.getValue());
                }
            }
        }
        return "index";
    }

    /**
     * ajax 获取用户的地理位置
     *
     * @param latitude  经度
     * @param longitude 纬度
     * @return 热门图书 热门评论 活跃用户 JSON
     */
    @ResponseBody
    @RequestMapping(value = "/getPosition.action", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public Map<String, Object> getPosition(Double latitude, Double longitude) {
        System.out.println("latitude " + latitude);
        System.out.println("longitude " + longitude);
        Map<String, Object> map = new HashMap<String, Object>();
        //热门图书
        map.put("hotBook", bookService.getAllHotBook(latitude, longitude));
        return map;
    }

    /**
     * 用户登录方法
     *
     * @param account  账号
     * @param password 密码
     * @return 重定向到 user/meInfo.action
     */
    @RequestMapping(value = "/login.action", method = RequestMethod.POST)
    public String login(String account, String password, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Integer> user = userService.login(account, password);
        int status = -1;
        if (user == null) {//用户不存在
            request.setAttribute("error", "登录失败，账号或密码错误");
            return "login";
        } else {//用户存在
            status = user.get("status");
            if (status == Invariable.USER_STATE_ADMIN) {//管理员
                return "redirect: admin/index.action";
            }
            // 将用户的id放入session中
            request.getSession().setAttribute(Invariable.SESSION_KEY, user.get("id"));
            // 添加 cookie
            Cookie cookie = new Cookie(Invariable.COOKIE_KEY, String.valueOf(user.get("id")));
            cookie.setMaxAge(30 * 60);// 设置为30min
            cookie.setPath("/");
            response.addCookie(cookie);
            return "redirect: user/meInfo.action";
        }
    }

    /**
     * 注册功能
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/register.action")
    public String register(User user) {
        userService.register(user);
        return "login";
    }

    /**
     * ajax 查询用户注册的账号是否允许注册
     *
     * @return true:存在 false:不存在
     */
    public Boolean ajaxCheckAccount(String account) {
        boolean isExit = userService.checkAccount(account);
        if (isExit) return false; //账号存在 不允许注册
        else return true; // 账号不存在 可以注册
    }

    /**
     * 简单的页面跳转
     *
     * @param view 目标页面
     * @return
     */
    @RequestMapping("/view/{view}.action")
    public String view(@PathVariable(value = "view") String view) {
        return view;
    }

    /**
     * 查询该用户是否借阅过该书
     * @param book_id 需要查询的图书的id
     * @return false: 没有借阅过 没有登录
     */
    @ResponseBody
    @RequestMapping(value = "/getUserBorrowIt.action", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public boolean getUserBorrowIt(int book_id,HttpServletRequest request){
        Integer current_id = (Integer) request.getSession().getAttribute(Invariable.SESSION_KEY);
        if(null == current_id){//用户没有登录
            return false;
        }
        return bookService.getUserBorrowIt(book_id,current_id);
    }

    /**
     * 显示图书详细信息的页面
     * TODO:没有页面
     *
     * @param book_id 要显示图书的id
     * @return
     */
    @RequestMapping(value = "")
    public String getBookDetails(int book_id, ModelMap modelMap, HttpSession session) {
        Integer current_id = (Integer) session.getAttribute(Invariable.SESSION_KEY);
        int owner = bookService.getBookOwner(book_id);
        int borrowId = bookService.getBookCurrentBorrow(book_id);
        modelMap.addAttribute("bookBaseInfo", bookService.getBookBaseInfo(book_id));

        if (current_id != null) {//没有登录
            modelMap.addAttribute("flag", "notLogin");
        } else if (current_id == borrowId) {//是当前借阅人
            modelMap.addAttribute("flag", "isCurrentBorrow");
        } else if (current_id == owner) {//是书主
            modelMap.addAttribute("flag", "isOwner");
        } else {// 登录了 不是当前借阅人 不是书主  ==> 可以借阅
            modelMap.addAttribute("flag", "operation");
            modelMap.addAttribute("isCollect", userService.isCollectThisBook(book_id, current_id));//是否收藏过
            modelMap.addAttribute("isReserve", userService.isReserveThisBook(book_id, current_id));//是否预约过
        }
        return "";
    }

}
