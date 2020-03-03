package com.databasehomework.service;

import com.databasehomework.dao.MenuMapper;
import com.databasehomework.model.Announcement;
import com.databasehomework.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService
{
    @Autowired
    MenuMapper menuMapper;
    @Override
    public List<Menu> getMenuBypower(HttpServletRequest request) throws IOException, ServletException
    {
        List<Menu> menus = null;
        try{
                menus = menuMapper.findMenuByObj(request.getParameter("upower"));

        }catch (Exception o){
            System.out.println("service: chu xian cuo wu");
            o.printStackTrace();
        }
        return menus;
    }

    @Override
    public Announcement getAnnouncement()
    {
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Announcement announcement = menuMapper.findLastAnnouncement();
        Announcement announcement1 = new Announcement();
        return announcement;
    }
}
