package com.ifan.book.model;

public class User extends Common {

    private String password;// 密码
    private Integer sizeHaveBook;//拥有的图书

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSizeHaveBook() {
        return sizeHaveBook;
    }

    public void setSizeHaveBook(Integer sizeHaveBook) {
        this.sizeHaveBook = sizeHaveBook;
    }

    @Override
    public String toString() {
        return "User{" +
                "password='" + password + '\'' +
                ", sizeHaveBook=" + sizeHaveBook +
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
