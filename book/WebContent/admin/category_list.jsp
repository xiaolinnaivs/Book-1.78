<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>分类管理</title>
<link rel="stylesheet" href="<%=basePath%>admin/res/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=basePath%>admin/res/css/admin.css" />
<script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
</head>
<body>
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">分类管理</strong><small></small>
			</div>
		</div>
		<hr></hr>

		<div class="am-g">
			<div class="am-u-sm-12 am-u-md-6">
				<div class="am-btn-toolbar">
					<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default" onclick="add_category()">
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
				<form action="<%=basePath %>category?method=findcategoryByPage&id=2" method="post" >
					<input name="search" type="text" class="am-form-field" placeholder="请输入要查询的书籍信息" id="search"/>
					<input type="submit" class="btn" value="搜索"/>
					
				</form>
				</div>
			</div>
		</div>
		<div class="am-g">
			<div class="am-u-sm-12">
				<form class="am-form">
					<table   class="am-table am-table-striped am-table-hover table-main">
						<thead>
							<tr >
								<th class="table-check"><input name="chkall" id="chkall"  value="" type="checkbox"/></th>
								<th class="table-id">序号</th>
								<th class="table-type">类别名称</th>
								<th>启用状态</th>
								<th>排序序号</th>
								<th>创建时间</th>
								<th class="table-set">操作</th>
							</tr>
						</thead>
						<tbody>
						   <c:forEach items="${clist }" var ="category" >
							<tr>
								<td><input name="chk" class="chk" value="${category.cid }"  type="checkbox"/></td>
								<td>${category.cid }</td>
								<td><a href="#">${category.cname }</a></td>
								<td>
								 <c:if test="${category.state == 0 }">未启用</c:if>
	                             <c:if test="${category.state == 1 }">已启用</c:if>
								</td>
								<td>${category.order_number }</td>
								<td><f:formatDate value = "${category.create_time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								
								<!-- <td class="am-hide-sm-only">男</td> -->
								<td>
									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											
												
												<span class="am-icon-pencil-square-o"></span><a href="<%=basePath%>category?method=updateToShow&cid=${category.cid }">编辑</a>
											
												<span class="am-icon-trash-o"></span> <a href="<%=basePath%>category?method=deletecategoryById&cid=${category.cid }">
												<font color="red">删除</font></a>
									
										</div>
									</div>
								</td>
							</tr>
                              </c:forEach>    
                              
                               <c:forEach items="${flist }" var ="category" >
							<tr>
								<td><input name="chk" class="chk" value="${category.cid }"  type="checkbox"></td>
								<td>${category.cid }</td>
								<td><a href="#">${category.cname }</a></td>
								<td>
								 <c:if test="${category.state == 0 }">未启用</c:if>
	                             <c:if test="${category.state == 1 }">已启用</c:if>
								</td>
								<td>${category.order_number }</td>
								<td><f:formatDate value = "${category.create_time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								
								<!-- <td class="am-hide-sm-only">男</td> -->
								<td>
									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											
												
												<span class="am-icon-pencil-square-o"></span><a href="<%=basePath%>category?method=updateToShow&cid=${category.cid }">编辑</a>
											
												<span class="am-icon-trash-o"></span> <a href="<%=basePath%>category?method=deletecategoryById&cid=${category.cid }">
												<font color="red">删除</font></a>
									
										</div>
									</div>
								</td>
							</tr>
                              </c:forEach>    
                              
                              
                              
						</tbody>
					</table>
					<div class="am-cf">
						共<font color="blue">${tool.totalCount }</font>条记录，当前显示第&nbsp;<font color="blue">${tool.currentPage } / ${tool.totalPages }</font>&nbsp;页
						<input type="text" name="topage" id="topage" style="width:40px; height:30px;"/>
						<input type="button" onclick="go()" value="Go"/>
						<div class="am-fr">
							<ul class="am-pagination">
								<li><a href="<%=basePath %>category?method=findcategoryByPage&currentPage=1&id=1">«</a></li>
								<li ><a href="<%=basePath %>category?method=findcategoryByPage&currentPage=${tool.prePage }&id=1">上一页</a></li>
								<li><a href="<%=basePath %>category?method=findcategoryByPage&currentPage=${tool.nextPage }&id=1">下一页</a></li>
								<li><a href="<%=basePath %>category?method=findcategoryByPage&currentPage=${tool.totalPages }&id=1">»</a></li>
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
	    	window.location.href="<%=basePath %>category?method=findcategoryByPage&id=1&currentPage="+topage;
	    }
	    
		function add_category(){
			window.location.href="<%=basePath%>admin/category_add.jsp";
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
			var cids="";
			$(".chk:checked").each(function(){
				cids+=","+$(this).val();
			})
			if(cids==""){
				alert("请至少选择一项删除！");
				return;
			}
			if(confirm("是否确定要删除？")){
				//截取拼接后的编号字符串，将第一个多余的逗号去掉
				cids = cids.substring(1);
				window.location.href = "<%=basePath%>category?method=deletecategory&cids="+cids;
			}
		
		}
	
	</script>  
</body>
</html>
