package com.ifan.book.controller;

import com.ifan.book.model.Book;
import com.ifan.book.service.BookService;
import com.ifan.book.service.UserService;
import com.ifan.book.utils.FileUpLoad;
import com.ifan.book.utils.Invariable;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by iFan on 2017/7/26.
 */

@Controller
@RequestMapping("/admin")
public class AdminController {
    private Logger log = Logger.getLogger(AdminController.class);
    @Resource
    private UserService userService;
    @Resource
    private BookService bookService;

    @RequestMapping("/index.action")
    public String index(Model model, HttpServletRequest request) {
        // 查询用户的数量
        model.addAttribute("sizeUser", userService.getSizeAllUser());
        // 查询已经确认的图书数量
        model.addAttribute("sizeVerifyBook", bookService.getSizeVerifyBook(true));
        // 查询纠纷
        // 查询未确认的图书的数量
        model.addAttribute("sizeUnVerifyBook", bookService.getSizeVerifyBook(false));
        return "admin/index";
    }

    @RequestMapping(value = "/waitingProcess.action")
    public String waitingProcess(ModelMap map) {
        // 查询未确认的图书
        map.addAttribute("unVerifyBooks", bookService.getUnVerifyBook(Invariable.BOOK_STATUS_AFFIRM_NOT));
        // 查询
        return "admin/book";
    }

    @ResponseBody
    @RequestMapping(value = "/verifyBookTrue.action", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public void verifyBook(int id, boolean status) {
        //图书确认功能
        if (status) {//图书确认成功
            bookService.verifyBook(id, Invariable.BOOK_STATUS_AFFIRM_TRUE);
        } else {//图书确认失败
            bookService.verifyBook(id, Invariable.BOOK_STATUS_AFFIRM_FALSE);
        }
    }


}
