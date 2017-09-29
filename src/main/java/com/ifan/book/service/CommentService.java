package com.ifan.book.service;


import com.ifan.book.model.Comment;

public interface CommentService {

    /**
     * 添加评论信息
     * @param comment
     */
    void addComment(Comment comment);

}
