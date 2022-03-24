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
<title>Insert title here</title>
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
                <h1 class="head_h1">我的购物车</h1>
            </div>
        </div>
    </div>
	
	<table style="width: 1226px; align:center; border-collapse:separate; border-spacing:10px;">
		
		<thead>
			<tr >
				<th><input type="checkbox" id="chkall" class="chkall" name="chkall" ></th>
				<th >商品名称</th>
				<th> 商品图片</th>
				<th>作者</th>
				<th>简介</th>
				<th >单价</th>
				<th >数量</th>
				<th >小计</th>
				<th >操作</th>
			</tr>
			
		</thead>
		
		<tbody>
		<c:forEach items="${trolist }" var="tro">
				<tr class="tro_tr">
					<td><input type="checkbox" id="chk" class="chk" name="chk" value="1" ></td>
					<td id="TID" class="TID" hidden="hidden" >${tro.tid}</td>
					<td id="BID" class="BID" hidden="hidden" >${Map[tro.tid].bid}</td>
					<td >${Map[tro.tid].bname}</td>
					<td ><img alt="" src="<%=picPath %>${Map[tro.tid].pic}"></td>
					<td>${Map[tro.tid].author}</td>
					<td>
					<c:if test="${Map[tro.tid].description.length() <=12 }">
		            ${Map[tro.tid].description}
		            </c:if>
					<c:if test="${Map[tro.tid].description.length() > 12 }">
		            ${Map[tro.tid].description.substring(0,12) }...
		            </c:if>
					</td>
					<td id="price">${Map[tro.tid].price}</td>
					<td id="nums"><a  id="subtract" href="javascript:void(0)" onclick="addOrDeleteNumber()">-</a>
               		 <input type="text" value="${tro.number }" id="num" class="num" onblur="upnum(this)" size="5">
                    <a  id="plus" href="javascript:void(0)" onclick="addOrDeleteNumber()">+</a></td>
					<td id="prices" class="prices">99</td>
					<td ><a href="<%=basePath%>trolley?method=delTro&tid=${tro.tid}"><button class="btn1">删除</button></a></td>
				</tr>
		</c:forEach>
		</tbody>	
	</table>
		<div class="tro_close_bot ">
            <!--<p class="tro_bot_ppp">+</p>-->
            <p class="tro_close_p "> <a href="<%=basePath%>index?method=showInformation">继续购物</a></p>
           
            <p class="tro_close_p_c">合计:<span id="close">0.00</span>元</p>
            
            <p class="tro_close_p_r" style="cursor: pointer;" onclick="pay()">去结算</p>
        </div>
</body>

<script>
	function pay(){
		var bids="";
		var numbers="";
		var sum=parseInt(document.getElementById("close").innerHTML);
		$('.chk:checked').each(function(){
			bids+=($(this).parent().siblings('.BID').text()+",");
			//.get(0).tagName
			numbers+=($(this).parent().siblings('#nums').children("input.num").val()+",");
		})
		window.location.href="<%=basePath%>order?method=makeOrder&bids="+bids+"&numbers="+numbers+"&sum="+sum+"&uid="+${loginUser.uid};
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
	//
	function price(){
		var trlist = document.getElementsByClassName("tro_tr");
		var total=0;
		if(trlist.length>0){
			for(var i=0;i<trlist.length;i++){
				var price=trlist[i].querySelector('#price').innerHTML;
				var number=trlist[i].querySelector('#num').value;
				trlist[i].querySelector('#prices').innerHTML=price*number;
			}
		}
		 
	}
	//总价计算error
	function sum(){
		var total=0;
		$('.chk:checked').each(function(){
			total+=parseInt($(this).parent().siblings('.prices').text());
		})
		document.getElementById("close").innerHTML=total;
	}
	//更改总价
	function clk(){
		$(".chk").click(function(){
			sum()
		});
		
	}
	
	window.onload=price();
	//每次点击后根据小计改变总价
	window.onload=clk();
	
	//更改数量
	function upnum(obj){
		price();
		sum();
	}
</script>
</html>