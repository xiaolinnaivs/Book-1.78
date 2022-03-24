<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="box">
      <div class="inner whiteGL">
          <div class="left">
              <a class="mix" href="index?method=showInformation">图书商城</a>
              <a href="book?method=showBookByPage">商品列表</a>
          <a href="trolley?method=showTro&uid=${loginUser.uid }">购物车</a>
          <a href="order?method=showOrder&uid=${loginUser.uid }">订单管理</a>
          </div>
          
          
 
          <div class="right">
          <c:if test="${empty loginUser}">
          		<a class="mix" href="login.jsp">登录</a>
              	<a href="login.jsp">注册</a>
          </c:if>
          <c:if test="${!empty loginUser}">
          		<font color="#b0b0b0" size="1">${loginUser.username}</font>
              	<a href="user?method=logout"> 注销</a>
          </c:if>
              
          </div>
      </div>
 </div>

<!-- <div class="box2">
      <div class="daohang">
          <ul class="orangeGL">
          <a href="">首页</a>
          <a href="">商品列表</a>
          <a href="">购物车</a>
          <a href="">订单管理</a>
      	</ul>
      </div>
</div> -->
</body>
</html>