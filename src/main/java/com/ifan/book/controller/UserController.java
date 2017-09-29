package com.ifan.book.controller;

import com.ifan.book.model.*;
import com.ifan.book.service.BookService;
import com.ifan.book.service.CommentService;
import com.ifan.book.service.MessageServer;
import com.ifan.book.service.UserService;
import com.ifan.book.utils.FileUpLoad;
import com.ifan.book.utils.Invariable;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by iFan on 2017/7/26.
 */

@Controller
@RequestMapping("/user")
public class UserController {
    private Logger log = Logger.getLogger(UserController.class);
    @Resource
    private UserService userService;
    @Resource
    private BookService bookService;
    @Resource
    private MessageServer messageServer;
    @Resource
    private CommentService commentService;

    @RequestMapping("/meInfo.action")
    public String meInfo(Model model, HttpServletRequest request) {
        int current_id = (int) request.getSession().getAttribute(Invariable.SESSION_KEY);
        model.addAttribute("userInfo", userService.getUserBaseInfo(current_id));//查询用户的基本信息
        model.addAttribute("bookBorrow", bookService.getBorrowBookByUser(current_id));//得到用户的借阅信息
        model.addAttribute("bookMy", bookService.getMyBook(current_id));//得到用户的图书
        model.addAttribute("bookCollect", bookService.getCollectBookByUser(current_id));//得到用户收藏的图书
        model.addAttribute("bookReserve", bookService.getReserveBookByUser(current_id));//得到用户预约的图书
        return "meInfo";
    }

    /**
     * 更新或者添加图书
     *
     * @param book
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "/addOrUpdateBook.action", method = RequestMethod.POST)
    public String addOrUpdateBook(Book book, MultipartFile file, HttpServletRequest request) {
        //查看用户是否改变了图片的信息
        if (null != file) {
            Map<String, String> map = FileUpLoad.imageUp(file, request, "books\\");
            System.out.println(map.get("flag"));
            if ("success" == map.get("flag")) {
                //文件上传成功
                book.setImage(Invariable.IMAGE_BOOK_PREFIX + map.get("path"));//重新填写图片的路径
            }
        }
        if (null != book.getId()) {//更新图书
            bookService.updateBook(book);
        } else {//添加图书
            //设置图书的拥有人
            int ID = (Integer) request.getSession().getAttribute(Invariable.SESSION_KEY);
            book.setOwner(ID);
            //设置图书的位置为当前用户的位置
            Map<String, Double> location = userService.getUserLocation(ID);
            book.setLongitude(location.get("longitude"));
            book.setLatitude(location.get("latitude"));
            bookService.addBook(book);
        }
        return "redirect: meInfo.action";
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxGetUserByCondition.action", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public List<Map<String, String>> ajaxGetUserByCondition(String condition) {
        //根据账号和昵称查询用户
        return userService.getUserByCondition(condition);
    }

    // 申请介入 user/applyForIntervene.action POST
    // 返回个人信息页面
    @RequestMapping(value = "/applyForIntervene.action", method = RequestMethod.POST)
    public String applyForIntervene(String message, int book_id, HttpServletRequest request) {
        int current_id = (Integer) request.getSession().getAttribute(Invariable.SESSION_KEY);
        Message toSystemAdmin = new Message();//将消息发送给系统管理员
        toSystemAdmin.setMessage_content(message);
        toSystemAdmin.setStatus(Invariable.MESSAGE_APPLY_FOR_INTERVENE);
        toSystemAdmin.setTo_id(Invariable.SYSTEM_ID);
        toSystemAdmin.setFrom_id(current_id);
        int current_borrow_id = bookService.getCurrentBorrowId(book_id);
        if (current_borrow_id != -1) {// 将消息发送给当前借阅人
            Message toCurrentBorrow = new Message();
            toCurrentBorrow.setMessage_content(message);
            toCurrentBorrow.setStatus(Invariable.MESSAGE_APPLY_FOR_INTERVENE);
            toCurrentBorrow.setFrom_id(current_id);
            toCurrentBorrow.setTo_id(current_borrow_id);
            messageServer.addMessage(toCurrentBorrow);
        }
        messageServer.addMessage(toSystemAdmin);
        return "redirect: meInfo.action";
    }

    // 删除 user/deleteMyBook.action POST
    // flag:boolean
    // message:"删除成功"|"删除失败，该书正在流转"|"删除失败，该书正在一对一借阅"
    public Map<String, String> deleteMyBook(int book_id) {
        Map<String, String> map = new HashMap<String, String>();
        int status = bookService.getBookStatus(book_id);
        switch (status) {
            case Invariable.BOOK_STATUS_AFFIRM_NOT://未确认状态
            case Invariable.BOOK_STATUS_AFFIRM_TRUE://确认成功状态
            case Invariable.BOOK_STATUS_AFFIRM_FALSE://确认失败状态
            case Invariable.BOOK_STATUS_FLOW_FALSE://准备流动状态 但是没有流动
            case Invariable.BOOK_STATUS_ONE_TO_ONE_FALSE://准备一对一流动 但是没有流动
            case Invariable.BOOK_STATUS_SELL://准备出手状态
                //直接删除
                bookService.deleteMyBook(book_id);//删除我的图书
                map.put("flag", "true");
                map.put("message", "删除成功");
                break;
            case Invariable.BOOK_STATUS_FLOW_TRUE://正在流动
                map.put("flag", "false");
                map.put("message", "删除失败，图书当前正在流动状态，不在你的手中");
                break;
            case Invariable.BOOK_STATUS_ONE_TO_ONE_TRUE://图书正在一对一借阅状态
                map.put("flag", "false");
                map.put("message", "删除失败，图书正在一对一借阅状态，不在你的手中");
                break;
        }
        return map;
    }

    // 更换图书的拥有人
    // user/changeBookOwner.action POST
    // flag:boolean
    // message:"更换成功"|"更换失败，该书正在流转"|"更换失败，该书正在一对一借阅"
    public Map<String, String> changeBookOwner(int book_id, int nextOwner, HttpServletRequest request) {
        Map<String, String> map = new HashMap<String, String>();
        int current_id = (Integer) request.getSession().getAttribute(Invariable.SESSION_KEY);
        if (current_id != bookService.getBookOwner(book_id)) {
            map.put("flag", "false");
            map.put("message", "更换失败，这本图书不是你的");
            return map;
        }

        int status = bookService.getBookStatus(book_id);
        switch (status) {
            case Invariable.BOOK_STATUS_AFFIRM_TRUE://确认成功状态
            case Invariable.BOOK_STATUS_SELL://准备售出状态
                bookService.changeBookOwner(book_id, nextOwner);
                map.put("flag", "true");
                map.put("message", "更换成功，该书已经换到该用户的手中");
                break;
            case Invariable.BOOK_STATUS_AFFIRM_NOT://未确认状态
            case Invariable.BOOK_STATUS_AFFIRM_FALSE://确认失败
                map.put("flag", "false");
                map.put("message", "更换失败，该书没有被确认，或确认失败");
                break;
            case Invariable.BOOK_STATUS_FLOW_TRUE://流动状态
            case Invariable.BOOK_STATUS_FLOW_FALSE://准备流动
                map.put("flag", "false");
                map.put("message", "更换失败，该书的状态为流动状态");
            case Invariable.BOOK_STATUS_ONE_TO_ONE_FALSE://准备一对一借阅
            case Invariable.BOOK_STATUS_ONE_TO_ONE_TRUE://正在一对一借阅
                map.put("flag", "false");
                map.put("message", "更换失败，该书的状态为一对一借阅");
                break;
        }
        return map;
    }

    // 用户修改自己的个人信息
    // file 头像
    @RequestMapping(value = "/updateMyInfo.action")
    public String updateMyInfo(User user, MultipartFile file, HttpServletRequest request) {
        if (null != file) {
            Map<String, String> map = FileUpLoad.imageUp(file, request, "users\\");
            if ("success" == map.get("flag")) {
                //文件上传成功
                user.setImage(Invariable.IMAGE_USER_PREFIX + map.get("path"));//重新填写图片的路径
            }
        }
        userService.updateUserBaseInfo(user);
        return "redirect: meInfo.action";
    }

    /**
     * 更新自己的密码
     *
     * @param password 新密码
     * @param request
     * @return
     */
    @RequestMapping(value = "/updateMyPassword.action")
    public String updateMyPassword(String password, HttpServletRequest request) {
        int current_id = (int) request.getSession().getAttribute(Invariable.SESSION_KEY);
        userService.updateUserPassword(current_id, password);
        return "redirect: meInfo.action";
    }

    /**
     * 得到 书途
     * 页面跳转 没有页面
     * TODO: 没有书途页面
     *
     * @param book_id 查看图书的id
     */
    @RequestMapping(value = "/getBookBorrow.action")
    public String getBookBorrow(int book_id, ModelMap modelMap) {
        List<Borrow> list = bookService.getBookBorrow(book_id);
        modelMap.addAttribute("bookBorrow", list);
        return "";
    }

    /**
     * 借阅过的用户对该书进行评论
     * TODO: 没有图书详情页面
     *
     * @param comment 评论信息的封装
     * @return 返回这本书的详细信息页面
     */
    @RequestMapping(value = "/userAddComment.action", method = RequestMethod.POST)
    public String userAddComment(Comment comment, HttpServletRequest request) {
        Integer current_id = (Integer) request.getSession().getAttribute(Invariable.SESSION_KEY);
        comment.setUser_id(current_id);//设置评论用户的id
        commentService.addComment(comment);
        return "";
    }



    @ResponseBody
    @RequestMapping(value = "/automaticReplenishmentBookInfo.action", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public Book automaticReplenishmentBookInfo(String book_name){
        return bookService.getAutomaticReplenishmentBookInfo(book_name);
    }

}
