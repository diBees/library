package com.databasehomework.service;

import com.databasehomework.dao.UserMapper;
import com.databasehomework.model.User;
import com.databasehomework.utils.AppMD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@Service
public class UserLgServiceImpl implements UserLgService
{

    @Autowired
    UserMapper userMapper;
    //检测用户
    @Override
    public int login(HttpServletRequest request) throws IOException, ServletException
    {
        String uphone="";
        String upassword="";
        String md5="";
        String check="";
        ;String code="";

        try{
            upassword=request.getParameter("upass");
            uphone = request.getParameter("uphone");
            code = request.getParameter("checkpass");
        }catch (Exception o){
            o.printStackTrace();
            System.out.println("service:出现问题");
        }
        md5 = AppMD5Util.getMD5(upassword);
        User user = userMapper.findUserByName(uphone);
        HttpSession httpSession = request.getSession();
        check = (String)httpSession.getAttribute("code");
        System.out.println("我二哥发送给开发的controller" + check);
        if(check.equals(code)){
            if(user != null){
                if(user.getUpass().equals(md5)){
                    return 1;
                }
                else {
                    System.out.println("密码错误1");
                    return 0;
                }
            }else {
                System.out.println("账号不存在2");
                return -1;
            }
        }
        else {
            return -1;
        }


    }
    //获取user信息
    @Override
    public User getUser(String uphone)
    {
        User user1 = userMapper.findUserByName(uphone);
        return user1;
    }

    @Override
    public int changePass(HttpServletRequest request) throws IOException, ServletException
    {

        String uphone="";
        String upassword="";
        String newpass="";
        String md5="";
        try{
            uphone = request.getParameter("uphone");
            upassword = request.getParameter("oldpass");
            newpass = request.getParameter("newpass");
        }catch (Exception o){
            System.out.println("service:出现错误");
            o.printStackTrace();
            return -999;
        }
        User user = userMapper.findUserByName(uphone);
        md5 = AppMD5Util.getMD5(newpass);
        User user1 = new User();
        user1.setUphone(uphone);
        user1.setUpass(md5);
        int flag = userMapper.changePass(user1);
        if(flag>0){

            return 1;
        }
        else {
            System.out.println("修改失败");
            return 0;
        }
/*        if(user != null){
            user1.setUphone(uphone);
            user1.setUpass(md5);
            int flag = userMapper.changePass(user1);
            if(flag>0){

                return 1;
            }
            else {
                System.out.println("修改失败");
                return 0;
            }
            }
        else {
            System.out.println("账号不存在");
            return -1;
        }*/


    }
}
