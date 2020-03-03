package com.databasehomework.model;

public class Book {
	//书籍编号
	private int bid;
	//书籍名称
	private String bname;
	//书籍作者
	private String bauthor;
	//出版社
	private String bpress;
	//书籍简介
	private String bsummary;
	//借阅量
	private int bvolume;

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBauthor() {
		return bauthor;
	}

	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}

	public String getBsummary() {
		return bsummary;
	}

	public void setBsummary(String bsummary) {
		this.bsummary = bsummary;
	}

	public int getBvolume() {
		return bvolume;
	}

	public void setBvolume(int bvolume) {
		this.bvolume = bvolume;
	}

	public String getBpress() {
		return bpress;
	}

	public void setBpress(String bpress) {
		this.bpress = bpress;
	}

	@Override
	public String toString() {
		return "Book [bname=" + bname + ", bauthor=" + bauthor + ", bsummary=" + bsummary + "]";
	}
	
	
}
