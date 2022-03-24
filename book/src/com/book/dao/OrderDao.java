package com.book.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.book.entity.Book;
import com.book.entity.Order_detail;
import com.book.entity.Order_list;
import com.book.entity.User;
import com.book.utils.PageTool;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class OrderDao {
	QueryRunner qRunner=new QueryRunner(new ComboPooledDataSource());
	
	
	

	//order_list
	//制作订单,返回Order_list获得oid
	public Order_list addOrd(Order_list oList) {
		String sql = "INSERT INTO order_list (uid,sum_price,create_time) VALUES(?,?,?)";
		String deSql="select * from order_list WHERE uid = ? AND create_time=?";
		int ord=0;
		Order_list oid=null;
		try {
			ord= qRunner.update(sql, oList.getUid(), 
										oList.getSum_price(), 
										oList.getCreate_time());
			
			if (ord>0) {
				oid=qRunner.query(deSql,new BeanHandler<Order_list>(Order_list.class),oList.getUid(),oList.getCreate_time());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return oid;
	}
	//查找用户全部订单
	public List<Order_list> findOrd(int uid) {
		String sql="SELECT * FROM order_list WHERE uid = ?";
		List<Order_list> li=null;
		try {
			
			li= qRunner.query(sql, new BeanListHandler<Order_list>(Order_list.class),uid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return li;
	}
	//设置为已支付状态
	public int setState(String oids) {
		String sql="UPDATE order_list SET state=1 WHERE oid IN("+oids+")";
		try {
			return qRunner.update(sql);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	//设置为发货状态
	public int setLog(String oids) {
		String sql="UPDATE order_list SET log=1 WHERE oid IN("+oids+")";
		try {
			return qRunner.update(sql);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	
	//detial
	//增加订单详细
	public int addDetial(int oid,String bids,String numbers) {
		String sql = "INSERT INTO order_detial (oid,bids,numbers) VALUES(?,?,?)";
		try {
			return qRunner.update(sql,oid, bids,numbers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	//查找详细:根据oid
	public Order_detail findDetailByO(int oid) {
		String sql="SELECT * FROM order_detial WHERE oid = ?";
		Order_detail li=null;
		try {
			
			li= qRunner.query(sql, new BeanHandler<Order_detail>(Order_detail.class),oid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	//查找详细：根据oids
	public List<Order_detail> findDetailByoids(String oids){
		String sql="SELECT * FROM order_detial WHERE oid IN("+oids+")";
		List<Order_detail> li=null;
		try {
			
			li= qRunner.query(sql, new BeanListHandler<Order_detail>(Order_detail.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	//根据oid删除
	public int delOrd(int oid) {
		String listsql="DELETE FROM order_list WHERE oid =?";
		String desql="DELETE FROM order_detial WHERE oid =?";
		int l=0;
		int d=0;
		try {
			l=qRunner.update(listsql,oid);
			if (l>0) {
				d=qRunner.update(desql,oid);
			}
			//System.out.println(r);
		
		} catch (Exception e) {
			System.out.println(e);
		}
		return d;
	}
	public int delOrds(String oids) {
		String listsql="DELETE FROM order_list WHERE oid IN("+oids+")";
		String desql="DELETE FROM order_detial WHERE oid IN("+oids+")";
		int l=0;
		int d=0;
		try {
			l=qRunner.update(listsql);
			if (l>0) {
				d=qRunner.update(desql);
			}
			//System.out.println(r);
		
		} catch (Exception e) {
			System.out.println(e);
		}
		return d;
	}
	public int getTotalCount() {
		int count=0;
		String sql = "SELECT COUNT(*) FROM order_list";
		try {
			Long l = (Long)qRunner.query(sql, new ScalarHandler());
			count = l.intValue();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public List<Order_list> findOrdersByPage(PageTool tool) {
		String sql = "SELECT * FROM order_list ORDER BY create_time DESC limit ?,?";
		try {
			return qRunner.query(sql, new BeanListHandler<Order_list>(Order_list.class), tool.getStartIndex(),tool.getPageSize());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public int getTotalCount2(String search) {
		String sql = "SELECT COUNT(*) FROM order_list WHERE uid  IN("+search+") LIMIT 0,5;";
		int count = 0;
		try {
			Long l = (Long)qRunner.query(sql, new ScalarHandler());
			count = l.intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public List<Order_list> findTheOrder(String search, PageTool p2) {
		String sql = "SELECT * FROM order_list WHERE uid  IN("+search+") LIMIT ?,?";
		try {
			return qRunner.query(sql,new BeanListHandler<Order_list>(Order_list.class),p2.getStartIndex(),p2.getPageSize());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
