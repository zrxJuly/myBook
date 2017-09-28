package com.ifan.book.model;

import java.util.Date;

/**
 * 图书的借阅信息
 */
public class Borrow extends Book{
    protected Date borrowDate;//借阅时间
    protected Date returnDate;//还书时间
    protected int status;//状态
    // 在手中：1 不在手中：0
    protected String comment;//下一位借阅人对当前借阅人的和图书的评价
    protected Float giveMark;//下一位借阅人对当前借阅人的评分

    public Date getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Float getGiveMark() {
        return giveMark;
    }

    public void setGiveMark(Float giveMark) {
        this.giveMark = giveMark;
    }

    @Override
    public String toString() {
        return "Borrow{" +
                "borrowDate=" + borrowDate +
                ", returnDate=" + returnDate +
                ", status=" + status +
                ", comment='" + comment + '\'' +
                ", giveMark=" + giveMark +
                ", author='" + author + '\'' +
                ", press='" + press + '\'' +
                ", translator='" + translator + '\'' +
                ", price=" + price +
                ", owner=" + owner +
                ", distance=" + distance +
                ", id=" + id +
                ", account='" + account + '\'' +
                ", name='" + name + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", intro='" + intro + '\'' +
                ", createDate=" + createDate +
                ", image='" + image + '\'' +
                ", integral=" + integral +
                ", status=" + status +
                ", sizeComment=" + sizeComment +
                ", sizeCollect=" + sizeCollect +
                ", sizeBorrow=" + sizeBorrow +
                ", sizeReserve=" + sizeReserve +
                '}';
    }
}
