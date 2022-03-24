<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>订单详情</title>
<link rel="stylesheet" href="css/car.css">
<link rel="stylesheet" href="css/index.css">

<script src="<%=basePath%>js/jquery-3.1.1.js"></script>
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
border: 1px solid #333333;
	border-radius: 18px;
	margin: auto;
	margin-top:50px;
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
	<div class="order_head">
        <div class="head_background">
            <div class="head_box">
                <h1 class="head_h1">订单详情</h1>
                <a href="<%=basePath%>order?method=showOrder&uid=${loginUser.uid }">返回</a>
            </div>
        </div>
    </div>
	
	<table style="width: 1226px; align:center; border-collapse:separate; border-spacing:10px;">
		
		<thead>
			<tr >
				<th>商品名称</th>
				<th>商品图片</th>
				<th>作者</th>
				<th>简介</th>
				<th >单价</th>
				<th >数量</th>
				<th >小计</th>
				
			</tr>
			
		</thead>
		
		<tbody>
		<c:forEach items="${bList }" var="bl" varStatus="Bindex">
				<tr class="tro_tr">
					<td id="TID" hidden="hidden" >${tro.tid}</td>
					<td id="BID" hidden="hidden" >${Map[tro.tid].bid}</td>
					<td >${bl.bname}</td>
					<td ><img alt="" src="<%=picPath %>${bl.pic}"></td>
					<td>${bl.author}</td>
					<td>
					<c:if test="${bl.description.length() <=12 }">
		            ${bl.description}
		            </c:if>
					<c:if test="${bl.description.length() > 12 }">
		            ${bl.description.substring(0,12) }...
		            </c:if>
					</td>
					<td id="price">${bl.price}</td>
					<td id="nums">${nList.get(Bindex.index)}</td>
					<td id="prices" class="prices"></td>
				</tr>
		</c:forEach>
		</tbody>	
	</table>
		<div class="tro_close_bot ">
            <!--<p class="tro_bot_ppp">+</p>-->
           
            <p class="tro_close_p_c">合计:<span id="close">0.00</span>元</p>
            
            
        </div>
</body>

<script>
	function pay(){
		var bids="";
		var numbers="";
		var uid=1;
		var sum=parseInt(document.getElementById("close").innerHTML);
		$(':checked').each(function(){
			bids+=($(this).parent().siblings('#ID').text()+",");
			//.get(0).tagName
			numbers+=($(this).parent().siblings('#nums').children("input.num").val()+",");
		})
		window.location.href="<%=basePath%>trolley?method=makeOrder&bids="+bids+"&numbers="+numbers+"&sum="+sum+"&uid="+uid;
	}

	//
	function price(){
		var trlist = document.getElementsByClassName("tro_tr");
		var total=0;
		if(trlist.length>0){
			for(var i=0;i<trlist.length;i++){
				var price=trlist[i].querySelector('#price').innerHTML;
				var number=trlist[i].querySelector('#nums').innerHTML;
				trlist[i].querySelector('#prices').innerHTML=price*number;
			}
		}
		 
	}
	//总价计算error
	function sum(){
		var total=0;
		$('.prices').each(function(){
			total+=parseInt($(this).text());
		})
		document.getElementById("close").innerHTML=total;
	}
	
	window.onload=price();
	window.onload=sum();
</script>
</html>