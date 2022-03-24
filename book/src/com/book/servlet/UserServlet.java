package com.book.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.book.service.UserService;
import com.book.entity.Category;
import com.book.entity.User;
import com.book.utils.DateTool;
import com.book.utils.PageTool;
import com.book.utils.fileUploadTool;


@WebServlet("/user")
@MultipartConfig
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	UserService us = new UserService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		switch (method) {
		case "login":
			login(request, response);
			break;
		case "checkPhone":
			checkPhone(request, response);
			break;
		case "checkUserName":
			checkUserName(request, response);
			break;
		case "regist":
			regist(request, response);
			break;
		case "adminLogin":
			adminLogin(request, response);
			break;
		case "adminLogout":
			adminLogout(request, response);
			break;
		case "logout":
			logout(request, response);
			break;
		case "findAllUsers":
			findAllUsers(request,response);
			break;
		case "findUsersByPage":
			findUsersByPage(request,response);
			break;
		case "findUserByUid":
			findUserByUid(request,response);
			break;
		case "addUser2":
			addUser2(request,response);
			break;
		case "deleteManyUsers":
			deleteManyUsers(request,response);
			break;
		case "deleteUserByUid":
			deleteUserByUid(request,response);
			break;
		case "updateToShow":
			updateToShow(request,response);
			break;
		case "updateUser":
			updateUser(request,response);
			break;
		case "updatePwdToShow":
			updatePwdToShow(request,response);
			break;
		case "updatePwd":
			updatePwd(request,response);
			break;
		default:
			break;
		}
	}
	
	private void updatePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String upwd = request.getParameter("upwd");
		boolean flag = us.updatePwd(uid,upwd);
		if(flag) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
			
	}
	//根据用户名和邮箱查询用户并回显以修改密码
	private void updatePwdToShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uphone = request.getParameter("uphone");
		String email = request.getParameter("email");
		User user = us.findUserByUphoneEmail(uphone,email);
		if(user == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('验证失败，手机号或邮箱有误！');</script>");
			response.getWriter().write("<script>alert('网页将跳转到登录页面！');window.location.href='login.jsp';window.close();</script>");
			response.getWriter().flush();
			}
		request.setAttribute("user", user);
		request.getRequestDispatcher("showandupdate.jsp").forward(request, response);
	}
	//前台退出
		private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
			//1.强制清空session中数据
			HttpSession session = request.getSession();
			session.invalidate();//强制session失效
			//2.重新跳转到登录页面
			response.sendRedirect("login.jsp");
		}
	//后台退出
	private void adminLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//1.强制清空session中数据
		HttpSession session = request.getSession();
		session.invalidate();//强制session失效
		//2.重新跳转到登录页面
		response.sendRedirect("admin/login.jsp");
	}
	// 后台 管理员登录验证
	private void adminLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取登录页面提交的账号和密码
		String username = request.getParameter("username");
		String upwd = request.getParameter("upwd");
		//通过请求对象request的getSession()方法获取session对象
		HttpSession session = request.getSession();
		// 调用service层的登录验证方法
		boolean flag = us.checkAdminUser(username,upwd,session);
		if (flag) {
			// 登录成功
			 System.out.println("登录成功");
			response.sendRedirect("admin/index.jsp");
		} else {
			 System.out.println("登录失败");
			response.sendRedirect("admin/login.jsp");
		}
	}
	
	// 注册
	private void regist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 获取表单提交到后台的数据
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String uphone = request.getParameter("uphone");
		String upwd= request.getParameter("upwd");
			// 封装业务实体对象
			User user = new User(username,email, uphone,upwd, new Date());
			// 调用service层的添加方法
			boolean flag = us.addUser(user);
			if (flag) { // System.out.println("成功");
				// 注册成功直接跳转到登录页面login.jsp
				System.out.println("注册success");
				response.sendRedirect("login.jsp");
			} else {
				System.out.println("注册失败");
				response.sendRedirect("login.jsp");
			}
		}
		
	// 验证账号唯一
	private void checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取要验证的账号
		String username = request.getParameter("username");
		// 调用service层的验证方法
		boolean flag = us.checkUserName(username);
		// 将布尔结果输出给ajax请求
		response.getWriter().print(flag);
	}

	// 验证手机号的唯一性
	private void checkPhone(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取手机号
		String uphone = request.getParameter("uphone");
		// 调用service层的验证方法
		boolean flag = us.checkPhone(uphone);
		// 将返回数据flag输出给ajax请求
		response.getWriter().print(flag);
	}
	
	
	// 登录
	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取登录页面提交的账号和密码
		String username = request.getParameter("username");
		String upwd = request.getParameter("upwd");
		//System.out.println(username+upwd);
		// 调用service层的登录验证方法

		//通过Session方法获取session对象
		HttpSession session = request.getSession();
		boolean flag = us.checkUser(username, upwd,session);
		if (flag) {
			// 登录成功
			System.out.println("成功");
			response.sendRedirect("index?method=showInformation");
		} else {
			 System.out.println("失败");
			response.sendRedirect("login.jsp");
		}
	} 
	
	
	//day02
	//根据编号查询对象
		private void findUserByUid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String uid = request.getParameter("uid");
			User user = us.findUserByUid(Integer.valueOf(uid));
			request.setAttribute("user", user);
			request.getRequestDispatcher("admin/user_update.jsp").forward(request, response);
			
		}

		//删除单个用户
		private void deleteUserByUid(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String uid = request.getParameter("uid");
			boolean flag = us.deleteUserByUid(Integer.valueOf(uid));
			if(flag) {
				response.sendRedirect("user?method=findUsersByPage");
			}else {
				response.getWriter().print("删除失败！");
			}
			
		}

		//修改用户
		private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String uphone = request.getParameter("uphone");
			String upwd = request.getParameter("upwd");
			String manager = request.getParameter("manager");
			String create_time = request.getParameter("create_time");
			String uid = request.getParameter("uid");
			String upic = request.getParameter("oldpic");
			Part part = request.getPart("upic");
			if(part.getSize()!=0) {
				upic = fileUploadTool.fileUpload("admin/user_update.jsp", part, request, response);
			}
			
			User user = new User(Integer.valueOf(uid), username, email, uphone, upwd, 
						Integer.valueOf(manager), DateTool.stringToDate(create_time), upic);
			boolean flag = us.updateUser(user);
			if(flag) {
				response.sendRedirect("user?method=findUsersByPage");
			}	
		}

		//根据编号修改回显
		private void updateToShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String uid = request.getParameter("uid");
			User user = us.findUserByUid(uid);
			request.setAttribute("user", user);
			request.getRequestDispatcher("admin/user_update.jsp").forward(request, response);
			
		}


		//批量删除
		private void deleteManyUsers(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String uids = request.getParameter("uids");
			boolean flag = us.deleteManyUsers(uids);
			if(flag) {
				response.sendRedirect("user?method=findUsersByPage");
			}
			
		}

		//添加用户
		private void addUser2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String uphone = request.getParameter("uphone");
			String upwd = request.getParameter("upwd");
			String manager = request.getParameter("manager");
			String create_time = request.getParameter("create_time");
			Part part = request.getPart("upic");
			String upic = fileUploadTool.fileUpload("admin/user_add.jsp", part, request, response);
			if(!upic.equals("")) {
				User user = new User(username, email, uphone, upwd,Integer.valueOf(manager), DateTool.stringToDate(create_time), upic);
				boolean flag = us.addUser2(user);
				if(flag) {
					response.sendRedirect("user?method=findUsersByPage");
				}
			}
			
		}
		//分页查询
		private void findUsersByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String searchid= request.getParameter("id");
			if(Integer.valueOf(searchid)==1) {
				int totalCount = us.getTotalCount();
				String currentPage = request.getParameter("currentPage");
				PageTool tool = new PageTool(totalCount, currentPage,3);
				List<User> users = us.findUsersByPage(tool);
				request.setAttribute("list", users);
				request.setAttribute("tool", tool);
				request.getRequestDispatcher("admin/user_list.jsp").forward(request, response);
			}
			else if(Integer.valueOf(searchid)==2){
				String search = request.getParameter("search");
				int totalcount2 = us.getTotalCount2(search);
				String currentpage = request.getParameter("currentPage");
				PageTool p2 = new PageTool(totalcount2,currentpage,5);
				List<User> users = us.findTheUser(search,p2);
				request.setAttribute("list", users);
				request.setAttribute("tool", p2);	
				request.getRequestDispatcher("admin/user_list.jsp").forward(request, response);
			}
			
		}

		//查询全部
		private void findAllUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//调用service层的查询方法
			List<User> list = us.findAllUsers();
			//将list集合的数据保存到request域对象中
			request.setAttribute("list", list);
			//转发到user_list.jsp页面
			request.getRequestDispatcher("admin/user_add.jsp").forward(request, response);
		}


}
