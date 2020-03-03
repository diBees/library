package com.databasehomework.service;

import com.databasehomework.model.User;

import java.util.List;

public interface UserService
{
    List<User> findAllUser();
    User findUserById(int uid);
    int updateUserInfor(User user);
    int insertImage(User user);
}
