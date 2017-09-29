package com.ifan.book.service.impl;

import com.ifan.book.dao.BookDao;
import com.ifan.book.dao.UserDao;
import com.ifan.book.model.*;
import com.ifan.book.service.BookService;
import com.ifan.book.service.UserService;
import com.ifan.book.utils.Invariable;
import com.sun.org.apache.regexp.internal.RE;
import org.jetbrains.annotations.TestOnly;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

@Service("BookService")
@Transactional(rollbackFor = Exception.class)
public class BookServiceImpl implements BookService {

    @Resource
    private BookDao bookDao;


    @Override
    public int addBook(Book book) {
        //设置图书为未确认类型
        book.setStatus(Invariable.BOOK_STATUS_AFFIRM_NOT);
        //设置图书添加的时间
        book.setCreateDate(new Date());
        return bookDao.addBook(book);
    }

    @Override
    public List<Book> getAllHotBook(Double latitude, Double longitude) {
        List<Book> books = new ArrayList<Book>();
        int ci = 1;
        while (books.size() <= 9 && ci <= 5) {
            books = bookDao.getAllHotBook(latitude, longitude, Invariable.POSITION_SCOPE * ci);
            ci++;
        }
        for (Book b : books) {
            b.setDistance(Invariable.getDistance(longitude, latitude, b.getLongitude(), b.getLatitude()));
        }
        Collections.sort(books, new Comparator<Book>() {
            @Override
            public int compare(Book o1, Book o2) {
                if (o1.getDistance() - o2.getDistance() > 0) return 1;
                else return -1;
            }
        });
        return books;
    }

    @Override
    public void updateBook(Book book) {

    }

    @Override
    public List<Borrow> getBorrowBookByUser(int id) {
        return bookDao.getBorrowBookByUser(id);
    }

    @Override
    public List<Book> getMyBook(int id) {
        return bookDao.getMyBook(id);
    }

    @Override
    public List<Collect> getCollectBookByUser(int id) {
        return bookDao.getCollectBookByUser(id);
    }

    @Override
    public List<Reserve> getReserveBookByUser(int id) {
        List<Reserve> reserves = bookDao.getReserveBookByUser(id);
        for (Reserve r : reserves) {
            r.setRanking(bookDao.getSizeReserveBeforeThis(r.getId(), r.getReserveDate()));
        }
        Collections.sort(reserves, new Comparator<Reserve>() {
            @Override
            public int compare(Reserve o1, Reserve o2) {
                int ranking = o1.getRanking() - o2.getRanking();
                long date = o1.getReserveDate().getTime() - o2.getReserveDate().getTime();
                if (ranking > 0) return 1;
                if (date > 0) return 1;
                return -1;
            }
        });
        return reserves;
    }

    @Override
    public void reserveBook(int book_id, int user_id) {
        bookDao.reserveBook(book_id, user_id);
    }

    @Override
    public void reserveBookCancel(int book_id, int user_id) {
        bookDao.reserveBookCancel(book_id, user_id);
    }

    @Override
    public List<Book> getUnVerifyBook(int status) {
        return bookDao.getUnVerifyBook(status);
    }

    @Override
    public void verifyBook(int id, int status) {
        bookDao.verifyBook(id, status);
    }

    @Override
    public int getSizeVerifyBook(boolean verify) {
        if (verify) {
            int[] status = {Invariable.BOOK_STATUS_AFFIRM_FALSE, Invariable.BOOK_STATUS_AFFIRM_NOT};
            return bookDao.getSizeVerifyBook(status);
        } else {
            int[] status = {Invariable.BOOK_STATUS_AFFIRM_NOT};
            return bookDao.getSizeVerifyBook(status);
        }
    }

    @Override
    public int getBookStatus(int book_id) {
        return bookDao.getBookStatus(book_id);
    }

    @Override
    public int getBookOwner(int book_id) {
        return bookDao.getBookOwner(book_id);
    }

    @Override
    public void addBorrow(int book_id, int owner_id) {
        bookDao.addBorrow(book_id, owner_id, Invariable.BORROW_TEMPORARY);
    }

    @Override
    public int getCurrentBorrowId(int book_id) {
        Integer currentBorrowId = bookDao.getCurrentBorrowId(book_id);
        if (null != currentBorrowId) return -1;
        else return currentBorrowId;
    }

    @Override
    public void deleteMyBook(int book_id) {
        bookDao.deleteMyBook(book_id);
    }

    @Override
    public void changeBookOwner(int book_id, int nextOwner) {
        bookDao.changeBookOwner(book_id, nextOwner);
    }

    @Override
    public List<Borrow> getBookBorrow(int book_id) {
        return bookDao.getBookBorrow(book_id);
    }

    @Override
    public boolean getUserBorrowIt(int book_id, int user_id) {
        Integer status = bookDao.getUserBorrowIt(book_id, user_id);
        if (status != null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Book getBookBaseInfo(int book_id) {
        return bookDao.getBookBaseInfo(book_id);
    }

    @Override
    public int getBookCurrentBorrow(int book_id) {
        return bookDao.getBookCurrentBorrow(book_id);
    }

    @Override
    public Book getAutomaticReplenishmentBookInfo(String book_name) {
        book_name = "'%" + book_name + "%'";
        return bookDao.getAutomaticReplenishmentBookInfo(book_name);
    }

    @Override
    public List<String> getBookNameByCondition(String condition) {
        condition = "'%" + condition + "%'";
        return bookDao.getBookNameByCondition(condition);
    }

    @Override
    public List<Book> getBooksByCondition(String condition) {
        condition = "'%" + condition + "%'";
        return bookDao.getBooksByCondition(condition);
    }


}
