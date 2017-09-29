package com.ifan.book.service.impl;

import com.ifan.book.dao.CommentDao;

import com.ifan.book.model.Comment;
import com.ifan.book.service.CommentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("CommentService")
@Transactional(rollbackFor = Exception.class)
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentDao commentDao;

    @Override
    public void addComment(Comment comment) {
        commentDao.addComment(comment);
    }
}
