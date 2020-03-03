package com.databasehomework.dao;

import com.databasehomework.model.Book;
import com.databasehomework.model.Record;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BookMapper
{

     List<Book> getAllBook();
     List<Book> getBookBySelective(@Param("content1") String content1 , @Param("content2")String content2 , @Param("content3")String content3 );
     int borrowBookByObj(Record record);
     int delectRecord(int uid);
     Book getBookById(int bid);
     int updateBookInfor(Book book);
     int insertBookInfor(Book book);


}
