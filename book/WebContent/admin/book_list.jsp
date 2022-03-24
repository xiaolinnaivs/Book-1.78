<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	String picPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/bookpic/";
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>
<link rel="stylesheet" href="<%=basePath%>admin/res/css/amazeui.min.css" />
		<link rel="stylesheet" href="<%=basePath%>admin/res/css/admin.css" />
		
<script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>

<script type="text/javascript">

</script>
</head>
<body>
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">图书管理</strong><small></small>
			</div>
		</div>

		<hr>

		<div class="am-g">
			<div class="am-u-sm-12 am-u-md-6">
				<div class="am-btn-toolbar">
					<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default" onclick="add_books()">
							<span class="am-icon-plus"></span> 新增
						</button>
						<button type="button" class="am-btn am-btn-default" onclick="batchDelete()">
							<span class="am-icon-plus"></span> 批量删除
						</button>
					</div>
				</div>
			</div>
			<div class="am-u-sm-12 am-u-md-3">
				<div class="am-input-group am-input-group-sm">
				<form action="<%=basePath %>book?method=findBooksByPage&id=2" method="post" >
					<input name="search" type="text" class="am-form-field" placeholder="请输入要查询的书籍信息" id="search"/>
					<input type="submit" class="btn" value="搜索"/>
					
				</form>
				</div>
			</div>
			<!-- <div class="am-u-sm-12 am-u-md-3">
				<div class="am-input-group am-input-group-sm">
					<input type="text" class="am-form-field"> <span
						class="am-input-group-btn">
						<button class="am-btn am-btn-default" type="button">搜索</button>
					</span>
				</div>
			</div> -->
		</div>
		<div class="am-g">
			<div class="am-u-sm-12">
				<form class="am-form">
					<table   class="am-table am-table-striped am-table-hover table-main">
						<thead>
							<tr >
								<th class="table-check"><input name="chkall" id="chkall"  type="checkbox" value=""/></th>
								<th class="table-id">ID</th>
								<th class="table-cid">图书类别</th>
								<th class="table-type">书名</th>
								<th>图像</th>
								<th>作者</th>
								<th>价格</th>
								<th>描述</th>
								
								<th>状态</th>
								<th>创建时间</th>
								<!-- <th class="table-author am-hide-sm-only">性别</th> -->
								<th class="table-set">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="book">
							<tr>
								<td><input name="chk" class="chk" value="${book.bid }" type="checkbox"/></td>
								<td>${book.bid }</td>
								<td>${book.category.cname }</td>
								<td><a href="#">${book.bname }</a></td>
								<td><img src="<%=picPath %>${book.pic }" width="50px" height="60px"/></td>
								<td>${book.author }</td>
								<td>${book.price }</td>
								<td>
								<c:if test="${book.description.length()<=12 }">${book.description }</c:if>
	        					<c:if test="${book.description.length()>12 }">${book.description.substring(0,12) }...</c:if>
	        					</td>
								
								<td>
								<c:if test="${book.state == 4 }">畅销图书</c:if>
	        					<c:if test="${book.state == 3 }">最新出版</c:if>
	        					<c:if test="${book.state == 2 }">为你推荐</c:if>
	        					<c:if test="${book.state == 1 }">热门图书</c:if>
	        					<c:if test="${book.state == 0 }">正常</c:if>
	        					</td>
								<td>${book.create_time }</td>
								
								<!-- <td class="am-hide-sm-only">男</td> -->
								<td>
									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<a href="<%=basePath%>book?method=updateToShow&bid=${book.bid}">编辑</a>&nbsp;&nbsp;
											<a href="<%=basePath%>book?method=deleteBookByBid&bid=${book.bid}">删除</a>		
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="am-cf">
						共<font color="blue">${tool.totalCount}</font>条记录，当前显示第&nbsp;<font color="blue">${tool.currentPage }/${tool.totalPages }</font>&nbsp;页
						<input type="text" name="topage" id="topage" style="width:40px; height:30px;"/>
						<input type="button" onclick="go()" value="Go"/>
						<div class="am-fr">
							<ul class="am-pagination">
								<li ><a href="<%=basePath%>book?method=findBooksByPage&currentPage=1&id=1">首页</a></li>
								<li ><a href="<%=basePath%>book?method=findBooksByPage&currentPage=${tool.prePage }&id=1">上一页</a></li>
								<li ><a href="<%=basePath%>book?method=findBooksByPage&currentPage=${tool.nextPage }&id=1">下一页</a></li>
								<li><a href="<%=basePath%>book?method=findBooksByPage&currentPage=${tool.totalPages }&id=1">尾页</a></li>
							</ul>
						</div>
					</div>
					<hr>
				</form>
			</div>
		</div>
	</div>
	

    <script type="text/javascript">
	    $('.am-table tbody tr:odd').addClass('odd');
	    
	    function go(){
	    	var topage = document.getElementById("topage").value;
	    	if(parseInt(topage)!=topage||parseInt(topage)<=0){
	    		alert("请输入有效的数值");
	    		return;
	    	}
	    	if(parseInt(topage)>parseInt("${tool.totalPages}")){
	    		alert("超出最大页面"+parseInt("${tool.totalPages}"));
	    		return;
	    	}
	    	window.location.href="<%=basePath %>book?method=findBooksByPage&id=1&currentPage="+topage;
	    }
	    
	    
		function add_books(){
			window.location.href="<%=basePath%>category?method=findAllCategory";
		}
		
		//全选
		$("#chkall").click(function(){
			$(".chk").prop("checked",$(this).prop("checked"));
		})
		$(".chk").click(function(){
			var flag = $(this).prop("checked");
			if(!flag){
				$("#chkall").prop("checked",false);
			}
		})
		
		function batchDelete(){
			//拼接
			var bids = "";
			$(".chk:checked").each(function(){
				bids += ","+$(this).val();
				
			})
			if(bids == ""){
				alert("请选择要删除的项");
				return;
			}
			bids = bids.substring(1);
			
			
			if(confirm("确定要删除？")){
				window.location.href="<%=basePath%>book?method=deleteBooks&bids="+bids;
			}
		}
	
	</script>   
</body>
</html>
