package com.book.service;

import java.util.List;

import com.book.dao.TrolleyDao;
import com.book.entity.Order_detail;
import com.book.entity.Order_list;
import com.book.entity.Trolley;

public class TrolleyService {
	TrolleyDao td=new TrolleyDao();
	//trolley
	public boolean addTro(Trolley tro) {
		return td.addTro(tro)>0?true:false;
	}
	
	public Trolley checkTro(int uid,int bid) {
		return td.checkTro(uid, bid);
	}
	public boolean updateTro(Trolley tro) {
		return td.updateTro(tro)>0?true:false;
	}
	
	//eg:bids="1,2,3"
	public boolean deleteBybids(String bids,int uid) {
		return td.deleteBybids(bids,uid)>0?true:false;
	}
	public int deleteByT(int tid) {
		return td.deleteByT(tid);
	}
	public List<Trolley> findAllTro(int uid) {
		return td.findAllTro(uid);
	}
	//list
	//·µ»Øoid
	public int addOrd(Order_list oList) {
		return td.addOrd(oList).getOid();
	}
	public List<Order_list> findOrd(int uid){
		return td.findOrd(uid);
	}
	public boolean setState(int oid) {
		return td.setState(oid)>0?true:false;
	}
	
	//Detial
	public boolean addDetial(int oid,String bids,String numbers) {
		return td.addDetial(oid, bids, numbers)>0?true:false;
	}
	public Order_detail findDetailByO(int oid) {
		return td.findDetailByO(oid);
	}
	public List<Order_detail> findDetailByU(int uid) {
		return td.findDetailByU(uid);
	}
	
	//¸ù¾ÝoidÉ¾³ý
	public boolean delOrd(int oid) {
		return td.delOrd(oid)>0?true:false;
	}
}
