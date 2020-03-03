package com.databasehomework.service;

import com.databasehomework.dao.UserMapper;
import com.databasehomework.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestUserImpl implements TestUser
{
    @Autowired
    UserMapper userMapper;
    @Override
    public User getUser(String name)
    {
        User user = new User();
        return user;
    }
}
