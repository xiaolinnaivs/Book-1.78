package com.book.entity;

public class Trolley {
	private int tid;
	private int uid;
	private int bid;
	private int number;
	private double price;
	
	
	
	
	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}
	
	public Trolley() {}
	
	
	public Trolley(int uid, int bid, double price) {
		
		this.uid = uid;
		this.bid = bid;
		this.price = price;
	}
	
	
	public Trolley(int tid, int uid, int bid, int number, double price) {
		super();
		this.tid = tid;
		this.uid = uid;
		this.bid = bid;
		this.number = number;
		this.price = price;
	}
	
	public Trolley(int uid, int bid, int number, double price) {
		super();
		this.uid = uid;
		this.bid = bid;
		this.number = number;
		this.price = price;
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
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
