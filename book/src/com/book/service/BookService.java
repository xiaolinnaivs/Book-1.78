package com.book.service;

import java.util.List;

import com.book.dao.BookDao;
import com.book.dao.CategoryDao;
import com.book.entity.Book;
import com.book.utils.PageTool;
import com.book.entity.Category;


public class BookService {
	BookDao bd = new BookDao();
	CategoryDao cd = new CategoryDao();
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return bd.getTotalCount();
	}

	public List<Book> findBooksByPage(PageTool tool) {
		// TODO Auto-generated method stub
		List<Book> list= bd.findBooksByPage(tool);
		for (Book book : list) {
			int cid = book.getCid();
			Category category = cd.findCategoryByCid(cid+"");
			book.setCategory(category);
		}
		return list;
	}

	public boolean addBook(Book book) {
		// TODO Auto-generated method stub
		return bd.addBook(book) > 0 ? true : false;
	}

	public boolean deleteBooks(String bids) {
		// TODO Auto-generated method stub
		return bd.deleteBooks(bids) > 0 ? true : false;
	}

	public Book findBookByBid(String bid) {
		// TODO Auto-generated method stub
		return bd.findBookByBid(bid);
	}

	public boolean updateBook(Book book) {
		// TODO Auto-generated method stub
		return bd.updateBook(book)>0?true:false;
	}

	public boolean deleteBookByBid(String bid) {
		// TODO Auto-generated method stub
		return bd.deleteBookByBid(bid)>0?true:false;
	}
	
		public List<Book> findBookByCid(int state,int row){
			return bd.findBookByCid(state, row);
		}
		public List<Book> findBookByCidAll(int state){
			return bd.findBookByCidAll(state);
		}
	
		public List<Book> findBookByState(int state,int row){
			return bd.findBookByState(state, row);
		}
		public int getTotalCount2(String search) {
			return bd.getTotalCount2(search);
		}	
		public List<Book> findTheBook(String search,PageTool p) {//模糊查找书籍信息
			// TODO Auto-generated method stub
			return bd.findTheBook(search,p);
		}
		public List<Book> showBookByPage(PageTool tool) {
			List<Book> list= bd.showBookByPage(tool);
			for (Book book : list) {
				int cid = book.getCid();
				Category category = cd.findCategoryByCid(cid+"");
				book.setCategory(category);
			}
			return list;
		}
		public List<Book> findBooksBybids(String bids){
			return bd.findBooksBybids(bids);
		}
}
