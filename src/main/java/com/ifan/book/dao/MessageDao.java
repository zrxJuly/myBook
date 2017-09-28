package com.ifan.book.dao;

import com.ifan.book.model.Message;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageDao {
    void addMessage(Message message);
}
