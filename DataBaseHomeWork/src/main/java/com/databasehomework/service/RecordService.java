package com.databasehomework.service;

import com.databasehomework.model.RecordCustom;

import java.util.List;

public interface RecordService
{
    List<RecordCustom> getPartNoReturnRecord(int uid);

}
