package com.databasehomework.controller;

import com.databasehomework.model.Record;
import com.databasehomework.model.RecordCustom;
import com.databasehomework.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/records")
public class RecordConrroller
{
    @Autowired
    RecordService recordService;

    @RequestMapping("getPartBook")
    @ResponseBody
    public List<RecordCustom> getPartBook(int uid){

        List<RecordCustom> recordCustoms = recordService.getPartNoReturnRecord(uid);
        return recordCustoms;
    }
}
