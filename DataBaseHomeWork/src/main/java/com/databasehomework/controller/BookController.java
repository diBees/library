package com.databasehomework.controller;

import com.databasehomework.model.Book;
import com.databasehomework.model.Record;
import com.databasehomework.model.UserCustom;
import com.databasehomework.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/books")
public class BookController
{
    @Autowired
    BookService bookService;
    @RequestMapping("findAllBook")
    @ResponseBody
    public List<Book> findAllBook(){
        List<Book> books = bookService.findAllBook();
        return books;
    }

    @RequestMapping("findPartBook")
    @ResponseBody
    public List<Book> selectiveBook(String input1,String input2,String input3){
        List<Book> books = bookService.findPartBook(input1,input2,input3);
        return books;
    }

    @RequestMapping("borrwoBook")
    @ResponseBody
    public Map<String,Object> borrwoBook(Record record){
        Map<String,Object> resultMap = new HashMap<String,Object>();
        int flag = 0;
        flag = bookService.borrowBook(record);
        resultMap.put("flag",flag);
        return resultMap;
    }

    @RequestMapping("returnBook")
    @ResponseBody
    public UserCustom delectRecord(int ubid){
        UserCustom userCustom = new UserCustom();
        int flag = 0;
        flag = bookService.delectRecord(ubid);
        userCustom.setFlag(flag);
        return userCustom;
    }

    @RequestMapping("echoBookInfor")
    @ResponseBody
    public Book echoBookInfor (int bid){
        Book book = bookService.findBookById(bid);
        return book;
    }
    @RequestMapping("updateBook")
    @ResponseBody
    public Map<String,Object> updateBookInfor(Book book){
        Map<String,Object> resultMap = new HashMap<String,Object>();
        int flag = 0;
        flag = bookService.updateBookInfor(book);

        if(flag > 0){

            resultMap.put("flag",1);
            return resultMap;
        }else {
            resultMap.put("flag",0);
            return resultMap;
        }

    }
    @RequestMapping("insertBook")
    @ResponseBody
    public Map<String,Object> insertBookInfor(Book book){
        Map<String,Object> resultMap = new HashMap<String,Object>();
        int flag = 0;
        flag = bookService.insertBookInfor(book);

        if(flag > 0){

            resultMap.put("flag",1);
            return resultMap;
        }else {
            resultMap.put("flag",0);
            return resultMap;
        }

    }




}
