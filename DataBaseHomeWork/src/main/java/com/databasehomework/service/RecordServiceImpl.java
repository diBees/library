package com.databasehomework.service;

import com.databasehomework.dao.RecordMapper;
import com.databasehomework.model.Record;
import com.databasehomework.model.RecordCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RecordServiceImpl implements RecordService
{
    @Autowired
    RecordMapper recordMapper;
    @Override
    public List<RecordCustom> getPartNoReturnRecord(int uid)
    {
        List<RecordCustom> recordCustoms = recordMapper.findByUserPart(uid);
        return recordCustoms;
    }
}
