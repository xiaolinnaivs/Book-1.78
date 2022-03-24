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
<title>订单管理</title>
<link rel="stylesheet" href="<%=basePath%>admin/res/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=basePath%>admin/res/css/admin.css" />
<script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
</head>
<body>
<input type="hidden" name = "currentPage" value="1"/>
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">订单管理</strong><small></small>
			</div>
		</div>


		<div class="am-g">
			<div class="am-u-sm-12 am-u-md-3">
				<div class="am-btn-toolbar">
					<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default" onclick="setlog()">
							<span class="am-icon-plus"></span> 发货
						</button>
					</div>
				</div>
			</div>
			<div class="am-u-sm-12 am-u-md-3">
				<div class="am-input-group am-input-group-sm">
					<form id="form1" action="<%=basePath %>order?method=findOrdersByPage&id=2" method="post" >
						<input type="text" class="am-form-field" placeholder="请输入要查询的订单信息" name="search" id="search"/> 
					</form>
					<span class="am-input-group-btn">
						<button class="am-btn am-btn-default" type="button" onclick="document.getElementById('form1').submit();">搜索</button>
					</span>
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
								<th class="table-id">订单号</th>
								<th class="table-type">用户ID</th>
								<th>发货</th>
								<th>支付状态</th>
								<th>创建时间</th>
								<th class="table-set">操作</th>
							</tr>
						</thead>
						<tbody>
						   <c:forEach items="${olist }" var ="ol" >
							<tr>
								<td>
								<c:if test="${ol.state == 1&&ol.log == 0 }"><input name="chk" class="chk" value="${ol.oid }"  type="checkbox"/></c:if>
								</td>
								<td id="OID">${ol.oid }</td>
								<td id="UID">${ol.uid }</td>
								<td>
								 <c:if test="${ol.log == 0 }"><font color="blue">未发货</font></c:if>
	                             <c:if test="${ol.log == 1 }">已发货</c:if>
								</td>
								<td>
                                 <c:if test="${ol.state == 0 }"><font color="blue">未支付</font></c:if>
	                             <c:if test="${ol.state == 1 }">已支付</c:if>
								</td>
								<td><f:formatDate value = "${ol.create_time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								
								<!-- <td class="am-hide-sm-only">男</td> -->
								<td>
									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs delorder">
											<span class="am-icon-trash-o"><a href=#><font color="red" >删除</font></a></span>
											
										</div>
									</div>
								</td>
							</tr>
                            </c:forEach>           
						</tbody>
					</table>
					<div class="am-cf">
						共<font color="blue">${tool.totalCount }</font>条记录，当前显示第&nbsp;<font color="blue">${tool.currentPage }/${tool.totalPages }</font>&nbsp;页
						<input type="text" name="topage" id="topage" style="width:40px; height:30px;"/>
						<input type="button" onclick="go()" value="Go"/>
						<div class="am-fr">
							<ul class="am-pagination">
							<li class="paginItem"><a href="<%=basePath%>order?method=findOrdersByPage&currentPage=1&id=1">首页</a></li>
								<c:choose>
									<c:when test="${tool.currentPage==1 }">
										<li class="disabled">
											<a href="<%=basePath%>order?method=findOrdersByPage&currentPage=1&id=1" aria-label="Previous">
												<span aria-hidden="true">«</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="<%=basePath%>order?method=findOrdersByPage&currentPage=${tool.currentPage-1}&id=1" aria-label="Previous">
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
										<li class="am-active"><a href="<%=basePath%>order?method=findOrdersByPage&currentPage=${tool.currentPage}&id=1">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="<%=basePath%>order?method=findOrdersByPage&currentPage=${i}&id=1">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
									<c:when test="${tool.currentPage==tool.totalPages }">
										<li class="disabled">
											<a href="<%=basePath%>order?method=findOrdersByPage&currentPage=${tool.totalPages}&id=1" aria-label="Previous">
												<span aria-hidden="true">»</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="<%=basePath%>order?method=findOrdersByPage&currentPage=${tool.currentPage+1}&id=1" aria-label="Next">
												<span aria-hidden="true">»</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							<li class="paginItem"><a href="<%=basePath%>order?method=findOrdersByPage&currentPage=${tool.totalPages}&id=1">尾页</a></li>
							</ul>
						</div>
					</div>
					<hr>
				</form>
			</div>
		</div>
	</div>
	

    <script type="text/javascript">
    	//变色
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
	    	window.location.href="<%=basePath%>order?method=findOrdersByPage&id=1&currentPage="+topage;
	    }
    	
	    //发货
	    function setlog(){
	    	var oids="";
			$('.chk:checked').each(function(){
				oids+=($(this).parent().siblings('#OID').text()+",");
			})
			if(oids.length==0){
				alert("发货数不得为零！")
			}else{
				window.location.href="<%=basePath%>order?method=setLog&oids="+oids;
				
			}
	    }
	    
	    //删除
	    $('.delorder').click(function(){
	    	var oid="";
	    	oid=$(this).parent().parent().siblings('#OID').text();
	    	if(confirm("是否要删除该订单")){
	    		window.location.href="<%=basePath%>order?method=delOrder&id=1&oid="+oid;
	    	}
	    })
	    
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
	
	</script>  
</body>
</html>
