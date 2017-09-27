package com.ifan.book.model;

import java.util.Date;

public class Reserve extends Book{

    private Date reserveDate;//预约时间
    private int ranking;//预约排名

    public Date getReserveDate() {
        return reserveDate;
    }

    public void setReserveDate(Date reserveDate) {
        this.reserveDate = reserveDate;
    }

    public int getRanking() {
        return ranking;
    }

    public void setRanking(int ranking) {
        this.ranking = ranking;
    }
}
