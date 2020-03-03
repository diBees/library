package com.databasehomework.model;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;


public class Record {
	private int ubid;
	private int uid;
	private int bid;
	private int ubflag;
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date startDate;
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date endDate;
	private Book book;
	private User user;

	public Book getBook()
	{
		return book;
	}

	public void setBook(Book book)
	{
		this.book = book;
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	public int getUbid() {
		return ubid;
	}

	public void setUbid(int ubid) {
		this.ubid = ubid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getUbflag() {
		return ubflag;
	}

	public void setUbflag(int ubflag) {
		this.ubflag = ubflag;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
}
