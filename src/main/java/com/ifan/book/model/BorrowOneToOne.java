package com.ifan.book.model;

/**
 * 描述一对一借阅
 */
public class BorrowOneToOne extends Borrow {
    private int letf_user_id; // 交换人 A 的id
    private int letf_book_id; // 交换人 A 使用的交换图书id
    private int right_user_id;// 交换人 B 的id
    private int right_book_id;// 交换人 B 使用的交换图书id

    public int getLetf_user_id() {
        return letf_user_id;
    }

    public void setLetf_user_id(int letf_user_id) {
        this.letf_user_id = letf_user_id;
    }

    public int getLetf_book_id() {
        return letf_book_id;
    }

    public void setLetf_book_id(int letf_book_id) {
        this.letf_book_id = letf_book_id;
    }

    public int getRight_user_id() {
        return right_user_id;
    }

    public void setRight_user_id(int right_user_id) {
        this.right_user_id = right_user_id;
    }

    public int getRight_book_id() {
        return right_book_id;
    }

    public void setRight_book_id(int right_book_id) {
        this.right_book_id = right_book_id;
    }

    @Override
    public String toString() {
        return "BorrowOneToOne{" +
                "letf_user_id=" + letf_user_id +
                ", letf_book_id=" + letf_book_id +
                ", right_user_id=" + right_user_id +
                ", right_book_id=" + right_book_id +
                ", borrowDate=" + borrowDate +
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
