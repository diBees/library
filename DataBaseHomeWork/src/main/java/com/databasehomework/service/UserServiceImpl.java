package com.databasehomework.service;

import com.databasehomework.dao.UserMapper;
import com.databasehomework.model.User;
import com.databasehomework.utils.AppMD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService
{
    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> findAllUser()
    {
        List<User> users = userMapper.findAllUser();
        return users;
    }

    @Override
    public User findUserById(int uid)
    {
        User user = userMapper.findUserById(uid);
        return user;
    }

    @Override
    public int updateUserInfor(User user)
    {
        String pass = user.getUpass();
        String md5 = "";
        md5 = AppMD5Util.getMD5(pass);
        user.setUpass(md5);

        int flag = userMapper.updateInfor(user);

        return flag;
    }

    @Override
    public int insertImage(User user)
    {

        int flag = userMapper.insertImage(user);
        return flag;
    }
}
