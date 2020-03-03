package com.databasehomework.dao;

import com.databasehomework.model.Announcement;
import com.databasehomework.model.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface MenuMapper
{

    List<Menu> findMenuByObj(String upower);
    Announcement findLastAnnouncement();

}
