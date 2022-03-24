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
<title>找回密码</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Magical Login Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/findback.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/jquery.1.11.1.min.js"></script>
    <script src="js/jquery-3.1.1.js"></script>
<!-- //Custom Theme files -->
</head>
<body>
	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>找回密码</h1>
		<div class="main-agileinfo">
			<div class="agileits-top"> 
				<form action="user?method=updatePwdToShow" method="post">
					<input class="text" type="text" name="uphone" id="uphone" placeholder="uphone" required="">
					<input class="text" type="text" name="email" id="email" placeholder="email" required="">
					<div class="wthree-text"> 
						<ul> 
							<li>
								<label class="anim">
									<input type="checkbox" class="checkbox" required="">
									<span>确认要找回密码？</span>
								</label> 
							</li>
						</ul>
						<div class="clear"> </div>
					</div>   
					<input type="submit" value="FINDBACK">
				</form>
				<p>Don't have an Account? <a href="login.jsp"> Signup Now!</a></p>
			</div>	 
		</div>	
		<!-- //copyright -->
		<ul class="w3lsg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>	
	<!-- //main --> 
</body>
</html>