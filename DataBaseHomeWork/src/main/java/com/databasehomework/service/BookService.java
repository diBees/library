package com.databasehomework.service;

import com.databasehomework.model.Book;
import com.databasehomework.model.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService
{
    List<Book> findAllBook();
    List<Book> findPartBook( String content1 ,String content2 ,String content3);
    int borrowBook(Record record);
    int delectRecord(int ubid);
    Book findBookById(int bid);
    int updateBookInfor(Book book);
    int insertBookInfor(Book book);
}
