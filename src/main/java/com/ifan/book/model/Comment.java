package com.ifan.book.model;

import java.util.Date;

/**
 * 评论
 */
public class Comment {
    private int book_id;
    private int user_id;
    private String comment_content;//评论的内容
    private Date commentDate;//评论的时间
    private int up;//赞同
    private int down;//不赞同

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public int getUp() {
        return up;
    }

    public void setUp(int up) {
        this.up = up;
    }

    public int getDown() {
        return down;
    }

    public void setDown(int down) {
        this.down = down;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "book_id=" + book_id +
                ", user_id=" + user_id +
                ", comment_content='" + comment_content + '\'' +
                ", commentDate=" + commentDate +
                ", up=" + up +
                ", down=" + down +
                '}';
    }
}
