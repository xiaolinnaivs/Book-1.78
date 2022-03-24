package com.book.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.service.CategoryService;
import com.book.utils.DateTool;
import com.book.utils.PageTool;
import com.book.entity.Category;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CategoryService cs = new CategoryService();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		switch (method) {
		case "findAllCategory":
			findAllCategory(request, response);
			break;
		case "findcategoryByPage":
			findcategoryByPage(request, response);
			break;
		case "addcategory":
			addcategory(request, response);
			break;
		case "updateToShow":
			updateToShow(request, response);
			break;
		case "updatecategory":
			updatecategory(request, response);
			break;
		case "deletecategory":
			deletecategory(request, response);
			break;
		case "deletecategoryById":
			deletecategoryById(request, response);
			break;
		case "findTheBook":
			findTheBook(request, response);
			break;
		default:
			break;
		}
	}

	private void findAllCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Category> list = cs.findAllCategory();
		request.setAttribute("list", list);
		// 转发book_add.jsp
		request.getRequestDispatcher("admin/book_add.jsp").forward(request, response);
	}

	private void findTheBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {// 模糊查找书籍信息
		int totalcount = cs.getTotalCount();
		System.out.println("test");
		String currentpage = request.getParameter("currentPage");
		PageTool p = new PageTool(totalcount, currentpage,5);
	//	List<Category> fcategores = cs.findcategoryByPage(p);
		String search = request.getParameter("search");
		System.out.println(search);
		int totalcount2 = cs.getTotalCount2(search);
		PageTool p2 = new PageTool(totalcount2,currentpage,5);
		List<Category> scategores = cs.findTheCategory(search,p2);
		request.setAttribute("flist", scategores);
		
		request.setAttribute("tool", p2);
		request.getRequestDispatcher("admin/category_list.jsp").forward(request, response);
	}

	private void deletecategoryById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {// 删除当前单个分类项信息
		String cid = request.getParameter("cid");
		boolean flag = cs.deletecategoryById(cid);
		if (flag) {
			response.sendRedirect("category?method=findcategoryByPage");
		} else {
			response.sendRedirect("admin/category_update.jsp");
		}

	}

	private void deletecategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {// 删除当前多个分类项信息
		String cids = request.getParameter("cids");
		boolean flag = cs.deletecategory(cids);
		System.out.println(cids);
		if (flag) {
			response.sendRedirect("category?method=findcategoryByPage");
		} else {
			response.sendRedirect("admin/category_update.jsp");
		}
	}

	private void updatecategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {// 修改当前商品分类项信息

		String cid = request.getParameter("cid");
		String state = request.getParameter("state");
		String order_number = request.getParameter("order_number");
		String cname = request.getParameter("cname");
		String create_time = request.getParameter("create_time");
		Category category = new Category(Integer.valueOf(cid), cname, Integer.valueOf(state),
				Integer.valueOf(order_number), DateTool.stringToDate(create_time));
		boolean flag = cs.updatecategory(category);
		if (flag) {
			response.sendRedirect("category?method=findcategoryByPage");
		}

	}

	private void updateToShow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {// 显示当前修改分类项信息
		String cid = request.getParameter("cid");
		Category cy = cs.findCategoryByCid(cid);
		request.setAttribute("cy", cy);
		request.getRequestDispatcher("admin/category_update.jsp").forward(request, response);
	}

	private void addcategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {// 添加商品分类项
		String state = request.getParameter("state");
		String order_number = request.getParameter("order_number");
		String cname = request.getParameter("cname");
		String create_time = request.getParameter("create_time");
		Category category = new Category(cname, Integer.valueOf(state), Integer.valueOf(order_number),
				DateTool.stringToDate(create_time));
		boolean flag = cs.addcategory(category);
		if (flag) {
			response.sendRedirect("category?method=findcategoryByPage");
		} else {
			response.sendRedirect("admin/category_add.jsp");
		}

	}

	private void findcategoryByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { // 获取商品分类信息并分页显示
		String searchid= request.getParameter("id");
		System.out.println(searchid);
		if(Integer.valueOf(searchid)==1)
		{
		int totalcount = cs.getTotalCount();
		System.out.println(totalcount);
		String currentpage = request.getParameter("currentPage");
		PageTool p = new PageTool(totalcount, currentpage,5);
		List<Category> categores = cs.findcategoryByPage(p);
		request.setAttribute("clist", categores);
		request.setAttribute("tool", p);
		request.getRequestDispatcher("admin/category_list.jsp").forward(request, response);

		}
		else if(Integer.valueOf(searchid)==2) {
		String search = request.getParameter("search");
		int totalcount2 = cs.getTotalCount2(search);
		String currentpage = request.getParameter("currentPage");
		PageTool p2 = new PageTool(totalcount2,currentpage,5);
		List<Category> scategores = cs.findTheCategory(search,p2);
		request.setAttribute("flist", scategores);
		request.setAttribute("tool", p2);	
		request.getRequestDispatcher("admin/category_list.jsp").forward(request, response);

		}
		
	}

}
