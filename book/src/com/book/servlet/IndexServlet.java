package com.book.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.entity.Book;
import com.book.entity.Category;
import com.book.service.BookService;
import com.book.service.CategoryService;
import com.book.utils.PageTool;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	CategoryService cs = new CategoryService();
	BookService bs = new BookService();
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		switch (method) {
		case "showInformation":
			showInformation(request, response);
			break;
		case "showDetail":
			showDetail(request, response);
			break;
		case "search":
			search(request, response);
			break;	
		case "showList":
			showList(request, response);
			break;	
		default:
			break;
		}
	}



	private void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bid = request.getParameter("bid");
		Book book = bs.findBookByBid(bid);
		request.setAttribute("book", book);
		request.getRequestDispatcher("detail.jsp").forward(request, response);
		
	}

	//主页内容显示
	private void showInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查找分类并在主页显示
		List<Category> cyList = cs.findcategoryByCondition(10);
		//System.out.println(cyList.size());
		request.setAttribute("cyList", cyList);
		
		//按cid查找图书
		//cs经典教材（cid=1）
		List<Book> csList = bs.findBookByCid(1, 5);
		request.setAttribute("csList", csList);
		
		//按state查找图书
		//畅销新书
		List<Book> newList = bs.findBookByState(4, 5);
		request.setAttribute("newList", newList);
		//热门图书
		List<Book> hotList = bs.findBookByState(1, 4);
		request.setAttribute("hotList", hotList);

		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		int totalCount = bs.getTotalCount();
		String currentPage = request.getParameter("currentPage");
		PageTool tool = new PageTool(totalCount, currentPage, 5);
		List<Book> bkList = bs.findTheBook(search, tool);
		request.setAttribute("tool", tool);
		request.setAttribute("bkList", bkList);
		if(bkList!=null&&!bkList.isEmpty()) {
			request.getRequestDispatcher("showsearch.jsp").forward(request, response);
		}else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('该图书未收录');</script>");
			response.getWriter().write("<script>alert('网页将跳转到搜索页面！'); window.location='book?method=showBookByPage'; window.close();</script>");
			response.getWriter().flush();
			
		}
		
	}
	private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		List<Book> bkList = bs.findBookByCidAll(Integer.valueOf(cid));
		int totalCount = bkList.size();
		String currentPage = request.getParameter("currentPage");
		PageTool tool = new PageTool(totalCount, currentPage, 5);
		request.setAttribute("tool", tool);
		request.setAttribute("bkList", bkList);
		if(bkList!=null&&!bkList.isEmpty()) {
			request.getRequestDispatcher("showsearch.jsp").forward(request, response);
		}else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('该分类下暂时没有图书');</script>");
			response.getWriter().write("<script>alert('网页将跳转到搜索页面！'); window.location='book?method=showBookByPage'; window.close();</script>");
			response.getWriter().flush();
		}
		
		
	}
}
