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
	//????????????????????????????????????????
	private void updatePwdToShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uphone = request.getParameter("uphone");
		String email = request.getParameter("email");
		User user = us.findUserByUphoneEmail(uphone,email);
		if(user == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('????????????????????????????');</script>");
			response.getWriter().write("<script>alert('??????????????????????');window.location.href='login.jsp';window.close();</script>");
			response.getWriter().flush();
			}
		request.setAttribute("user", user);
		request.getRequestDispatcher("showandupdate.jsp").forward(request, response);
	}
	//????????
		private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
			//1.????????session??????
			HttpSession session = request.getSession();
			session.invalidate();//????session????
			//2.??????????????????
			response.sendRedirect("login.jsp");
		}
	//????????
	private void adminLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//1.????????session??????
		HttpSession session = request.getSession();
		session.invalidate();//????session????
		//2.??????????????????
		response.sendRedirect("admin/login.jsp");
	}
	// ???? ??????????????
	private void adminLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ????????????????????????????
		String username = request.getParameter("username");
		String upwd = request.getParameter("upwd");
		//????????????request??getSession()????????session????
		HttpSession session = request.getSession();
		// ????service????????????????
		boolean flag = us.checkAdminUser(username,upwd,session);
		if (flag) {
			// ????????
			 System.out.println("????????");
			response.sendRedirect("admin/index.jsp");
		} else {
			 System.out.println("????????");
			response.sendRedirect("admin/login.jsp");
		}
	}
	
	// ????
	private void regist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// ????????????????????????
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String uphone = request.getParameter("uphone");
		String upwd= request.getParameter("upwd");
			// ????????????????
			User user = new User(username,email, uphone,upwd, new Date());
			// ????service????????????
			boolean flag = us.addUser(user);
			if (flag) { // System.out.println("????");
				// ??????????????????????????login.jsp
				System.out.println("????success");
				response.sendRedirect("login.jsp");
			} else {
				System.out.println("????????");
				response.sendRedirect("login.jsp");
			}
		}
		
	// ????????????
	private void checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ????????????????
		String username = request.getParameter("username");
		// ????service????????????
		boolean flag = us.checkUserName(username);
		// ????????????????ajax????
		response.getWriter().print(flag);
	}

	// ??????????????????
	private void checkPhone(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ??????????
		String uphone = request.getParameter("uphone");
		// ????service????????????
		boolean flag = us.checkPhone(uphone);
		// ??????????flag??????ajax????
		response.getWriter().print(flag);
	}
	
	
	// ????
	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ????????????????????????????
		String username = request.getParameter("username");
		String upwd = request.getParameter("upwd");
		//System.out.println(username+upwd);
		// ????service????????????????

		//????Session????????session????
		HttpSession session = request.getSession();
		boolean flag = us.checkUser(username, upwd,session);
		if (flag) {
			// ????????
			System.out.println("????");
			response.sendRedirect("index?method=showInformation");
		} else {
			 System.out.println("????");
			response.sendRedirect("login.jsp");
		}
	} 
	
	
	//day02
	//????????????????
		private void findUserByUid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String uid = request.getParameter("uid");
			User user = us.findUserByUid(Integer.valueOf(uid));
			request.setAttribute("user", user);
			request.getRequestDispatcher("admin/user_update.jsp").forward(request, response);
			
		}

		//????????????
		private void deleteUserByUid(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String uid = request.getParameter("uid");
			boolean flag = us.deleteUserByUid(Integer.valueOf(uid));
			if(flag) {
				response.sendRedirect("user?method=findUsersByPage");
			}else {
				response.getWriter().print("??????????");
			}
			
		}

		//????????
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

		//????????????????
		private void updateToShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String uid = request.getParameter("uid");
			User user = us.findUserByUid(uid);
			request.setAttribute("user", user);
			request.getRequestDispatcher("admin/user_update.jsp").forward(request, response);
			
		}


		//????????
		private void deleteManyUsers(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String uids = request.getParameter("uids");
			boolean flag = us.deleteManyUsers(uids);
			if(flag) {
				response.sendRedirect("user?method=findUsersByPage");
			}
			
		}

		//????????
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
		//????????
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

		//????????
		private void findAllUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//????service????????????
			List<User> list = us.findAllUsers();
			//??list????????????????request????????
			request.setAttribute("list", list);
			//??????user_list.jsp????
			request.getRequestDispatcher("admin/user_add.jsp").forward(request, response);
		}


}
