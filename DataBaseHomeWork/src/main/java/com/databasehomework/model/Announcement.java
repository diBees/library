package com.databasehomework.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Announcement {
	
	//公告编号
	private int aid;
	//公告内容 
	private String asummary;
	//发布时间
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date aDate;
	//有效标记
	private int aflag;
	
	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getAsummary() {
		return asummary;
	}

	public void setAsummary(String asummary) {
		this.asummary = asummary;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public int getAflag() {
		return aflag;
	}

	public void setAflag(int aflag) {
		this.aflag = aflag;
	}
	
}
