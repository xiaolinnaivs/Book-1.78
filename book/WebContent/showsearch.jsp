<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//创建头像访问路径http://localhost:8080/xmpic/
	String picPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/bookpic/";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索图书</title>
<link rel="stylesheet" href="<%=basePath %>css/index.css">
 <script src="<%=basePath %>js/jquery-3.1.1.js"></script>
 <style>
 		body {
            margin: 0;
            padding: 0;
            background: #494A5F;
            font-weight: 500;
            font-family: "Microsoft YaHei","宋体","Segoe UI", "Lucida Grande", Helvetica, Arial,sans-serif, FreeSans, Arimo;
        }
        #container {
         	width: 300px;
            height: 150px;
            margin: 0 auto;
        }
        div.search {padding: 30px 0;}
        
         #showall div{
         	display:inline-block;
            width: 600px;
            height: 400px;
            text-align:center;
        }
        
        #item ul{
        	list-style:none;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="container">
    <font size="16" color="cadetblue">查询到的图书</font>
</div>
<div id="showall">     
	    <c:forEach items="${bkList }" var="book">       
	              <div class="capa capa_shadow">
	                   <a href="index?method=showDetail&bid=${book.bid }" target="_blank">
	                   <img src="<%=picPath%>${book.pic}" width="216px" height="305px">
	             
	                        </a>	         
	                     <ul>
	                        <li style="color: #333333">${book.bname }</li>
	                        <li style="color: #b0b0b0">${book.author }</li>
	                        <li style="font-size: 14px;margin-top: 10px; color: #ff6700" >${book.price }元</li>
	                     </ul>
	                </div>
         </c:forEach>
</div>          
</body>
</html>