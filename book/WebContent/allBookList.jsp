<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//创建头像访问路径http://localhost:8080/bookpic/
	String picPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/bookpic/";
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>搜索图书</title>
    <link rel="stylesheet" href="<%=basePath %>css/index.css">
    <link rel="stylesheet" href="<%=basePath %>css/amazeui.min.css">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath %>css/style.css">
    
    <script src="js/jquery-3.1.1.js"></script>
    <style type="text/css">
        * {
            box-sizing: border-box;
        }
 
        body {
            margin: 0;
            padding: 0;
            background: #494A5F;
            font-weight: 500;
            font-family: "Microsoft YaHei","宋体","Segoe UI", "Lucida Grande", Helvetica, Arial,sans-serif, FreeSans, Arimo;
        }
 
        #container {
            width: 100%;
            height: 200px;
            margin: 0 auto;
        }
        div.search {padding: 30px 0;}
        
         #showall div{
         	display:inline-block;
            width: 400px;
            height: 400px;
            text-align:center;
        }
        
        #item ul{
        	list-style:none;
        }
 
        form {
            position: relative;
            width: 300px;
            margin: 0 auto;
        }
 
        input, button {
            border: none;
            outline: none;
        }
 
        input {
            width: 100%;
            height: 42px;
            padding-left: 13px;
        }
 
        button {
            height: 42px;
            width: 42px;
            cursor: pointer;
            position: absolute;
        }
 
        /*搜索框1*/
        .bar1 input {
            border: 2px solid #7BA7AB;
            border-radius: 5px;
            background: #F9F0DA;
            color: #9E9C9C;
        }
        .bar1 button {
            top: 0;
            right: 0;
            background: #7BA7AB;
            border-radius: 0 5px 5px 0;
        }
        .bar1 button:before {
            content: "\f002";
            font-family: FontAwesome;
            font-size: 16px;
            color: #F9F0DA;
        }
        
    </style>
</head>
<body>
<div id="container">
<!-- 头部分 -->
	<jsp:include page="header.jsp"></jsp:include>
    <div class="search bar1">
        <form action="index?method=search" method="post">       
            <input type="text" name="search" id="search" placeholder="请输入您要搜索的内容...">        
            <button type="submit"></button>
        </form>
    </div>
</div>

 <div id="showall" align="center">     
	    <c:forEach items="${blist }" var="book"> 
	           
	              <div class="capa capa_shadow">
	                  <a href="index?method=showDetail&bid=${book.bid }" target="_blank">
	                   <img src="<%=picPath%>${book.pic}" width="216px" height="305px">
	                   </a> 	               
	                     <ul>
	                        <li style="color: #B9B9FF">${book.bname }</li></a>
	                        <li style="color: #b0b0b0">${book.author }</li>
	                        <li style="font-size: 14px;margin-top: 10px; color: #ff6700" >${book.price }元</li>
	                     </ul>       
	                      
	                </div>
	                
		</c:forEach>
		
<div style="width:600px">
	<font color="#B9B9FF">共${tool.totalCount }条记录，当前显示第&nbsp;${tool.currentPage }/${tool.totalPages }&nbsp;页</font>
	<input type="text" name="topage"  id="topage" style="width:50px;height:30px; margin-left:15px"/>
	<input type="button" onclick="go()" value="Go" id="go"/>
		 <div id="item" style="width:600px">
			  <ul class="am-pagination" style="text-align:center;">			  
				  <li class="paginItem"><a href="<%=basePath%>book?method=showBookByPage&currentPage=1">首页</a></li>
					  <c:choose>
						  <c:when test="${tool.currentPage==1 }">
								  <li class="disabled">
									  <a href="<%=basePath%>book?method=showBookByPage&currentPage=1" aria-label="Previous">
											<span aria-hidden="true">«</span>
									  </a>
								  </li>
							</c:when>
					  <c:otherwise>
					<li>
				    	<a href="<%=basePath%>book?method=showBookByPage&currentPage=${tool.currentPage-1}" aria-label="Previous">
							<span aria-hidden="true">«</span>
						</a>
					</li>
					 </c:otherwise>
					 </c:choose>
					 <c:choose>
							<c:when test="${tool.totalPages<5 }">
								 <c:set var="begin" value="1"></c:set>
								 <c:set var="end" value="${tool.totalPages }"></c:set>
							</c:when>
							<c:otherwise>
								 <c:set var="begin" value="${tool.currentPage-1 }"></c:set>
								 <c:set var="end" value="${tool.currentPage+3 }"></c:set>
								 <c:if test="${begin-1<=0 }">
										<c:set var="begin" value="1"></c:set>
										<c:set var="end" value="5"></c:set>
								 </c:if>
								 <c:if test="${end>tool.totalPages }">
										<c:set var="begin" value="${tool.totalPages-4 }"></c:set>
										<c:set var="end" value="${tool.totalPages }"></c:set>
								 </c:if>
							</c:otherwise>
					 </c:choose>
				<c:forEach var="i" begin="${begin }" end="${end }">
					 <c:choose>
							<c:when test="${i==tool.currentPage }">
									<li class="am-active"><a href="<%=basePath%>book?method=showBookByPage&currentPage=${tool.currentPage}">${i }</a></li>
							 </c:when>
							 <c:otherwise>
									 <li><a href="<%=basePath%>book?method=showBookByPage&currentPage=${i}">${i}</a></li>
							 </c:otherwise>
					 </c:choose>
				 </c:forEach>
					 <c:choose>
							 <c:when test="${tool.currentPage==tool.totalPages }">
									 <li class="disabled">
										<a href="<%=basePath%>book?method=showBookByPage&currentPage=${tool.totalPages}" aria-label="Previous">
											<span aria-hidden="true">»</span>
										</a>
									 </li>
							 </c:when>
							 <c:otherwise>
									 <li>
										 <a href="<%=basePath%>book?method=showBookByPage&currentPage=${tool.currentPage+1}" aria-label="Next">
											<span aria-hidden="true">»</span>
										 </a>
										</li>
							 </c:otherwise>
					 </c:choose>
							<li class="paginItem"><a href="<%=basePath%>book?method=showBookByPage&currentPage=${tool.totalPages}">尾页</a></li>				 
				 </ul>
		 </div>
</div>      
</div>              
 
<script type="text/javascript">
 	function go(){
 		var topage = document.getElementById("topage").value;
 		if(parseInt(topage)!=topage||parseInt(topage)<=0){
 			alert("请输入有效的数值");
 			return;
 		}
 		if(parseInt(topage)>parseInt("${tool.totalPages}")){
 			alert("超出最大页面"+parseInt("${tool.totalPages}"));
 			return;
 		}
 		window.location.href="<%=basePath %>book?method=showBookByPage&currentPage="+topage;
 	}
 		
 		
</script>
</body>
</html>