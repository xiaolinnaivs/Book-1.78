package com.book.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.book.entity.Book;
import com.book.entity.User;
import com.book.service.BookService;
import com.book.service.CategoryService;
import com.book.utils.DateTool;
import com.book.utils.PageTool;
import com.book.utils.fileUploadTool;
import com.book.entity.Category;


/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/book")
@MultipartConfig
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookService bs = new BookService();
	CategoryService cs = new CategoryService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		switch (method) {
		case "findBooksByPage":
			findBooksByPage(request,response);
			break;
		case "addBook":
			addBook(request,response);
			break;
		case "deleteBooks":
			deleteBooks(request,response);
			break;
		case "updateToShow":
			updateToShow(request,response);
			break;
		case "updateBook":
			updateBook(request,response);
			break;
		case "deleteBookByBid":
			deleteBookByBid(request,response);
			break;
		case "showBookByPage":
			showBookByPage(request,response);
			break;
		default:
			break;
		}
	}
	private void deleteBookByBid(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String bid = request.getParameter("bid");
		boolean flag = bs.deleteBookByBid(bid);
		if(flag) {
			response.sendRedirect("book?method=findBooksByPage");
		}else {
			response.getWriter().print("删除失败！");
		}
	}
	private void updateBook(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String bid = request.getParameter("bid");
		String cid = request.getParameter("cid");
		String bname = request.getParameter("bname");
		String author = request.getParameter("author");
		
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		
		String state = request.getParameter("state");
	
		String create_time = request.getParameter("create_time");
		String pic = request.getParameter("oldpic");
		Part part = request.getPart("pic");
		if(part.getSize()!=0) {
			pic = fileUploadTool.fileUpload("admin/user_update.jsp", part, request, response);
		}
		Book book = new Book(Integer.valueOf(bid),Integer.valueOf(cid),bname,author,Double.valueOf(price),description,pic,Integer.valueOf(state),DateTool.stringToDate(create_time));
	
		boolean flag = bs.updateBook(book);
		if(flag) {
			response.sendRedirect("book?method=findBooksByPage");
		}	
	}
	private void updateToShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String bid = request.getParameter("bid");
		Book book = bs.findBookByBid(bid);
		request.setAttribute("book", book);
		List<Category> clist = cs .findAllCategory();
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("admin/book_update.jsp").forward(request, response);
	}
	private void deleteBooks(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String bids = request.getParameter("bids");
		boolean flag = bs.deleteBooks(bids);
		if(flag) {
			response.sendRedirect("book?method=findBooksByPage");
		}
		
	}
	private void addBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		String bname = request.getParameter("bname");
		String author = request.getParameter("author");
		
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		
		String state = request.getParameter("state");
	
		String create_time = request.getParameter("create_time");
		
        Part part = request.getPart("pic");
        String pic = fileUploadTool.fileUpload("admin/book_add.jsp", part, request, response);
        Book book = new Book(Integer.valueOf(cid),bname,author,Double.valueOf(price),description,pic,Integer.valueOf(state),DateTool.stringToDate(create_time));
		boolean flag = bs.addBook(book);
		if(flag) {
			response.sendRedirect("book?method=findBooksByPage");
		}
			
		}
	private void findBooksByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchid = request.getParameter("id");
		if(Integer.valueOf(searchid)==1) {
			int totalCount = bs.getTotalCount();
			String currentPage = request.getParameter("currentPage");
			PageTool tool = new PageTool(totalCount, currentPage,5);
			List<Book> books = bs.findBooksByPage(tool);
			request.setAttribute("list", books);
			request.setAttribute("tool", tool);
			request.getRequestDispatcher("admin/book_list.jsp").forward(request, response);
		}else if(Integer.valueOf(searchid)==2) {
			String search = request.getParameter("search");
			int totalcount2 = bs.getTotalCount2(search);
			String currentpage = request.getParameter("currentPage");
			PageTool p2 = new PageTool(totalcount2,currentpage,5);
			List<Book> books = bs.findTheBook(search,p2);
			request.setAttribute("list", books);
			request.setAttribute("tool", p2);	
			request.getRequestDispatcher("admin/book_list.jsp").forward(request, response);
		}
		
		
	}
	//点击商品列表查看所有图书
		private void showBookByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int totalCount = bs.getTotalCount();
			String currentPage = request.getParameter("currentPage");
			PageTool tool = new PageTool(totalCount, currentPage, 8);
			List<Book> blist = bs.showBookByPage(tool);
			request.setAttribute("blist", blist);
			request.setAttribute("tool", tool);
			request.getRequestDispatcher("allBookList.jsp").forward(request, response);
			
		}
}
