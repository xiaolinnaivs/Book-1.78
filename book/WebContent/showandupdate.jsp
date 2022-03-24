<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>用户信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bonanza Subscribe Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/showandupdate.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
<!-- //Custom Theme files -->

<!-- //web font -->
</head>
<body>
	<!-- main -->
	<div class="main main-agileinfo">
		<h1>${user.username }的基本信息</h1>
		<div class="main-agilerow"> 
			<div class="sub-w3lsright agileits-w3layouts stack twisted">
				<h2>手机号：${user.uphone }</br>邮箱：${user.email }</h2>
				<p>您可以<span>修改</span>或直接保存密码</p>
				<form action="<%=basePath %>user?method=updatePwd" method="post">
				    <input type="hidden" name="uid" value="${user.uid }">
					<input type="text" name="upwd" value="${user.upwd }" placeholder="Enter your password..." required>
					<input type="submit" value="确认保存">  
				</form>
				<div class="clear"> </div>
			</div>	
			<div class="clear"> </div>
		</div>	
	</div>	 
</body>
</html>