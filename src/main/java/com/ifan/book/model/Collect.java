package com.ifan.book.model;

import java.util.Date;

/**
 * 图书的收藏信息
 */
public class Collect extends Book {

    private Date collectDate;//收藏时间

    public Date getCollectDate() {
        return collectDate;
    }

    public void setCollectDate(Date collectDate) {
        this.collectDate = collectDate;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "collectDate=" + collectDate +
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

