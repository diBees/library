package com.databasehomework.service;

import com.databasehomework.dao.ManngerMapper;
import com.databasehomework.model.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ManngerServiceImpl implements ManngerService
{

    @Autowired
    ManngerMapper manngerMapper;
    @Override
    public List<Record> findManngerOper()
    {
        List<Record> records = manngerMapper.findManngerOper();
        return records;
    }

    @Override
    public List<Record> returnManngerOper()
    {
        List<Record> records = manngerMapper.returnManngerOper();
        return records;
    }

    @Override
    public int approveBorrowBook(int ubid)
    {
        int flag = 0;
        flag = manngerMapper.approveBorrowBook(ubid);

        return flag;
    }

    @Override
    public int approveReturnBook(int ubid)
    {
        int flag = 0;
        flag = manngerMapper.approveReturnBook(ubid);
        return flag;
    }

    @Override
    public List<Record> getRecordInfor(String input)
    {
        List<Record> records = manngerMapper.findRecordInfor(input);
        return records;
    }

    @Override
    public int delectBookById(int bid)
    {
        int flag = 0;
        flag = manngerMapper.delectBook(bid);
        return flag;
    }

    @Override
    public int delectAnnouncement()
    {
        int flag = manngerMapper.updateAnnouncement();
        return flag;
    }

    @Override
    public int insertAnnouncement(String asummary)
    {
        int flag = manngerMapper.insertAnnouncement(asummary);
        return flag;
    }

    @Override
    public List<Record> getAllRecord(int uid)
    {
        List<Record> records = manngerMapper.findAllRecordAndBook(uid);
        return records;
    }
}
