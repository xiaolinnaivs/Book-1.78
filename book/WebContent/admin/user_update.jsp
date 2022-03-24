<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//创建头像访问路径http://localhost:8080/xmpic/
	String picPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/bookpic/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改用户</title>
<link href="<%=basePath %>admin/css/style2.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="<%=basePath %>admin/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
</head>

<body>

	<div class="place">
    <ul class="placeul">
    <li><a href="#">修改用户</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>用户信息</span></div>
    
    <form action="<%=basePath %>user?method=updateUser&uid=${user.uid}" method="post" enctype="multipart/form-data">
	    <ul class="forminfo">
	    	 <li>
	    	 	<input name="uid" type="hidden" value="${user.uid }"/>
	    	 </li>
		    <li><label>用户名</label><input name="username" type="text" class="dfinput" value="${user.username }" /></li>
		    <li><label>邮箱</label><input name="email" type="text" class="dfinput" value="${user.email }" /></li>
		    <li><label>电话</label><input name="uphone" type="text" class="dfinput" value="${user.uphone }" /></li>
		    <li><label>密码</label><input name="upwd" type="text" class="dfinput" value="${user.upwd }" /></li>
		    <li><label>头像</label>
		    	<input name="upic" type="file"/><input type="hidden" value="${user.upic }" name="oldpic"/>
		    	<img src="<%=picPath %>upic/${user.upic}" width="50px" height="50px"/>
		    </li>
		    <li><label>权限</label>
			    <cite>
			    	<input name="manager" type="radio" value="0" <c:if test="${user.manager == 0 }">checked="checked"</c:if> /><font color="dodgerblue">管理员</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="manager" type="radio" value="1" <c:if test="${user.manager == 1 }">checked="checked"</c:if> /><font color="dodgerblue">普通用户</font>
			    </cite>
		    </li>
		    
		    <li><label>创建时间</label>
		    	<input class="Wdate" style="width: 345px;height: 32px;line-height: 32px;" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="create_time" type="text" class="dfinput" value="${user.create_time }" />
		    </li>
		    
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    </div>
</body>
</html>
