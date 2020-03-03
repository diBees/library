package com.databasehomework.controller;

import com.databasehomework.model.Record;
import com.databasehomework.model.UserCustom;
import com.databasehomework.service.ManngerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manngers")
public class ManngerController
{

    @Autowired
    ManngerService manngerService;
    @ResponseBody
    @RequestMapping("findMangerBorrowServlet")
    public List<Record> findMangerBorrowServlet(){
        List<Record> records = manngerService.findManngerOper();
        return records;
    }

    @ResponseBody
    @RequestMapping("findMangerReturnServlet")
    public List<Record> findMangerReturnServlet(){
        List<Record> records = manngerService.returnManngerOper();
        return records;
    }
    @RequestMapping("mBorrow")
    @ResponseBody
    public UserCustom mBorrowBook(int ubid){
        UserCustom userCustom = new UserCustom();
        int flag = 0;
        flag = manngerService.approveBorrowBook(ubid);
        userCustom.setFlag(flag);
        return userCustom;
    }

    @RequestMapping("mReturn")
    @ResponseBody
    public UserCustom mReturnBook(int ubid){
        UserCustom userCustom = new UserCustom();
        int flag = 0;
        flag = manngerService.approveReturnBook(ubid);
        userCustom.setFlag(flag);
        return userCustom;
    }
    @RequestMapping("findRecordByMannger")
    @ResponseBody
    public List<Record> findRecordByMannger(String input){
        List<Record> records = manngerService.getRecordInfor(input);
        return records;
    }
    @RequestMapping("delectBookMannger")
    @ResponseBody
    public Map<String,Object> delectBookMannger(int bid){
        Map<String,Object> resultMap = new HashMap<String,Object>();
        int flag = 0;
        flag = manngerService.delectBookById(bid);
        resultMap.put("flag",flag);
        return resultMap;
    }

    @RequestMapping("updateAnnouncement")
    @ResponseBody
    public Map<String,Object> updateAnnouncement(String summary){
        Map<String,Object> resultMap = new HashMap<String,Object>();
        int flag = 0;
        int flag1 = 0;
        flag1 = manngerService.delectAnnouncement();
        flag = manngerService.insertAnnouncement(summary);

        if(flag >0 && flag1 >0){
            resultMap.put("flag",1);
            return resultMap;
        }else {
            resultMap.put("flag",0);
            return resultMap;
        }

    }

    @RequestMapping("findAllRecord")
    @ResponseBody
    public List<Record> findAllRecord(int uid){
        List<Record> records = manngerService.getAllRecord(uid);
        return records;
    }






}
