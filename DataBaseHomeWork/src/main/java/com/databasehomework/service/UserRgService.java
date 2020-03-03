package com.databasehomework.service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public interface UserRgService
{
    int register(HttpServletRequest request)throws IOException, ServletException;

}
