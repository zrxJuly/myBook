package com.ifan.book.controller;

import com.ifan.book.model.Book;
import com.ifan.book.model.User;
import com.ifan.book.service.BookService;
import com.ifan.book.service.UserService;
import com.ifan.book.utils.FileUpLoad;
import com.ifan.book.utils.Invariable;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping("/meInfo.action")
    public String meInfo(Model model, HttpServletRequest request) {
        int ID = (Integer) request.getSession().getAttribute(Invariable.SESSION_KEY);
        model.addAttribute("userInfo", userService.getUserBaseInfo(ID));//查询用户的基本信息
        model.addAttribute("bookBorrow", bookService.getBorrowBookByUser(ID));//得到用户的借阅信息
        model.addAttribute("bookMy", bookService.getMyBook(ID));//得到用户的图书
        model.addAttribute("bookCollect",bookService.getCollectBookByUser(ID));//得到用户收藏的图书
        model.addAttribute("bookReserve",bookService.getReserveBookByUser(ID));//得到用户预约的图书
        return "meInfo";
    }

    @RequestMapping(value = "/addOrUpdateBook.action", method = RequestMethod.POST)
    public String addOrUpdateBook(Book book, MultipartFile file, HttpServletRequest request) {
        //查看用户是否改变了图片的信息
        if (null != file) {
            Map<String, String> map = FileUpLoad.imageUp(file, request);
            System.out.println(map.get("flag"));
            if ("success" == map.get("flag")) {
                //文件上传成功
                System.out.println(map.get("path"));
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
            System.out.println("image = " + book.getImage());
            System.out.println("latitude = " + book.getLatitude());
            System.out.println(book.getLongitude());
            bookService.addBook(book);
        }
        return "redirect: meInfo.action";
    }
    @ResponseBody
    @RequestMapping(value = "/ajaxGetUserByCondition.action", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public Map<String ,String> ajaxGetUserByCondition(String condition){
        //根据账号和昵称查询用户

        return userService.getUserByCondition(condition);
    }



}
