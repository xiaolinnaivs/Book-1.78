package com.book.entity;

public class Order_detail {
	private int oid;
	private String bids;
	private String numbers;
	
	
	public Order_detail() {}
	
	public Order_detail(String bids, String numbers) {
		super();
		this.bids = bids;
		this.numbers = numbers;
	}

	public Order_detail(int oid, String bids, String numbers) {
		super();
		this.oid = oid;
		this.bids = bids;
		this.numbers = numbers;
	}
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getBids() {
		return bids;
	}
	public void setBids(String bids) {
		this.bids = bids;
	}
	public String getNumbers() {
		return numbers;
	}
	public void setNumbers(String numbers) {
		this.numbers = numbers;
	}
	
	
	
}
