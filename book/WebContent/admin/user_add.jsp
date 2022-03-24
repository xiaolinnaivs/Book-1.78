<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
		String picPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ "/bookpic/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>

<link href="<%=basePath %>admin/css/style2.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="<%=basePath %>admin/js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>

	<div class="place">
    <ul class="placeul">
    <li><font size="7" color="dodgerblue">添加用户</font></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span><font color="dodgerblue">用户信息</font></span></div>
    
    <form action="<%=basePath %>user?method=addUser2" method="post" enctype="multipart/form-data">
    	
	    <ul class="forminfo">
	    	 
	    	 
		    <li><label><font color="dodgerblue">用户名</font></label><input name="username" type="text" class="dfinput" /></li>
		    <li><label><font color="dodgerblue">邮箱</font></label><input name="email" type="text" class="dfinput" /></li>
		    <li><label><font color="dodgerblue">电话</font></label><input name="uphone" type="text" class="dfinput" /></li>
		    <li><label><font color="dodgerblue">密码</font></label><input name="upwd" type="text" class="dfinput" /></li>
		    <li><label><font color="dodgerblue">头像</font></label>
		    	<input name="upic" type="file"/>
		    </li>
		    <li><label><font color="dodgerblue">权限</font></label>
			    <cite>
				    <input name="manager" type="radio" value="0" checked="checked" /><font color="dodgerblue">管理员</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="manager" type="radio" value="1" /><font color="dodgerblue">普通用户</font>
			    </cite>
		    </li>
		    
		    <li><label><font color="dodgerblue">创建时间</font></label>
		    	<input class="Wdate" style="width: 345px;height: 32px;line-height: 32px;" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="create_time" type="text" class="dfinput" value="" />
		    </li>
		    
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    </div>
</body>
</html>
