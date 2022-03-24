package com.book.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
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
import com.book.entity.User;
import com.book.service.BookService;
import com.book.service.OrderService;
import com.book.service.TrolleyService;
import com.book.utils.PageTool;

/**
 * Servlet implementation class Order
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	OrderService os=new OrderService();
	TrolleyService ts=new TrolleyService();
	BookService bs=new BookService();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		switch (method) {
		case "makeOrder"://去结算跳转到订单界面
			makeOrder(request,response);
			break;
			
		
		case "showOrder"://展示订单列表界面
			showOrder(request,response);
			break;	
				
		case "showDetial"://展示订单详细
			showDetial(request,response);
			break;
			
		case "delOrder"://订单删除
			delOrder(request,response);
			break;
			
		case "settleOrd"://订单结算
			settleOrd(request,response);
			break;
		case "setLog"://发货
			setLog(request,response);
			break;
		case "findOrdersByPage":
			findOrdersByPage(request,response);
			break;
		default:
			break;
		}
	}
	
	

	private void showDetial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oid = Integer.valueOf(request.getParameter("oid"));
		int uid = Integer.valueOf(request.getParameter("uid"));
		Order_detail od =os.findDetailByO(oid);
		String bids=od.getBids().substring(0,od.getBids().length()-1);
		String numbers=od.getNumbers().substring(0,od.getNumbers().length()-1);
		List<String> nList=Arrays.asList(numbers.split(","));
		
		List<Book> bList=bs.findBooksBybids(bids);
		
		request.setAttribute("bList", bList);
		request.setAttribute("nList", nList);
		
		request.getRequestDispatcher("order_detail.jsp").forward(request, response);
		
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
		int oid= os.addOrd(new Order_list(uid,sum,new Date()));
		if(oid>0) {
			boolean flag =os.addDetial(oid, bids, numbers);
			if (flag) {
				ts.deleteBybids(bids.substring(0,bids.length()-1), uid);
				
		        request.getRequestDispatcher("order?method=showOrder&uid="+uid).forward(request, response);//等待订单界面
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
		
		
		List<Order_list> order_lists=os.findOrd(uid);
		Map<Integer, Order_detail> ordmap = new HashMap<Integer, Order_detail>();
		for (Order_list o : order_lists) {
			Order_detail od=os.findDetailByO(o.getOid());
			ordmap.put(o.getOid(), od);
		}
		request.setAttribute("oList", order_lists);
		request.setAttribute("oMap", ordmap);
		
		request.getRequestDispatcher("order.jsp").forward(request, response);
	}
	
	
	
	/*
	  删除订单
	 order.jsp界面点击去除订单 
	  根据所选商品的oid在DB里删除相应条目
	  跳转到trolley?method=showOrder&uid=
	*/
	private void delOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.valueOf(request.getParameter("id"));
		int oid = Integer.valueOf(request.getParameter("oid"));
		boolean tag= os.delOrd(oid);
		if (id==0) {//普通用户
			if (tag) {
				int uid = Integer.valueOf(request.getParameter("uid"));
				request.getRequestDispatcher("order?method=showOrder&uid="+uid).forward(request, response);//等待订单界面
			}else {
				int uid = Integer.valueOf(request.getParameter("uid"));
				response.getWriter().write("<script>alert('删除失败');window.location.href='order?method=showOrder&uid='+"+uid+"; window.close();</script>");
				response.getWriter().flush();
			}
		}else if (id==1) {//后台界面
			if (tag) {
				request.getRequestDispatcher("order?method=findOrdersByPage&id=1").forward(request, response);//等待订单界面
			}else {
				response.getWriter().write("<script>alert('删除失败');window.location.href='order?method=findOrdersByPage&id=1; window.close();</script>");
				response.getWriter().flush();
			}
		}
		
	}
	
	
	private void settleOrd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.valueOf(request.getParameter("uid"));
		String oids = request.getParameter("oids");
		boolean tag=os.setState(oids.substring(0,oids.length()-1));
		if (tag) {
			request.getRequestDispatcher("order?method=showOrder&uid="+uid).forward(request, response);
		}else {
			response.getWriter().write("<script>alert('支付失败');window.location.href='order?method=showOrder&uid='+"+uid+"; window.close();</script>");
			response.getWriter().flush();
		}
		
	}
	//admin/order_list界面用
	private void setLog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oids = request.getParameter("oids");
		boolean tag=os.setLog(oids.substring(0,oids.length()-1));
		if (tag) {
			request.getRequestDispatcher("order?method=findOrdersByPage&id=1").forward(request, response);
		}else {
			response.getWriter().write("<script>alert('发货失败');window.location.href='order?method=findOrdersByPage&id=1'; window.close();</script>");
			response.getWriter().flush();
		}
		
	}
	
	private void findOrdersByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchid= request.getParameter("id");
		if(Integer.valueOf(searchid)==1) {
			int totalCount = os.getTotalCount();
			String currentPage = request.getParameter("currentPage");
			PageTool tool = new PageTool(totalCount, currentPage,5);
			List<Order_list> oList = os.findOrdersByPage(tool);
			request.setAttribute("olist", oList);
			request.setAttribute("tool", tool);
			request.getRequestDispatcher("admin/order_list.jsp").forward(request, response);
		}
		else if(Integer.valueOf(searchid)==2){
			String search = request.getParameter("search");
			
			System.out.println(search);
			
			int totalcount2 = os.getTotalCount2(search);
			
			System.out.println(totalcount2);
			
			String currentpage = request.getParameter("currentPage");
			PageTool p2 = new PageTool(totalcount2,currentpage,5);
			List<Order_list> oList = os.findTheOrder(search,p2);
			
			System.out.println(oList.size());
			
			request.setAttribute("olist", oList);
			request.setAttribute("tool", p2);	
			request.getRequestDispatcher("admin/order_list.jsp").forward(request, response);
		}
		
	}

}
