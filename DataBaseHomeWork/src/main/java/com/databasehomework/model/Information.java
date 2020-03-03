package com.databasehomework.model;

import java.util.Date;

public class Information {
	
	private int id;
	
	private int uid;
	
	private Date late;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Date getLate() {
		return late;
	}

	public void setLate(Date late) {
		this.late = late;
	}
	
}
