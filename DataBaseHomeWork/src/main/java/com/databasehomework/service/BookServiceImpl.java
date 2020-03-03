package com.databasehomework.service;

import com.databasehomework.dao.BookMapper;
import com.databasehomework.model.Book;
import com.databasehomework.model.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BookServiceImpl implements BookService
{
    @Autowired
    BookMapper bookMapper;
    @Override
    public List<Book> findAllBook()
    {
        List<Book> books = bookMapper.getAllBook();
        return books;
    }

    @Override
    public List<Book> findPartBook(String content1, String content2, String content3)
    {
        List<Book> books = bookMapper.getBookBySelective(content1,content2,content3);
        return books;
    }

    @Override
    public int borrowBook(Record record)
    {
        int flag = 0;
        flag = bookMapper.borrowBookByObj(record);
        return flag ;
    }

    @Override
    public int delectRecord(int ubid)
    {
        int flag = 0;
        flag = bookMapper.delectRecord(ubid);
        return flag;
    }

    @Override
    public Book findBookById(int bid)
    {
        Book book = bookMapper.getBookById(bid);
        return book;
    }

    @Override
    public int updateBookInfor(Book book)
    {
        int flag = bookMapper.updateBookInfor(book);

        return flag;
    }
    @Override
    public int insertBookInfor(Book book)
    {
        int flag = bookMapper.insertBookInfor(book);

        return flag;
    }
}
