package com.databasehomework.service;

import com.databasehomework.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public interface UserLgService
{
    int login(HttpServletRequest request) throws IOException, ServletException;
    User getUser(String uphone);
    int changePass(HttpServletRequest request) throws IOException, ServletException;
}
