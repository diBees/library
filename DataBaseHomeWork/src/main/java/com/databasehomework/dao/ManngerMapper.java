package com.databasehomework.dao;

import com.databasehomework.model.Record;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ManngerMapper
{
    /*
	状态说明
	1：申请借阅
	2：正在借阅
	-1：申请归还
	0：已经归还
	*/

    List<Record> findManngerOper();
    List<Record> returnManngerOper();
    int approveBorrowBook(int ubid);
    int approveReturnBook(int ubid);
    List<Record> findRecordInfor(String input);
    int delectBook(int bid);
    int insertAnnouncement(String asummary);
    int updateAnnouncement();
    List<Record> findAllRecordAndBook(int uid);

}
