<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"//";
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>我的订单</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/car.css">
<script type="text/javascript"></script>
<%-- <link rel="stylesheet" href="<%=basePath%>admin/res/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=basePath%>admin/res/css/admin.css" /> --%>
<script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
<style type="text/css">
tr,td{
text-align: left;

}
img{
width:80px;
height:100px;
margin-top:10px;
margin-bottom:10px;
}
table{
border: 0px solid #333333;
	border-radius: 18px;
	margin: auto;
	margin-top:35px;
}
.btn1{
	width: 70px;
	height:28px;
	border: 2px solid #46B3E6;
	background-color: white;
	color: #46B3E6;
	border-radius: 4px;
	font-weight: 600;
	cursor:pointer;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="order_head1">
        <div class="head_background">
            <div class="head_box">
                <h1 class="head_h1">我的订单</h1>
            </div>
        </div>
    </div>
	<!-- <div class="order_head">
		<div class="head_background">
			<div class="head_box">
				<a href="index.html" class="head_left_a"><img src="img/book.jpg"
					alt="" class="head_left_p"></a> <span><h1 class="head_h1">我的订单</h1></span>
				<div class="head_right">
                    <span class="head_right_in"> 用户名称/用户账号 </span>
                    <span class="head_right_in">|</span>
                    <a href="" class="head_right_in">商城首页</a>
                </div>

			</div>
		</div>
	</div> -->
	<!-- <div class="trolley_background">
		<div class="am-g">
			<div class="am-u-sm-12">
				<form class="am-form"> -->
				<!-- 	<table class="am-table am-table-striped am-table-hover table-main"> -->
					<table style="width: 1226px; align:center; border-collapse:separate; border-spacing:10px;">
						<thead>
							<tr>
								<th class="table-check"><input name="chkall" id="chkall"
									value="" type="checkbox"></th>
								<th class="table-type">订单号</th>
								<th>物流状态</th>
								<th>费用</th>
								<th>订单状态</th>
								<th>创建时间</th>
								<th class="table-set">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${oList }" var="order">
								<tr>
									<td>
										<c:if test="${order.state==1 }"></c:if>
										<c:if test="${order.state==0 }"><input name="chk" class="chk" value="${order.oid }"type="checkbox"></c:if>
											
									</td>
									<td id="OID" class="OID">${order.oid }</td>
									<td>
										<c:if test="${order.log == 0 }"><font color="blue">未发货</font></c:if> 
									    <c:if test="${order.log == 1 }">已发货</c:if>
									</td>
									<td>${order.sum_price }</td>
									<td id="state">
										<c:if test="${order.state==0 }"><font color="blue">未支付</font></c:if>
										<c:if test="${order.state==1 }"><font>已支付</font></c:if>
									</td>
									<td><fmt:formatDate value="${order.create_time }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>

									<!-- <td class="am-hide-sm-only">男</td> -->
									<td>
										<div class="am-btn-toolbar">
											<div class="am-btn-group am-btn-group-xs">


												<span class="am-icon-pencil-square-o"></span><a
													href="<%=basePath%>order?method=showDetial&oid=${order.oid }&uid=${loginUser.uid }">查看</a>

												<span class="am-icon-trash-o"></span> <a
													href="<%=basePath%>order?method=delOrder&id=0&oid=${order.oid }&uid=${loginUser.uid }">
													<font color="red">删除</font>
												</a>

											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<%-- <div class="am-cf">
						共<i class="blue">${tool.totalCount }</i>条订单，当前显示第&nbsp;<i
							class="blue">${tool.currentPage } / ${tool.totalPages }&nbsp;</i>页
						<div class="am-fr">
							<ul class="am-pagination">
								<li><a
									href="<%=basePath %>order?method=findorderByPage&currentPage=1">«</a></li>
								<li><a
									href="<%=basePath %>order?method=findorderByPage&currentPage=${tool.prePage }">上一页</a></li>
								<li><a
									href="<%=basePath %>order?method=findorderByPage&currentPage=${tool.nextPage }">下一页</a></li>
								<li><a
									href="<%=basePath %>order?method=findorderByPage&currentPage=${tool.totalPages }">»</a></li>
							</ul>
						</div>
					</div>--%>
					<!-- <hr> -->
	<!-- 			</form>
			</div>
		</div>  -->
		

		<div class="tro_close_bot ">
			<!--<p class="tro_bot_ppp">+</p>-->
			<!-- <p class="tro_close_p ">
				<a href="">商城售后 </a> | 共<span>***</span>种商品
			</p> -->

			<!-- <p class="tro_close_p_c">
				合计:<span id="close">***</span>元
			</p> -->

			<p class="tro_close_p_r1" style="cursor: pointer; background：#0e90d2;" onclick="pay()">立即支付</p>
		</div>

<!-- 	</div> -->


	<jsp:include page="footer.jsp"></jsp:include>


</body>

<script>
	function pay(){
		var oids="";
		$('.chk:checked').each(function(){
			oids+=($(this).parent().siblings('#OID').text()+",");
		})
		if(oids.length==0){
			alert("支付订单数不得为零！")
		}else{
			window.location.href="<%=basePath%>order?method=settleOrd&oids="+oids+"&uid="+${loginUser.uid};
		}
	}





	//全选函数：
	$("#chkall").click(function(){
			$(".chk").prop("checked",$(this).prop("checked"));
			sum();
		})
		$(".chk").click(function(){
			var flag = $(this).prop("checked");
			if(!flag){
				$("#chkall").prop("checked",false);
			
			}
		})
	
</script>

</html>