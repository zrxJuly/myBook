package com.ifan.book.service;


import com.ifan.book.model.Book;
import com.ifan.book.model.Borrow;
import com.ifan.book.model.Collect;
import com.ifan.book.model.Reserve;

import java.util.List;

public interface BookService {

    /**
     * 添加图书
     * @param book
     * @return
     */
    int addBook(Book book);

    /**
     * 根据 位置 获取该位置附近的热门图书
     * @param latitude 经度
     * @param longitude 纬度
     * @return 借阅的数量 和 收藏的数量
     */
    List<Book> getAllHotBook(Double latitude, Double longitude);

    /**
     * 用户更新图书信息
     * @param book
     */
    void updateBook(Book book);


    /**
     * 得到该用户当前借阅的图书
     * @param id
     * @return
     */
    List<Borrow> getBorrowBookByUser(int id);

    /**
     * 得到用户的图书
     * @param id 用户id
     * @return
     */
    List<Book> getMyBook(int id);

    /**
     * 得到用户收藏的图书
     * @param id 用户id
     * @return
     */
    List<Collect> getCollectBookByUser(int id);

    /**
     * 得到用户预约的图书
     * @param id 用户的id
     * @return
     */
    List<Reserve> getReserveBookByUser(int id);

    /**
     * 用户预约图书
     * @param book_id 图书的id
     * @param user_id 用户的id
     */
    void reserveBook(int book_id,int user_id);

    /**
     * 用户取消预约图书
     * @param book_id 图书id
     * @param user_id 用户id
     */
    void reserveBookCancel(int book_id,int user_id);

    /**
     * 根据状态查询图书
     * @return
     */
    List<Book> getUnVerifyBook(int status);

    /**
     * 确认图书信息
     * @param id 图书的id
     */
    void verifyBookTrue(int id);
}
