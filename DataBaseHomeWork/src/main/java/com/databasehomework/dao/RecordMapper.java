package com.databasehomework.dao;

import com.databasehomework.model.Record;
import com.databasehomework.model.RecordCustom;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecordMapper
{
     List<RecordCustom> findByUserPart(int uid);
}
