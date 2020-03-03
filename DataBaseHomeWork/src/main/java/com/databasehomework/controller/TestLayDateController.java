package com.databasehomework.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/laydate")
public class TestLayDateController
{

    @RequestMapping("dates")
    public void testDate(String dates){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try
        {
            Date date = formatter.parse(dates);
            System.out.println(formatter.format(date));
        }catch (ParseException e){
            e.printStackTrace();
        }



        System.out.println("我操你妈得"+dates);


    }

}
