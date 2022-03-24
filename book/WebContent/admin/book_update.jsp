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
    <li><a href="#">修改图书</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>图书信息</span></div>
    
    <form action="<%=basePath %>book?method=updateBook&bid=${book.bid}" method="post" enctype="multipart/form-data">
	    <ul class="forminfo">
	    	<li>
	    	 	<input name="bid" type="hidden" value="${book.bid }"></input>
	    	 	<label>图书分类</label>
	    	 	<select name="cid" class="dfinput">
	    	 		<option value="0">===请选择===</option>
	    	 		<c:forEach items="${clist }" var="cy">
	    	 			<option value="${cy.cid }" <c:if test="${book.cid == cy.cid }"> selected="selected"</c:if>>${cy.cname }</option>
	    	 		</c:forEach>
	    	 	</select>
	    	 </li>
		    <li><label>书名</label><input name="bname" type="text" class="dfinput" value="${book.bname }" /></li>
		    <li><label>图像</label><input name="pic" type="file"/><input type="hidden" value="${book.pic }" name="oldpic"/>
		    	<img src="<%=picPath %>${book.pic}" width="50px" height="60px"/></li>
		    <li><label>作者</label><input name="author" type="text" class="dfinput" value="${book.author }" /></li>
		    <li><label>价格</label><input name="price" type="text" class="dfinput" value="${book.price }" /></li>
		    <li><label>描述</label>
		    	<textarea name="description" cols="10" rows="10" class="textinput" style="height: 80px">${book.description }</textarea>
		    </li>
		    <li><label>状态</label>
			    <cite>
			    	<input name="state" type="radio" value="0" <c:if test="${book.state == 0 }">checked="checked"</c:if> /><font color="dodgerblue">正常</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="state" type="radio" value="1" <c:if test="${book.state == 1 }">checked="checked"</c:if> /><font color="dodgerblue">热门图书</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="state" type="radio" value="2" <c:if test="${book.state == 2 }">checked="checked"</c:if> /><font color="dodgerblue">为你推荐</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="state" type="radio" value="3" <c:if test="${book.state == 3 }">checked="checked"</c:if> /><font color="dodgerblue">最新出版</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="state" type="radio" value="4" <c:if test="${book.state == 4 }">checked="checked"</c:if> /><font color="dodgerblue">畅销图书</font>&nbsp;&nbsp;&nbsp;&nbsp;
			    </cite>
		    </li>
		    
		    <li><label>创建时间</label>
		    	<input class="Wdate" style="width: 345px;height: 32px;line-height: 32px;" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="create_time" type="text" class="dfinput" value="${book.create_time }" />
		    </li>
		    
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    </div>
</body>
</html>
