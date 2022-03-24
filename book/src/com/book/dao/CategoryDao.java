package com.book.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.book.entity.Category;
import com.book.utils.PageTool;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class CategoryDao {
	QueryRunner qRunner = new QueryRunner(new ComboPooledDataSource());
	public Category findCategoryByCid(String cid) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM category WHERE cid = ?";
		try {
			return qRunner.query(sql, new BeanHandler<Category>(Category.class),cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public List<Category> findAllCategory() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM category";
		try {
			return qRunner.query(sql, new BeanListHandler<Category>(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public int getTotalCount() {//获取数据库中分类表总数据数目
		String sql = "SELECT COUNT(*) FROM category;";
		int count = 0;
		try {
			Long l = (Long)qRunner.query(sql, new ScalarHandler());
			count = l.intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public int getTotalCount2(String search) {
		String sql = "SELECT COUNT(*) FROM category WHERE cname  LIKE \"%\"?\"%\" LIMIT 0,5;";
		int count = 0;
		try {
			Long l = (Long)qRunner.query(sql, new ScalarHandler(),search);
			count = l.intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public List<Category> findCategoryByPage(PageTool p) {//获取数据库中分类表数据信息
		  String sql = "SELECT * FROM category LIMIT ?,?;";
			try {
				return qRunner.query(sql, new BeanListHandler<Category>(Category.class),p.getStartIndex(),p.getPageSize());
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
	}
	public int addcategory(Category category) {//添加商品分类项
		String sql = "INSERT INTO category (cname,state,order_number,create_time)VALUES(?,?,?,?);";
		try {
			return qRunner.update(sql,category.getCname(),category.getState(),category.getOrder_number(),category.getCreate_time());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	

	public int updatecategory(Category category) {//修改当前商品分类项信息
		String sql = "UPDATE category SET cname = ?,state=?,order_number=?,create_time= ? WHERE cid = ?;";
		try {
			return qRunner.update(sql,category.getCname(),category.getState(),category.getOrder_number(),category.getCreate_time(),category.getCid());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int deletecategory(String cids) {//删除当前多个分类项信息
		String sql = "DELETE FROM category WHERE cid IN ("+cids+");";
		try {
			return qRunner.update(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int deletecategoryById(String cid) {//删除当前单个分类项信息
		String sql = "DELETE FROM category WHERE cid =?;";
		try {
			return qRunner.update(sql,cid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<Category> findTheCategory(String search,PageTool p) {//模糊查找书籍信息
		String sql = "SELECT * FROM category WHERE cname  LIKE \"%\"?\"%\" LIMIT ?,?";
		try {
			return qRunner.query(sql,new BeanListHandler<Category>(Category.class),search,p.getStartIndex(),p.getPageSize());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<Category> findcategoryByCondition(int row){
		String sql = "SELECT * FROM category WHERE state = 1 ORDER BY order_number LIMIT ?";
		try {
			return qRunner.query(sql, new BeanListHandler<Category>(Category.class),row);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
