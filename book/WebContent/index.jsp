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
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet" href="css/index.css">
<script src="<%=basePath%>js/jquery-3.1.1.js"></script>
<style>
body {
	margin: 0;
	padding: 0
}

#to_top {
	width: 54px;
	height: 72px;
	padding: 20px;
	font: 10px/10px arial;
	text-align: center;
	position: absolute;
	cursor: pointer;
	color: #fff
}
</style>
</head>
<body style="background-color: #fafafa;">

	<!-- 头部分 -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 滚动图片 -->
	<div class="scroll">
		<ul>
			<li><a href="index?method=showDetail&bid=1"><img
					src="img/scroll_01.jpg" alt=""></a></li>
			<li><a href="index?method=showDetail&bid=47"><img
					src="img/scroll_02.jpg" alt=""></a></li>
			<li><a href="index?method=showDetail&bid=34"><img
					src="img/scroll_03.jpg" alt=""></a></li>
			<li><a href="index?method=showDetail&bid=52"><img
					src="img/scroll_04.jpg" alt=""></a></li>
			<li><a href="index?method=showDetail&bid=28"><img
					src="img/scroll_05.jpg" alt=""></a></li>
			<li><a href="index?method=showDetail&bid=41"><img
					src="img/scroll_06.jpg" alt=""></a></li>
		</ul>
		<div class="scroll_dot">
			<span class="scroll_dot_span"></span> <span></span> <span></span> <span></span>
			<span></span> <span></span>
		</div>
		<div class="scroll_arrows">
			<a href="javascript:void(0);"><span
				class="left scroll_arrows_back">〈</span></a> <a
				href="javascript:void(0);"><span
				class="right scroll_arrows_back">〉</span></a>
		</div>
		<div class="scroll_left" style="height: 420px;">
			<ul class="scr-ul">
				<c:forEach items="${cyList }" var="cy">
					<li class="scr_li"><a href="index?method=showList&cid=${cy.cid }">${cy.cname }</a><i class="scr_i"></i></li>
				</c:forEach>
			</ul>
		</div>

	</div>

	<div class="time">
		<div class="H">畅销图书</div>
		<div class="time_in">
			<!-- 动态数据时使用，已经修改过css -->
			<c:forEach items="${newList }" var="book">
				<div
					style="background-color: #fff; width: 234px; height: 320px; float: left; margin-left: 11px;">
					<a href="index?method=showDetail&bid=${book.bid }" target="_blank">
						<img class="time_min"
						style="width: 180px; height: 234px; margin-left: 25px;"
						src="<%=picPath %>${book.pic }" alt="">
					</a>
					<div style="clear: both;"></div>

					<div style="width: 234px; height: 85px;">
						<div
							style="width: 234px; height: 20px; line-height: 20px; text-align: center; font-size: 14px; font-family: Arial">
							${book.bname }</div>
						<div
							style="width: 234px; height: 30px; line-height: 30px; text-align: center; color: #ff6700; font-size: 14px; font-family: Arial">
							<span style="color: #000"> &nbsp;${book.price } </span>
						</div>
						<div
							style="width: 234px; height: 35px; line-height: 35px; text-align: center; color: #000; font-size: 14px; font-family: Arial"
							title="????">

							<c:if test="${book.description.length() <=12 }">
		            				${book.description}
		            			</c:if>
							<c:if test="${book.description.length() > 12 }">
		            				${book.description.substring(0,12) }...
		            			</c:if>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- 原始代码 -仅供参考 -->
			<!-- <div><a href=""><img class="time_min" src="img/4_01.jpg" alt=""></a></div>
	            <div><a href=""><img src="img/4_02.jpg" alt=""></a></div>
	            <div><a href=""><img src="img/4_03.jpg" alt=""></a></div>
	            <div><a href=""><img src="img/4_04.jpg" alt=""></a></div>
	            <div><a href=""><img src="img/4_05.jpg" alt=""></a></div> -->
		</div>
	</div>
	<div class="appliances">
		<div class="app_width">
			<div class="app_A">CS经典教材</div>
			<div class="app_max">
				<!-- <div class="appl">
					<a href=""><img src="img/app_00.jpg" alt=""></a>
				</div> -->
				<div class="appr">
					<div class="appr_top">


						<!-- 动态获取数据时使用，已经修改过css -->
						<!-- 动态获取数据时使用，已经修改过css -->
						<c:forEach items="${csList }" var="book" varStatus="i">
							<!-- 第一排4个商品 -->
							<c:if test="${i.count<5 }">
								<div class="appr_min" id="appr_min1"
									style="margin-left: 12px; width: 234px; height: 300px; background-color: #FFF; text-align: center;">
									<a href="index?method=showDetail&bid=${book.bid }"
										target="_blank"><img width="160px" height="200px;"
										src="<%=picPath %>${book.pic}" alt=""></a>

									<div style="width: 234px; height: 100px;">
										<div
											style="width: 100%; height: 33px; text-align: center; font-size: 14px; font-family: Arial">${book.bname }</div>
										<div
											style="width: 100%; height: 33px; text-align: center; font-size: 14px; font-family: Arial">
											<c:if test="${book.description.length() <=12 }">
		            				${book.description}
		            			</c:if>
											<c:if test="${book.description.length() > 12 }">
		            				${book.description.substring(0,12) }...
		            			</c:if>
										</div>
										<div
											style="width: 100%; height: 33px; text-align: center; color: #ff6700; font-size: 14px; font-family: Arial">${book.price }元</div>
									</div>
								</div>
							</c:if>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>
	`

	<div class="popular">
		<div class="popular_background">
			<div class="popular_box_top">
				<div class="popular_box_top_al">热门图书</div>

			</div>
			<div class="popu_box">

				<!-- 动态数据使用，仅供参考 -->
				<c:forEach items="${hotList }" var="book" varStatus="i">

					<c:if test="${i.count ==1 }">
						<div class="popu popu_unleft popu_shadow">
							<a href="index?method=showDetail&bid=${book.bid }"
								target="_blank"><img
								style="width: 200px; height: 250px; margin-left: 50px;"
								src="<%=picPath %>${book.pic}"></a>
							<div class="popu_bottom">
								<p class="author">${book.author }</p>
								<div class="info">
									<h3 class="title">${book.bname }</h3>
									<span class="sep">|</span>
									<p class="price">
										<span>${book.price }</span>元
									</p>
								</div>
								<p class="review">
									<c:if test="${book.description.length() <=30 }">
		            				${book.description}
		            				</c:if>
									<c:if test="${book.description.length() > 30 }">
		            				${book.description.substring(0,30) }...
		            				</c:if>
								</p>

							</div>
						</div>
					</c:if>
					<c:if test="${i.count !=1 }">
						<div class="popu popu_unleft popu_shadow"
							style="margin-left: 13px;">
							<a href="index?method=showDetail&bid=${book.bid }"
								target="_blank"><img
								style="width: 200px; height: 250px; margin-left: 50px;"
								src="<%=picPath %>${book.pic}"></a>
							<div class="popu_bottom">
								<p class="author">${book.author }</p>
								<div class="info">
									<h3 class="title">${book.bname }</h3>
									<span class="sep">|</span>
									<p class="price">
										<span>${book.price }</span>元
									</p>
								</div>
								<p class="review">
									<c:if test="${book.description.length() <=30 }">
		            				${book.description}
		            				</c:if>
									<c:if test="${book.description.length() > 30 }">
		            				${book.description.substring(0,30) }...
		            				</c:if>
								</p>

							</div>
						</div>
					</c:if>

				</c:forEach>

			</div>


		</div>
	</div>
	<div id="to_top">
		<img src="https://i02piccdn.sogoucdn.com/4f3b2858eec9e2cf"
			width="42px" height="56px"> <font color="darkslateblue">返回顶部</font>
	</div>

	<!-- 底部的包含 -->
	<jsp:include page="footer.jsp"></jsp:include>

	<script>
		var abc = document.getElementsByClassName("script_capa_box_top_ar");
		console.log("abc:" + abc);
		console.log("abc[0]" + abc[0]);
		var box = document.getElementsByClassName("scrip_capa_box");
		console.log("box:" + box);
		console.log("box[0]:" + box[0]);
		for (var i = 0; i < abc.length; i++) {
			abc[i].index = i;
			abc[i].onmouseover = function() {
				for (var j = 0; j < abc.length; j++) {
					box[j].className = "capa_box scrip_capa_box";
				}
				box[this.index].className = "capa_box scrip_capa_box scrip_capa_box_on"
				console.log("this.index:" + this.index);
			}
		}
		var n = 0;

		/*setInterval(function () {
		    n++;
		     if(n > $(".scroll ul li").length){
		     n=0;
		     }
		    $(".scroll ul li").css("opacity","0").eq(n).css("opacity","1")
		},100)*/
		var t = setInterval(fun, 1000);
		function fun() {
			n++;
			if (n > $(".scroll>ul>li").length - 1) {
				n = 0;
			}
			$(".scroll>ul>li").css("opacity", "0").eq(n).css("opacity", "1")
			$(".scroll_dot span").eq(n).addClass("scroll_dot_span").siblings()
					.removeClass("scroll_dot_span");
		}
		$(".scroll_arrows .left").click(function() {
			n -= 2;
			if (n < -1) {
				n = 4;
			}
			fun()

		});
		$(".scroll_arrows .right").click(function() {
			fun()
		});
		$(".scroll_dot span").click(
				function() {
					console.log($(this).index());
					n = $(this).index() - 1;
					$(this).siblings().removeClass("scroll_dot_span").end()
							.addClass("scroll_dot_span");
					fun()
				});
		$(".scroll").hover(function() {
			clearInterval(t);
		}, function() {
			t = setInterval(fun, 1000);
		});

		window.onload = function() {
			var oTop = document.getElementById("to_top");
			var screenw = document.documentElement.clientWidth
					|| document.body.clientWidth;
			var screenh = document.documentElement.clientHeight
					|| document.body.clientHeight;
			oTop.style.left = screenw - oTop.offsetWidth + "px";
			oTop.style.top = screenh - oTop.offsetHeight + "px";
			window.onscroll = function() {
				var scrolltop = document.documentElement.scrollTop
						|| document.body.scrollTop;
				oTop.style.top = screenh - oTop.offsetHeight + scrolltop + "px";
			}
			oTop.onclick = function() {
				document.documentElement.scrollTop = document.body.scrollTop = 0;
			}
		};
	</script>
</body>
</html>