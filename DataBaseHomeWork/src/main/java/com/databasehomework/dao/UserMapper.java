package com.databasehomework.dao;

import com.databasehomework.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper
{
    User findUserByName(String name);
    User findUserByObj(User user);
    int insertUser(User user);
    List<User> findAllUser();
    int changePass(User user);
    User findUserById(int uid);
    int updateInfor(User user);
    int insertImage(User user);


}
