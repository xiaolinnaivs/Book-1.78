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
			+ "/bookpic/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet"
	href="<%=basePath%>admin/res/layui/css/layui.css">
<link rel="stylesheet" href="<%=basePath%>admin/res/css/global.css">
<script src="<%=basePath%>admin/res/layui/layui.js"></script>
</head>
<body>
	<div class="header">
		<div class="main">
			<a href="<%=basePath%>admin/index.jsp"
				style="margin-left: 30px; line-height: 65px; color: white; font-size: 18px;">图书商城管理系统后台</a>
			<div class="nav"></div>
			
			
				<!-- 登入后的状态 -->
				<a class="avatar" href="<%=basePath%>admin/index.jsp" style="margin-right: 10px; vertical-align:middle; margin-left: 1430px; text-align: center; line-height: 65px; color: white;"> 
				<img src="<%=picPath%>upic/${user.upic}"> 
				<cite color="white" >${user.username }</cite>
				<cite style="color: white;">管理员</cite>
				</a>	
				
				
				<a href="<%=basePath%>user?method=adminLogout" style="color: white; text-align:center">退出</a>

		</div>
	</div>


	<div class="main fly-user-main layui-clear">
		<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
			<li class="layui-nav-item layui-this"><a
				href="<%=basePath%>admin/index.jsp"> <i class="layui-icon">&#xe609;</i> 首页
			</a></li>

			<li class="layui-nav-item "><a href="<%=basePath%>user?method=findUsersByPage&id=1"
				target="right"> <i class="layui-icon">&#xe612;</i> 用户管理
			</a></li>
			<li class="layui-nav-item"><a href="<%=basePath %>category?method=findcategoryByPage&id=1"
				target="right"> <i class="layui-icon">&#xe611;</i> 图书分类
			</a></li>
			<li class="layui-nav-item "><a href="<%=basePath%>book?method=findBooksByPage&id=1"
				target="right"> <i class="layui-icon">&#xe611;</i> 图书管理
			</a></li>
			<li class="layui-nav-item "><a href="<%=basePath%>order?method=findOrdersByPage&id=1"
				target="right"> <i class="layui-icon">&#xe611;</i> 订单管理
			</a></li>
		</ul>

		<div class="site-tree-mobile layui-hide">
			<i class="layui-icon">&#xe602;</i>
		</div>
		<div class="site-mobile-shade"></div>

		<div class="fly-panel fly-panel-user"">
			<div class="layui-tab layui-tab-brief" lay-filter="user">

				<div class="layui-tab-content"
					style="padding: 20px; padding-top: 0px;">

					<iframe src="<%=basePath%>admin/main.jsp" width="88%" style="border: none;"
						height="800" border="none" name="right"></iframe>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="<%=basePath%>admin/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/myplugs/js/plugs.js"></script>
	[
	<script>
		layui.use('element', function() {
			var element = layui.element();
		});
	</script>
</body>
</html>