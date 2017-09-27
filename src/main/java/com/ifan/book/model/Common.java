package com.ifan.book.model;

import java.util.Date;

public class Common {

    protected Integer id;//id
    protected String account;//编号和账号
    protected String name;//书名和昵称
    protected Double latitude;//纬度
    protected Double longitude;//经度
    protected String intro;//简介
    protected Date createDate;//创建时间
    protected String image;//图书封面或头像
    protected Float integral;//获取该书需要的积分或者用户当前的积分
    protected int status;//状态
    // 图书：流动 一对一 售出 未确认
    // 用户：普通 书店 图书馆 管理员
    protected int sizeComment; // 评论数量
    protected int sizeCollect; // 收藏数量
    protected int sizeBorrow;  // 阅读数量
    protected int sizeReserve; // 预约数量

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Float getIntegral() {
        return integral;
    }

    public void setIntegral(Float integral) {
        this.integral = integral;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getSizeComment() {
        return sizeComment;
    }

    public void setSizeComment(int sizeComment) {
        this.sizeComment = sizeComment;
    }

    public int getSizeCollect() {
        return sizeCollect;
    }

    public void setSizeCollect(int sizeCollect) {
        this.sizeCollect = sizeCollect;
    }

    public int getSizeBorrow() {
        return sizeBorrow;
    }

    public void setSizeBorrow(int sizeBorrow) {
        this.sizeBorrow = sizeBorrow;
    }

    public int getSizeReserve() {
        return sizeReserve;
    }

    public void setSizeReserve(int sizeReserve) {
        this.sizeReserve = sizeReserve;
    }

    @Override
    public String toString() {
        return "Common{" +
                "id=" + id +
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

