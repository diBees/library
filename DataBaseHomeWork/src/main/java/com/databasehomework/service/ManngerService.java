package com.databasehomework.service;

import com.databasehomework.model.Record;

import java.util.List;

public interface ManngerService
{

    List<Record> findManngerOper();
    List<Record> returnManngerOper();
    int approveBorrowBook(int ubid);
    int approveReturnBook(int ubid);
    List<Record> getRecordInfor(String input);
    int delectBookById(int bid);
    int delectAnnouncement();
    int insertAnnouncement(String asummary);
    List<Record> getAllRecord(int uid);
}
