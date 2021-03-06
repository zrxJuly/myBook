package com.ifan.test.service;

import com.ifan.book.model.Book;
import com.ifan.book.model.Borrow;
import com.ifan.book.model.Collect;
import com.ifan.book.service.BookService;
import com.ifan.book.utils.Invariable;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class BookServiceTest {
    private static Logger log = Logger.getLogger(BookServiceTest.class);

    @Resource
    private BookService bookService;

    @Test
    public void test() {
    }


    @Test
    public void addBook() {
        // 图书添加
        Book book = new Book();
        book.setAuthor("作者");
       // book.setOwner(1);
        book.setPress("出版社");
        book.setStatus(1);
        int bookid = bookService.addBook(book);
        System.out.println(bookid);
    }

    @Test
    public void getAllHotBook() {
        List<Book> books = bookService.getAllHotBook(36.6340742, 117.2650035);
        for (Book book : books) {
            System.out.println(book.getDistance());
        }
    }

    @Test
    public void getMyBook() {
        List<Book> books = bookService.getMyBook(1);
        System.out.println(books.size());
    }

    @Test
    public void userReserveBook() {
        bookService.reserveBook(1, 1);
    }

    @Test
    public void reserveBookCancel() {
        bookService.reserveBookCancel(1, 1);
    }

    @Test
    public void getUnVerifyBook() {
        List<Book> un = bookService.getUnVerifyBook(Invariable.BOOK_STATUS_AFFIRM_NOT);
        System.out.println(un);
    }

    @Test
    public void getSizeVerifyBook() {
        int i = bookService.getSizeVerifyBook(true);
        System.out.println(i);
    }

    @Test
    public void getCollectBookByUser(){
        List<Collect> collect = bookService.getCollectBookByUser(1);
        System.out.println(collect);
    }

    @Test
    public void getBookBorrow(){
        List<Borrow> list = bookService.getBookBorrow(1);
        System.out.println(list);
    }

}
