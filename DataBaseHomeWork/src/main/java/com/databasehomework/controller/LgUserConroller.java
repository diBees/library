package com.databasehomework.controller;
import com.databasehomework.model.User;
import com.databasehomework.model.UserCustom;
import com.databasehomework.service.UserLgService;
import com.databasehomework.service.UserRgService;
import com.databasehomework.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/useres")
public class LgUserConroller
{
    @Autowired
    UserLgService userLgService;
    @Autowired
    UserRgService userRgService;
    @Autowired
    UserService userService;

    @RequestMapping("login")
    @ResponseBody
    public UserCustom login(HttpServletRequest request) throws IOException, ServletException
    {
        int flag = 0;
        try{
            flag = userLgService.login(request);
        }catch (Exception o){
            System.out.println("controller:传到service出现错误");
            o.printStackTrace();

        }
        if(flag >0){
            User user = userLgService.getUser(request.getParameter("uphone"));
            UserCustom userCustom = new UserCustom();
            userCustom.setUname(user.getUname());
            userCustom.setUpass(user.getUpass());
            userCustom.setUpower(user.getUpower());
            userCustom.setUsex(user.getUsex());
            userCustom.setUid(user.getUid());
            userCustom.setFlag(flag);
            return userCustom;
        }
        else {
            UserCustom userCustom = new UserCustom();
            userCustom.setFlag(flag);
            return userCustom;
        }
    }

    @RequestMapping("register")
    @ResponseBody
    public UserCustom register(HttpServletRequest request) throws IOException, ServletException{
        int flag = 0;
        try{
            flag = userRgService.register(request);
        }catch (Exception o){
            System.out.println("controller:传到service出现错误");
            o.printStackTrace();
        }
        UserCustom userCustom = new UserCustom();
        if(flag>0){

            userCustom.setFlag(flag);
            return userCustom;

        }else {

            userCustom.setFlag(flag);
            return userCustom;

        }
    }

    @RequestMapping("findAllUser")
    @ResponseBody
    public List<User> findAllUser(HttpServletRequest request){
        List<User> users = userService.findAllUser();
        return users;
    }

    @RequestMapping("changerPass")
    @ResponseBody
    public Map<String,Object> changerPass(HttpServletRequest request) throws IOException, ServletException
    {
        int flag = 0;
        try{
            flag = userLgService.changePass(request);
        }catch (Exception o){
            System.out.println("controller:传到service出现错误");
            o.printStackTrace();
        }
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("flag",flag);
        return map;
    }
    @RequestMapping("findUser")
    @ResponseBody
    public User findUser(int uid){
        User user = userService.findUserById(uid);
        return user;
    }


    @RequestMapping("updateUser")
    @ResponseBody
    public Map<String,Object> updateUser(User user)
    {
        int flag = 0;
        flag = userService.updateUserInfor(user);


        Map<String,Object> map = new HashMap<String,Object>();
        map.put("flag",flag);
        return map;
    }






}
