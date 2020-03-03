package com.databasehomework.controller;

import com.databasehomework.model.Announcement;
import com.databasehomework.model.Menu;
import com.databasehomework.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/menus")
public class MenuController
{
    @Autowired
    MenuService menuService;

    @RequestMapping("menu")
    @ResponseBody
    public List<Menu> findMenu(HttpServletRequest request)throws IOException, ServletException{
        List<Menu> menus = null;
        try
        {
            menus = menuService.getMenuBypower(request);
        }catch (Exception o){
            System.out.println("controller:error");
            o.printStackTrace();
        }
        return menus;
    }
    @RequestMapping("announce")
    @ResponseBody
    public Announcement findAnnouncement(){
        Announcement announcement = menuService.getAnnouncement();
        return announcement;
    }
}
