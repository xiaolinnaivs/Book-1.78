package com.book.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.entity.Book;
import com.book.entity.Order_detail;
import com.book.entity.Order_list;
import com.book.entity.Trolley;
import com.book.service.BookService;
import com.book.service.TrolleyService;

/**
 * Servlet implementation class TrolleyServlet
 */
@WebServlet("/trolley")
public class TrolleyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	TrolleyService ts=new TrolleyService();
	BookService bs=new BookService();
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		switch (method) {
		case "addTro"://购物车增加商品
			addTro(request,response);
			break;
		case "delTro"://购物车删除商品
			delTro(request,response);
			break;
		
		case "showTro"://展示购物车内容goods.jsp
			showTro(request,response);
			break;
			
		
		case "makeOrder"://去结算跳转到订单界面
			makeOrder(request,response);
			break;
			
		
		case "showOrder"://展示订单界面
			showOrder(request,response);
			break;	
			
		
		case "delOrder"://订单删除
			delOrder(request,response);
			break;
			
		case "settleOrd"://订单结算
			settleOrd(request,response);
			break;
		
		default:
			break;
		}
	}
	
	
	/*
	 * private void checkTro(HttpServletRequest request, HttpServletResponse
	 * response) { // TODO Auto-generated method stub String bid =
	 * request.getParameter("bid"); String uid = request.getParameter("uid");
	 * boolean flag1 = ts.checkTro(Integer.valueOf(uid),Integer.valueOf(bid)); }
	 */


	private void settleOrd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.valueOf(request.getParameter("uid"));
		int oid = Integer.valueOf(request.getParameter("oid"));
		boolean tag=ts.setState(oid);
		if (tag) {
			request.getRequestDispatcher("trolley?method=showOrder&uid="+uid).forward(request, response);
		}else {
			response.getWriter().print("fail");
		}
		
	}


	//Detial界面调用，增加购物车
	private void addTro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String uid = request.getParameter("uid");
		String bid = request.getParameter("bid");
		Book book = bs.findBookByBid(bid);
		
		Trolley trolley=ts.checkTro(Integer.valueOf(uid),Integer.valueOf(bid));
		if (trolley != null) {
			int number = trolley.getNumber();
			Trolley trolley2 = new Trolley(trolley.getTid(),trolley.getUid(),trolley.getBid(),number+1,book.getPrice()*Double.valueOf(number+1));
			boolean flag = ts.updateTro(trolley2);
			response.setContentType("text/html;charset=utf-8");
			if(flag) {
				response.getWriter().write("<script>alert('添加图书至购物车成功'); window.location.href='index?method=showInformation'; window.close();</script>");
				response.getWriter().flush();
			}else {
				response.getWriter().write("<script>alert('添加图书至购物车失败');window.location.href='index?method=showInformation'; window.close();</script>");
				response.getWriter().flush();
			}
		}else {
			Trolley trolley3 = new Trolley(Integer.valueOf(uid),Integer.valueOf(bid),1,book.getPrice());
			boolean flag = ts.addTro(trolley3);
			if(flag) {
				response.getWriter().write("<script>alert('添加图书至购物车成功');window.location.href='index?method=showInformation'; window.close();</script>");
				response.getWriter().flush();
			}else {
				response.getWriter().write("<script>alert('添加图书至购物车失败');window.location.href='index?method=showInformation'; window.close();</script>");
				response.getWriter().flush();
			}
		}
	}
	//根据tid删除购物车内的某个商品
	private void delTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tid = Integer.valueOf(request.getParameter("tid"));
		int uid=ts.deleteByT(tid);
		if (uid>0) {//找到用户,删除成功
			request.getRequestDispatcher("trolley?method=showTro&uid="+uid).forward(request, response);
		}else {
			response.getWriter().print("fail");
		}
	}
	
	/*
	 展示购物车内容
	 点击进入购物车
	 根据uid展示当前购物车内的商品
	 跳转到goods.jsp
	 * */
	private void showTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.valueOf(request.getParameter("uid"));
		//System.out.println(uid);
		List<Trolley> trolley= ts.findAllTro(uid);
		/*
		 * List<Book> books=new ArrayList<Book>(); books.add(new
		 * Book(1,1,"算法导论（原书第3版）","[美]Thomas H.Cormen",128,"以英语和伪代码的形式描述",
		 * "s25648004.jpg",0,new Date())); books.add(new
		 * Book(2,1,"计算机科学导论","[美]贝赫鲁兹·佛罗赞",69,"讲解计算机科学的基础知识","s28418968.jpg",0,new
		 * Date()));
		 */
		//System.out.println(trolley.size());
		
		Map<Integer, Book> bookMap=new HashMap<Integer, Book>();
		/*
		 * bookMap.put(1, books.get(0)); bookMap.put(2, books.get(1));
		 */
		
		
		  for (Trolley t : trolley) {
					Book book=bs.findBookByBid(String.valueOf(t.getBid()));
					bookMap.put(t.getTid(),book);
		  }
		 
		request.setAttribute("trolist",trolley);
		request.setAttribute("Map",bookMap);
		request.getRequestDispatcher("trolley.jsp").forward(request, response);
	}
	
	/*
	 新增订单
	 购物车界面goods.jsp点击去结算
	 根据所选商品添加订单\DB：order_list、order_detial
	 跳转到trolley?method=showOrder&uid=
	 * */
	private void makeOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.valueOf(request.getParameter("uid"));
		String bids = request.getParameter("bids");
		String numbers = request.getParameter("numbers");
		double sum = Double.parseDouble(request.getParameter("sum"));
		//System.out.println(uid+"\t"+bids+"\t"+numbers+"\t"+sum);
		int oid= ts.addOrd(new Order_list(uid,sum,new Date()));
		if(oid>0) {
			boolean flag =ts.addDetial(oid, bids, numbers);
			if (flag) {
				ts.deleteBybids(bids.substring(0,bids.length()-1), uid);
				
		        request.getRequestDispatcher("trolley?method=showOrder&uid="+uid).forward(request, response);//等待订单界面
			}
		}
	}
	

	/*
	 展示所有订单
	 根据uid展示用户当前的订单
	 转到order.jsp
	 */
	private void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.valueOf(request.getParameter("uid"));
		
		
		List<Order_list> order_lists=ts.findOrd(uid);
		Map<Integer, Order_detail> ordmap = new HashMap<Integer, Order_detail>();
		for (Order_list o : order_lists) {
			Order_detail od=ts.findDetailByO(o.getOid());
			ordmap.put(o.getOid(), od);
		}
		request.setAttribute("oList", order_lists);
		request.setAttribute("oMap", ordmap);
		
		request.getRequestDispatcher("Order.jsp").forward(request, response);
	}
	
	
	
	/*
	  删除订单
	 order.jsp界面点击去除订单 
	  根据所选商品的oid在DB里删除相应条目
	  跳转到trolley?method=showOrder&uid=
	*/
	private void delOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oid = Integer.valueOf(request.getParameter("oid"));
		int uid = Integer.valueOf(request.getParameter("uid"));
		boolean tag= ts.delOrd(oid);
		if (tag) {
			request.getRequestDispatcher("trolley?method=showOrder&uid="+uid).forward(request, response);//等待订单界面
		}else {
			PrintWriter out=response.getWriter();
			out.println("alert('删除失败！');");
		}
	}
	


}
