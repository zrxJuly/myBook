package com.ifan.book.dao;

import com.ifan.book.model.Book;
import com.ifan.book.model.Borrow;
import com.ifan.book.model.Collect;
import com.ifan.book.model.Reserve;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface BookDao {

    // 添加图书
    int addBook(Book book);

    //得到热门图书
    List<Book> getAllHotBook(@Param("latitude") double latitude, @Param("longitude") double longitude, @Param("scope") double scope);

    //得到该用户当前借阅的图书
    List<Borrow> getBorrowBookByUser(@Param("id") int id);

    //得到用户的图书
    List<Book> getMyBook(@Param("owner") int id);

    //得到用户收藏的图书
    List<Collect> getCollectBookByUser(@Param("id") int id);

    //得到用户预约的图书
    List<Reserve> getReserveBookByUser(@Param("id") int id);
    //根据图书的id和预约时间得到在 该预约时间之前还有多少预约的人
    Integer getSizeReserveBeforeThis(@Param("book_id") int id,@Param("reserveDate") Date reserveDate);

    //用户预约图书
    void reserveBook(@Param("book_id") int book_id,@Param("user_id") int user_id);

    //用户取消预约图书
    void reserveBookCancel(@Param("book_id") int book_id,@Param("user_id") int user_id);

    //根据状态查询图书
    List<Book> getUnVerifyBook(@Param("status") int status);

    //确认图书正确
    void verifyBookTrue(int id);
}
