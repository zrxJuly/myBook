package com.ifan.book.dao;


import com.ifan.book.model.Comment;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDao {

    void addComment(Comment comment);
}
