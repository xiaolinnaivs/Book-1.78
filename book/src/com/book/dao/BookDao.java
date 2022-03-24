package com.book.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.book.entity.Book;
import com.book.entity.Category;
import com.book.entity.User;
import com.book.utils.PageTool;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class BookDao {
	QueryRunner qRunner = new QueryRunner(new ComboPooledDataSource());
	
	public int getTotalCount() {
		// TODO Auto-generated method stub
		int count=0;
		String sql = "SELECT COUNT(*) FROM book";
		try {
			Long l = (Long)qRunner.query(sql, new ScalarHandler());
			count = l.intValue();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public List<Book> findBooksByPage(PageTool tool) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM book limit ?,?";
		try {
			return qRunner.query(sql, new BeanListHandler<Book>(Book.class), tool.getStartIndex(),tool.getPageSize());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int addBook(Book book) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO book (cid,bname,author,price,description,pic,state,create_time)VALUES(?,?,?,?,?,?,?,?)";
		try {
			return qRunner.update(sql,book.getCid(),book.getBname(),book.getAuthor(),book.getPrice(),book.getDescription(),book.getPic(),book.getState(),book.getCreate_time());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int deleteBooks(String bids) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM book WHERE bid IN ("+bids+")";
		try {
			return qRunner.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Book findBookByBid(String bid) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM book WHERE bid=?";
		Book book = null;
		try {
			book = qRunner.query(sql, new BeanHandler<Book>(Book.class), bid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}

	public int updateBook(Book book) {
		// TODO Auto-generated method stub
		String sql = "UPDATE book SET cid=?,bname=?,author=?,price=?,description=?,pic=?,state=?,create_time=? WHERE bid=?";
		try {
			return qRunner.update(sql,book.getCid(),book.getBname(),book.getAuthor(),book.getPrice(),book.getDescription(),book.getPic(),book.getState(),book.getCreate_time(),book.getBid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int deleteBookByBid(String bid) {
		// TODO Auto-generated method stub
		int r = 0;
		String sql = "DELETE FROM book WHERE bid=?";
		try {
			r = qRunner.update(sql, bid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}
	public List<Book> findBookByCid(int state,int row){
		String sql = "SELECT * FROM book WHERE cid = ? LIMIT ?";
		try {
			return qRunner.query(sql, new BeanListHandler<Book>(Book.class),state,row);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public List<Book> findBookByCidAll(int state){
		String sql = "SELECT * FROM book WHERE cid = ?";
		try {
			return qRunner.query(sql, new BeanListHandler<Book>(Book.class),state);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Book> findBookByState(int state,int row){
		String sql = "SELECT * FROM book WHERE state = ? LIMIT ?";
		try {
			return qRunner.query(sql, new BeanListHandler<Book>(Book.class),state,row);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public int getTotalCount2(String search) {
		String sql = "SELECT COUNT(*) FROM book WHERE bname  LIKE \"%\"?\"%\" LIMIT 0,5;";
		int count = 0;
		try {
			Long l = (Long)qRunner.query(sql, new ScalarHandler(),search);
			count = l.intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public List<Book> findTheBook(String search,PageTool p) {//模糊查找书籍信息
		String sql = "SELECT * FROM book WHERE bname  LIKE \"%\"?\"%\" LIMIT ?,?";
		try {
			return qRunner.query(sql,new BeanListHandler<Book>(Book.class),search,p.getStartIndex(),p.getPageSize());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<Book> showBookByPage(PageTool tool) {
		String sql = "SELECT * FROM book limit ?,?";
		try {
			return qRunner.query(sql, new BeanListHandler<Book>(Book.class), tool.getStartIndex(),tool.getPageSize());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public List<Book> findBooksBybids(String bids){
		String sql="SELECT * FROM book WHERE bid IN("+bids+")";
		List<Book> li=null;
		try {
			
			li= qRunner.query(sql, new BeanListHandler<Book>(Book.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
}