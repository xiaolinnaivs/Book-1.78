package com.book.entity;

import java.util.Date;

public class Order_list {
	private int uid;
	private int oid;
	private double sum_price;
	private int state;
	private int log;
	private Date create_time;
	
	
	
	
	public Order_list() {}
	
	public Order_list(int uid, double sum_price, Date datetime) {
		super();
		this.uid = uid;
		this.sum_price = sum_price;
		this.create_time = datetime;
		this.state=0;
		this.log=0;
	}
	
	public int getLog() {
		return log;
	}

	public void setLog(int log) {
		this.log = log;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public double getSum_price() {
		return sum_price;
	}
	public void setSum_price(double sum_price) {
		this.sum_price = sum_price;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date datetime) {
		this.create_time = datetime;
	}
	
	
	
}
