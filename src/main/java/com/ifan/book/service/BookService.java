package com.ifan.book.service;


import com.ifan.book.model.Book;
import com.ifan.book.model.Borrow;
import com.ifan.book.model.Collect;
import com.ifan.book.model.Reserve;

import java.util.List;

public interface BookService {

    /**
     * 添加图书
     *
     * @param book
     * @return
     */
    int addBook(Book book);

    /**
     * 根据 位置 获取该位置附近的热门图书
     *
     * @param latitude  经度
     * @param longitude 纬度
     * @return 借阅的数量 和 收藏的数量
     */
    List<Book> getAllHotBook(Double latitude, Double longitude);

    /**
     * 用户更新图书信息
     *
     * @param book
     */
    void updateBook(Book book);


    /**
     * 得到该用户当前借阅的图书
     *
     * @param id
     * @return
     */
    List<Borrow> getBorrowBookByUser(int id);

    /**
     * 得到用户的图书
     *
     * @param id 用户id
     * @return
     */
    List<Book> getMyBook(int id);

    /**
     * 得到用户收藏的图书
     *
     * @param id 用户id
     * @return
     */
    List<Collect> getCollectBookByUser(int id);

    /**
     * 得到用户预约的图书
     *
     * @param id 用户的id
     * @return
     */
    List<Reserve> getReserveBookByUser(int id);

    /**
     * 用户预约图书
     *
     * @param book_id 图书的id
     * @param user_id 用户的id
     */
    void reserveBook(int book_id, int user_id);

    /**
     * 用户取消预约图书
     *
     * @param book_id 图书id
     * @param user_id 用户id
     */
    void reserveBookCancel(int book_id, int user_id);

    /**
     * 根据状态查询图书
     *
     * @return
     */
    List<Book> getUnVerifyBook(int status);

    /**
     * 确认图书信息
     *
     * @param id 图书的id
     */
    void verifyBook(int id, int status);

    /**
     * 查询确认的图书的数量
     *
     * @param verify 是否已经确认 true 确认 false 未确认
     * @return
     */
    int getSizeVerifyBook(boolean verify);

    /**
     * 得到图书的状态
     *
     * @param book_id
     * @return 图书状态 see Invariable.BOOK_STATE
     */
    int getBookStatus(int book_id);

    /**
     * 根据图书的id 得到书主
     *
     * @param book_id 图书的id
     * @return
     */
    int getBookOwner(int book_id);


    /**
     * 将书主添加进借阅表
     *
     * @param book_id  图书id
     * @param owner_id 书主的id
     */
    void addBorrow(int book_id, int owner_id);

    /**
     * 得到当前借阅人
     *
     * @param book_id 图书的id
     * @return
     */
    int getCurrentBorrowId(int book_id);

    /**
     * 删除我的图书
     *
     * @param book_id 图书的id
     */
    void deleteMyBook(int book_id);

    /**
     * 更换图书的当前拥有人
     *
     * @param book_id   图书的id
     * @param nextOwner 下一位拥有人
     */
    void changeBookOwner(int book_id, int nextOwner);

    /**
     * 根据图书的id得到图书借阅的历史记录
     *
     * @param book_id
     * @return
     */
    List<Borrow> getBookBorrow(int book_id);
}
