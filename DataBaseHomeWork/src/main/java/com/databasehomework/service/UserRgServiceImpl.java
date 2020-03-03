package com.databasehomework.service;

import com.databasehomework.dao.UserMapper;
import com.databasehomework.model.User;
import com.databasehomework.utils.AppMD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
@Service
public class UserRgServiceImpl implements UserRgService
{
    @Autowired
    UserMapper userMapper;
    @Override
    public int register(HttpServletRequest request) throws IOException, ServletException
    {

        int flag = 0;
        String uphone="";
        String upass="";
        String usex="";
        String uname="";
        String md5="";
        try{
            uphone = request.getParameter("uphone");
            uname = request.getParameter("uname");
            upass = request.getParameter("upass");
            usex = request.getParameter("usex");
        }catch (Exception o){
            System.out.println("service:出现错误");
            o.printStackTrace();
            return -999;
        }
        User user = userMapper.findUserByName(uphone);
        if(user == null){
            int iflag = 0;
            md5 = AppMD5Util.getMD5(upass);
            User user1 = new User();
            user1.setUpass(md5);
            user1.setUphone(uphone);
            user1.setUname(uname);
            user1.setUsex(usex);
            iflag = userMapper.insertUser(user1);
            if(iflag > 0){
                return 1;
            }
            else {
                System.out.println("用户信息插入失败");
                return 0;
            }
        }
        else {
            System.out.println("用户已存在");
            return 0;
        }
    }
}
