package com.databasehomework.model;

public class Menu {

	private int pid;

	private String pname;

	private String purl;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPurl() {
		return purl;
	}

	public void setPurl(String purl) {
		this.purl = purl;
	}

	@Override
	public String toString() {
		return "Menu [pid=" + pid + ", pname=" + pname + ", purl=" + purl + "]";
	}

}
