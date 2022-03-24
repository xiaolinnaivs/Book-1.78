package com.book.entity;

import java.util.Date;

public class User {
	public User() {}
	public User(int uid, String username, String email, String uphone, String upwd, int manager, Date create_time,
			String upic) {
		
		this.uid = uid;
		this.username = username;
		this.email = email;
		this.uphone = uphone;
		this.upwd = upwd;
		this.manager = manager;
		this.create_time = create_time;
		this.upic = upic;
	}
	public User(String username, String email, String uphone, String upwd, int manager, Date create_time, String upic) {
		
		this.username = username;
		this.email = email;
		this.uphone = uphone;
		this.upwd = upwd;
		this.manager = manager;
		this.create_time = create_time;
		this.upic = upic;
	}
	public User(String username, String email, String uphone, String upwd, Date create_time, String upic) {
		
		this.username = username;
		this.email = email;
		this.uphone = uphone;
		this.upwd = upwd;
		this.create_time = create_time;
		this.upic = upic;
	}
	public User(String username, String email, String uphone, String upwd, Date create_time) {
		
		this.username = username;
		this.email = email;
		this.uphone = uphone;
		this.upwd = upwd;
		this.create_time = create_time;
	}

	private int uid;
	private String username;
	private String email;
	private String uphone;
	private String upwd;
	private int manager;
	private Date create_time;
	private String upic;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getUpic() {
		return upic;
	}
	public void setUpic(String upic) {
		this.upic = upic;
	}
	
}
