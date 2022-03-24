package com.book.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.book.dao.UserDao;
import com.book.entity.Category;
import com.book.entity.User;
import com.book.utils.PageTool;

public class UserService {
	UserDao ud = new UserDao();

	// 登录验证
	public boolean checkAdminUser(String username, String upwd, HttpSession session) {
		User user = ud.checkAdminUser(username, upwd);
		if (user != null) {
			// 将当前用户对象保存到session域中
			session.setAttribute("user", user);
			return true;
		} else {
			return false;
		}
	}

	// 添加方法
	public boolean addUser(User user) {
		return ud.addUser(user) > 0 ? true : false;
	}

	// 验证手机号唯一
	public boolean checkPhone(String uphone) {
		User user = ud.checkPhone(uphone);
		if (user != null) {
			return true;
		} else {
			return false;
		}
	}

	// 验证账号唯一
	public boolean checkUserName(String username) {
		User user = ud.checkUserName(username);
		if (user != null) {
			return true;
		} else {
			return false;
		}
	}

	// 登录验证
	public boolean checkUser(String username, String upwd, HttpSession session) {
		User user = ud.checkUser(username, upwd);
		if (user != null) {
			// 将当前用户对象保存到session域中
			session.setAttribute("loginUser", user);
			return true;
		} else {
			return false;
		}
	}

	// day02
	// 查询全部
	public List<User> findAllUsers() {
		return ud.findAllUsers();
	}

	// 查询表中总记录数
	public int getTotalCount() {
		return ud.getTotalCount();
	}

	// 分页查询
	public List<User> findUsersByPage(PageTool tool) {
		return ud.findUsersByPage(tool);
	}

	// 添加用户
	public boolean addUser2(User user) {
		return ud.addUser2(user) > 0 ? true : false;
	}

	// 批量删除
	public boolean deleteManyUsers(String uids) {
		return ud.deleteManyUsers(uids) > 0 ? true : false;
	}

	// 根据编号查询
	public User findUserByUid(String uid) {
		return ud.findUserByUid(uid);
	}

	// 修改用户
	public boolean updateUser(User user) {
		return ud.updateUser(user) > 0 ? true : false;
	}

	// 删除单个用户
	public boolean deleteUserByUid(int uid) {
		return ud.deleteUserByUid(uid) > 0 ? true : false;
	}

	// 查询单个用户
	public User findUserByUid(int uid) {
		return ud.findUserByUid(uid);
	}
	public int getTotalCount2(String search) {
		return ud.getTotalCount2(search);
	}
	public List<User> findTheUser(String search,PageTool p) {//模糊查找书籍信息
		// TODO Auto-generated method stub
		return ud.findTheUser(search,p);
	}
	public User findUserByUphoneEmail(String uphone, String email) {
		return ud.findUserByUphoneEmail(uphone, email);
	}
	
	
	public boolean updatePwd(String uid, String upwd) {
		return ud.updatePwd(uid,upwd)>0?true:false;
	}
}
