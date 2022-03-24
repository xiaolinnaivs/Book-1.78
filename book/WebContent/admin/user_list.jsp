<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>用户管理列表</title>
<link rel="stylesheet" href="<%=basePath%>admin/res/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=basePath%>admin/res/css/admin.css" />
<script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
</head>
<body>
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">用户管理</strong><small></small>
			</div>
		</div>

		<hr>

		<div class="am-g">
			<div class="am-u-sm-12 am-u-md-6">
				<div class="am-btn-toolbar">
					<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default" onclick="add_user()">
							<span class="am-icon-plus"></span> 新增
						</button>
		
						<button type="button" class="am-btn am-btn-default" onclick="batchDelete()">
							<span class="am-icon-minus"></span> 批量删除
						</button>
					</div>
				</div>
			</div>
			<div class="am-u-sm-12 am-u-md-3">
				<div class="am-input-group am-input-group-sm">
				<form action="<%=basePath %>user?method=findUsersByPage&id=2" method="post" >
					<input name="search" type="text" class="am-form-field" placeholder="请输入要查询的用户信息" id="search"/>
					<input type="submit" class="btn" value="搜索"/>
					
				</form>
				</div>
			</div>
		</div>
		<div class="am-g">
			<div class="am-u-sm-12">
				<form class="am-form">
					<table   class="am-table am-table-striped am-table-hover table-main" >
						<thead>
							<tr >
								<th class="table-check"><input name="chkall" id="chkall" type="checkbox" value=""></th>
								<th class="table-id">ID</th>
								<!-- <th class="table-title">姓名</th> -->
								<th class="table-type">用户名</th>
								<th>邮箱</th>
								<th>电话</th>
								<th>密码</th>
								<th>头像</th>
								<th>权限</th>
								<th>创建时间</th>
								<th class="table-set">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="user">
							<tr>
								<td><input name="chk" class="chk" type="checkbox" value="${user.uid }"></td>
								<td>${user.uid }</td>
								<td><a href="">${user.username }</a></td>
								<td>${user.email }</td>
								<td>${user.uphone }</td>
								<td>${user.upwd }</td>
								<td>
									<img src="<%=picPath %>upic/${user.upic }" width="30px" height="30px"/>
								</td>
								<td>
									<c:if test="${user.manager == 1 }">普通用户</c:if>
	        						<c:if test="${user.manager == 0 }">管理员</c:if>
								</td>
								<td>
									<fmt:formatDate value="${user.create_time }" pattern="yyyy-MM-dd" />
								</td>
														
								<td>
									<a href="<%=basePath%>user?method=updateToShow&uid=${user.uid}">修改</a>&nbsp;&nbsp;
									<a href="<%=basePath%>user?method=deleteUserByUid&uid=${user.uid}">删除</a>
									<!-- <div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<button class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="update_user()">
												<span class="am-icon-pencil-square-o"></span> 编辑
											</button>
											<button 
												class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="delete_user()">
												<span class="am-icon-trash-o"></span> 删除
											</button>
										</div>
									</div> -->
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
							<li class="paginItem"><a href="<%=basePath%>user?method=findUsersByPage&currentPage=1&id=1">首页</a></li>
								<c:choose>
									<c:when test="${tool.currentPage==1 }">
										<li class="disabled">
											<a href="<%=basePath%>user?method=findUsersByPage&currentPage=1&id=1" aria-label="Previous">
												<span aria-hidden="true">«</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="<%=basePath%>user?method=findUsersByPage&currentPage=${tool.currentPage-1}&id=1" aria-label="Previous">
												<span aria-hidden="true">«</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${tool.totalPages<5 }">
										<c:set var="begin" value="1"></c:set>
										<c:set var="end" value="${tool.totalPages }"></c:set>
									</c:when>
								<c:otherwise>
									<c:set var="begin" value="${tool.currentPage-1 }"></c:set>
									<c:set var="end" value="${tool.currentPage+3 }"></c:set>
									<c:if test="${begin-1<=0 }">
										<c:set var="begin" value="1"></c:set>
										<c:set var="end" value="5"></c:set>
									</c:if>
									<c:if test="${end>tool.totalPages }">
										<c:set var="begin" value="${tool.totalPages-4 }"></c:set>
										<c:set var="end" value="${tool.totalPages }"></c:set>
									</c:if>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${begin }" end="${end }">
								<c:choose>
									<c:when test="${i==tool.currentPage }">
										<li class="am-active"><a href="<%=basePath%>user?method=findUsersByPage&currentPage=${tool.currentPage}&id=1">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="<%=basePath%>user?method=findUsersByPage&currentPage=${i}&id=1">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
									<c:when test="${tool.currentPage==tool.totalPages }">
										<li class="disabled">
											<a href="<%=basePath%>user?method=findUsersByPage&currentPage=${tool.totalPages}&id=1" aria-label="Previous">
												<span aria-hidden="true">»</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="<%=basePath%>user?method=findUsersByPage&currentPage=${tool.currentPage+1}&id=1" aria-label="Next">
												<span aria-hidden="true">»</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							<li class="paginItem"><a href="<%=basePath%>user?method=findUsersByPage&currentPage=${tool.totalPages}&id=1">尾页</a></li>
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
	    	window.location.href="<%=basePath %>user?method=findUsersByPage&id=1&currentPage="+topage;
	    }
	    
	    //添加用户
	    function add_user(){
			window.location.href="<%=basePath%>user?method=findAllUsers";
		}
		
	  //全选全不选
		$("#chkall").click(function(){
			//将子项复选框的状态与全选复选框的状态保持一致
			$(".chk").prop("checked",$(this).prop("checked"));
		});
		//批量删除
		function batchDelete() {
			//拼接删除的条件（2,3,4）
			var uids = "";
			//获取页面中所有被选择的复选框
			$(".chk:checked").each(function(){
				//,2,3,4
				uids +=","+$(this).val();
			})
			
			//非空验证
			if(uids == ""){
				alert("请选择要删除的项！");
				return;
			}
			
			//截取字符串
			uids = uids.substring(1);
			
			//请求后台服务器实现删除操作
			if(confirm("是否确定要删除？")){
				window.location.href="<%=basePath%>user?method=deleteManyUsers&uids="+uids;
			}
		}
	</script>  
</body>
</html>