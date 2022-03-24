<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改类别</title>
<link href="<%=basePath %>admin/css/style2.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript" src="<%=basePath %>admin/js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">修改类别</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>类别信息</span></div>
    
    	 
    	 <form action="<%=basePath %>category?method=updatecategory" method="post" >
    	 <input type = "hidden" name = "cid" value = "${cy.cid }"/>
	    <ul class="forminfo">
		    <li><label>类别名称</label><input name="cname" type="text" value="${cy.cname }" class="dfinput" /><i>类别名称不能超过30个字符</i></li>
		    <li><label>是否启用</label>
			    <cite>
				    <input name="state" type="radio" value="1" <c:if test="${cy.state ==1 }">checked="checked"</c:if>/>是&nbsp;&nbsp;&nbsp;&nbsp;
				    	
				    <input name="state" type="radio" value="0" <c:if test="${cy.state ==0 }">checked="checked"</c:if>/>否 
			    </cite>
		    </li>
		    
		    <li><label>排序序号</label>
		    	<input name="order_number" type="text" value="${cy.order_number }" class="dfinput" /><i>输入数字，越大越靠后排列</i>
		    </li>
		    
		    <li><label>创建时间</label>
		    	
		    	<input class="Wdate" style="width: 345px;height: 32px;line-height: 32px;"  onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="create_time" type="text" class="dfinput" value="<fmt:formatDate value="${cy.create_time }" pattern="yyyy-MM-dd HH:mm:ss" />" />
		    </li>
		    
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    </div>
</body>
</html>
