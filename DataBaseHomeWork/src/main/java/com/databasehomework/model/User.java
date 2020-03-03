package com.databasehomework.model;

public class User {
	//用户编号
	private int uid;
	//用户手机号（登陆账号）
	private String uphone;
	//用户密码
	private String upass;
	//用户名
	private String uname;
	//用户性别
	private String usex;
	//用户权限(普通用户为1，管理员为2)
	private int upower;
	private String userurl;

	public String getUserurl()
	{
		return userurl;
	}

	public void setUserurl(String userurl)
	{
		this.userurl = userurl;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUsex() {
		return usex;
	}

	public void setUsex(String usex) {
		this.usex = usex;
	}

	public int getUpower() {
		return upower;
	}

	public void setUpower(int upower) {
		this.upower = upower;
	}
	
	
}
