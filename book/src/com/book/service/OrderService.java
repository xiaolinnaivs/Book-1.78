package com.book.service;

import java.util.List;

import com.book.dao.OrderDao;
import com.book.entity.Book;
import com.book.entity.Category;
import com.book.entity.Order_detail;
import com.book.entity.Order_list;
import com.book.utils.PageTool;

public class OrderService {
	OrderDao od=new OrderDao();
		//list
		//·µ»Øoid
		public int addOrd(Order_list oList) {
			return od.addOrd(oList).getOid();
		}
		public List<Order_list> findOrd(int uid){
			return od.findOrd(uid);
		}
		public boolean setState(String oids) {
			return od.setState(oids)>0?true:false; 
		}
		public boolean setLog(String oids) {
			return od.setLog(oids)>0?true:false;
		}
		
		
		//Detial
		public boolean addDetial(int oid,String bids,String numbers) {
			return od.addDetial(oid, bids, numbers)>0?true:false;
		}
		public Order_detail findDetailByO(int oid) {
			return od.findDetailByO(oid);
		}
		public List<Order_detail> findDetailByoids(String oids) {
			return od.findDetailByoids(oids);
		}
		
		//¸ù¾ÝoidÉ¾³ý
		public boolean delOrd(int oid) {
			return od.delOrd(oid)>0?true:false;
		}
		public boolean delOrds(String oids){
			return od.delOrds(oids)>0?true:false;
		}
		public int getTotalCount() {
			// TODO Auto-generated method stub
			return od.getTotalCount();
		}
		public List<Order_list> findOrdersByPage(PageTool tool) {
			List<Order_list> list= od.findOrdersByPage(tool);
			
			return list;
		}
		public int getTotalCount2(String search) {
			return od.getTotalCount2(search);
		}
		public List<Order_list> findTheOrder(String search, PageTool p2) {
			return od.findTheOrder(search,p2);
		}
}
