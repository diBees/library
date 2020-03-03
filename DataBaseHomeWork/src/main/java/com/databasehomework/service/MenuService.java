package com.databasehomework.service;

import com.databasehomework.model.Announcement;
import com.databasehomework.model.Menu;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface MenuService
{
    List<Menu> getMenuBypower(HttpServletRequest request) throws IOException, ServletException;
    Announcement getAnnouncement();
}
