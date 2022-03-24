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
    <li><font size="7" color="dodgerblue">添加图书</font></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span><font color="dodgerblue">图书信息</font></span></div>
    
    <form action="<%=basePath %>book?method=addBook" method="post" enctype="multipart/form-data">
    	
	    <ul class="forminfo">
	    	 <li>
	    	 	<label><font color="dodgerblue">图书分类</font></label>
	    	 	<select name="cid" class="dfinput">
	    	 		<option value="0">===请选择===</option>
					<c:forEach items="${list }" var="cy">
						<option value="${cy.cid }" >${cy.cname }</option>
					</c:forEach>
	    	 	</select>
	    	 </li>
		    <li><label><font color="dodgerblue">书名</font></label><input name="bname" type="text" class="dfinput" /></li>
		    <li><label><font color="dodgerblue">图像</font></label><input name="pic" type="file"/></li>
		    <li><label><font color="dodgerblue">作者</font></label><input name="author" type="text" class="dfinput" /></li>
		    <li><label><font color="dodgerblue">价格</font></label><input name="price" type="text" class="dfinput" /></li>
		    <li><label><font color="dodgerblue">描述</font></label><textarea name="description" cols="8" rows="10" class="textinput" ></textarea></li>
		    <li><label><font color="dodgerblue">状态</font></label>
			    <cite>
				    <input name="state" type="radio" value="0" checked="checked" /><font color="dodgerblue">正常</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="state" type="radio" value="1" /><font color="dodgerblue">热门图书</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="state" type="radio" value="2" /><font color="dodgerblue">为你推荐</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="state" type="radio" value="3" /><font color="dodgerblue">最新出版</font>&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="state" type="radio" value="4" /><font color="dodgerblue">畅销图书</font>&nbsp;&nbsp;&nbsp;&nbsp;
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
