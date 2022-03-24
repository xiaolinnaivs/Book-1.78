<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//获取tomcat 协议+地址+端口号
	String picPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ "/xiaomipic/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Personal Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- Meta tag Keywords -->

<!-- css files -->
<link rel="stylesheet" href="<%=basePath%>admin/css/style.css"
	type="text/css" media="all" />
<!-- Style-CSS -->
<link rel="stylesheet" href="<%=basePath%>admin/css/font-awesome.css">
<!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->
</head>
<body>
	<!--header-->
	<div class="header-w3l">
		<h1>Personal Login Form</h1>
	</div>
	<!--//header-->

	<!--main-->
	<div class="main-content-agile">
		<div class="sub-main-w3">
			<div class="wthree-pro">
				<img width="120px" height="120px" src="<%=basePath%>admin/images/pro.jpg" alt="image">
				<h2>Login Now</h2>
			</div>
			<form action="<%=basePath %>user?method=adminLogin" method="post">
				<input placeholder="Username" name="username" class="user"
					type="text" required=""> <span class="icon1"><i
					class="fa fa-user" aria-hidden="true"></i></span><br>
				<br> <input placeholder="Password" name="upwd" class="pass"
					type="password" required=""> <span class="icon2"><i
					class="fa fa-unlock" aria-hidden="true"></i></span><br>
				<div class="sub-w3l">
					<span><input type="checkbox" />Remember Me</span>
					<div class="right-w3l">
						<input type="submit" value="Login">
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--//main-->

	<!--footer-->
	<div class="footer">
		<p>
			&copy;
		</p>
	</div>
	<!--//footer-->

</body>
</html>