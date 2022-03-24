package com.book.entity;

import java.util.Date;

public class Book {
	public Book() {}
	public Book(int cid, String bname, String author, double price, String description, String pic, int state,
			Date create_time) {
		
		this.cid = cid;
		this.bname = bname;
		this.author = author;
		this.price = price;
		this.description = description;
		this.pic = pic;
		this.state = state;
		this.create_time = create_time;
	}
	public Book(int bid, int cid, String bname, String author, double price, String description, String pic, int state,
			Date create_time) {
		
		this.bid = bid;
		this.cid = cid;
		this.bname = bname;
		this.author = author;
		this.price = price;
		this.description = description;
		this.pic = pic;
		this.state = state;
		this.create_time = create_time;
	}
	private int bid;
	private int cid;
	private Category category;
	private String bname;
	private String author;
	private double price;
	private String description;
	private String pic;
	private int state;
	private Date create_time;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
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
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
}
