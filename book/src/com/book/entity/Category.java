package com.book.entity;

import java.util.Date;

public class Category {
	public Category() {}
	public Category(String cname, int state, int order_number, Date create_time) {
		
		this.cname = cname;
		this.state = state;
		this.order_number = order_number;
		this.create_time = create_time;
	}
	public Category(int cid, String cname, int state, int order_number, Date create_time) {
		
		this.cid = cid;
		this.cname = cname;
		this.state = state;
		this.order_number = order_number;
		this.create_time = create_time;
	}
	private int cid;
	private String cname;
	private int state;
	private int order_number;
	private Date create_time;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
}
