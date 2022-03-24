<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	String picPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/bookpic/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${book.bname }</title>
    <link rel="stylesheet" href="<%=basePath %>css/index.css">
    <script src="<%=basePath %>js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	

</script>
</head>
<body>
    
    <jsp:include page="header.jsp"></jsp:include>
    
    <div class="plus5_no3">
        <div class="plus5_no3_img">
            <img width="460px" height="560px" src="<%=picPath %>${book.pic}" style="display: block" alt="">
        </div>
        <div class="plus5_no3_right">
            <h2>${book.bname }</h2>
            <p class="plus5_no3_right_p2">
            	<div style="font-size: 14px;">${book.description }</div>
            	
            </p>
            <p class="plus5_no3_right_p3">图书价格 ${book.price }元<span class="plus5_no3_right_span3">价格${book.price }元</span></p>
           <!--  <div class="plus5_no3_right_div4">
                <div class="plus5_no3_right_div4_in">
                    <p class="plus5_no3_right_p4">赠品</p><span>**</span>
                </div>
                <div class="plus5_no3_right_div4_in">
                    <p class="plus5_no3_right_p4">赠品</p><span>**</span>
                </div>


            </div> -->
            <!-- <div class="plus5_no3_right_div5">
                    <p >北京 北京市 东城区 永定门外街道 <span class="plus5_no3_right_div5_span"><a class="plus5_no3_right_div5_span" href="">修改</a> &nbsp;&nbsp;  有现货</span></p>
            </div> -->
            <div class="plus5_no3_right_div6">选择图书</div>
            <div class="plus5_no3_right_div7">
            
            	<li class="plus5_no3_right_div7_in plus5_no3_right_div7_in_hover">
                    <span class="plus5_no3_right_div7_span0 ">书名  ${book.bname }</span>
                    <span class="plus5_no3_right_div7_span " >商品价格  ${book.price }元</span>
                </li>
            	
                <!-- <li class="plus5_no3_right_div7_in plus5_no3_right_div7_in_hover">
                    <span class="plus5_no3_right_div7_span0 ">3GB+32GB</span>
                    <span class="plus5_no3_right_div7_span " >999元</span>
                </li>
                <li class="plus5_no3_right_div7_in plus5_no3_float">
                    <span class="plus5_no3_right_div7_span0 ">4GB+64GB</span>
                    <span class="plus5_no3_right_div7_span " >1299元</span>
                </li> -->
               
            </div>
             <!-- 
            <div class="plus5_no3_right_div6">选择颜色</div>
            <div class="plus5_no3_right_div9">
            	<li class="plus5_no3_right_div7_in plus5_no3_right_div7_in_hover ">
            		<img src="img/plus5_phone_01.png" alt=""><span>${book.price }</span>
            	</li>
                <li class="plus5_no3_right_div7_in plus5_no3_right_div7_in_hover "><img src="img/plus5_phone_01.png" alt=""><span>金色</span></li>
                <li class="plus5_no3_right_div7_in plus5_no3_float"><img src="img/plus5_phone_02.png" alt=""><span>黑色</span></li>
                <li class="plus5_no3_right_div7_in"><img src="img/plus5_phone_03.png" alt=""><span>玫瑰金</span></li>
                <li class="plus5_no3_right_div7_in plus5_no3_float"><img src="img/plus5_phone_04.png" alt=""><span>浅蓝色</span></li>
            </div>
             -->
            <div class="plus5_no3_right_div10">
                <p class="plus5_no3_right_div10_p1">${book.bname } 
                <span class="plus5_no3_right_div10_span0">  作者  ${book.author }</span> 
                <span class="plus5_no3_right_div10_span1"></span>
                </p>
                <span class="plus5_no3_right_span10">${book.price }元</span>
                <p class="plus5_no3_right_div10_p2" style="font-size: 18px;font-weight: bold;">总计 ：商品价格 ${book.price }元</p>

            </div>
            <a href="trolley?method=addTro&bid=${book.bid }&uid=${loginUser.uid}" ><div class="plus5_no3_right_div11" style="cursor: pointer;" >加入购物车</div></a>
            <div class="plus5_no3_right_div12">
                <div class="plus5_no3_right_div12_y">√</div>
                <div class="plus5_no3_right_div12_z">七天无理由退货</div>
                <div class="plus5_no3_right_div12_y">√</div>
                <div class="plus5_no3_right_div12_z">15天质量问题换货</div>
                <div class="plus5_no3_right_div12_y">√</div>
                <div class="plus5_no3_right_div12_z">360天保障</div>
            </div>
            <a href="javascript:void (0);"></a>

        </div>
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
    
    <script>
        var plus5_no2_in = document.getElementById("plus5_no2_in");
        var plus5_no2 = document.getElementsByClassName("plus5_no2")[0];
        plus5_no2.onclick = function () {
            plus5_no2.className="plus5_no2 plus5_no2_close";
//            plus5_no2.style.display="none";
        }
        $(".plus5_no3_right_div9 .plus5_no3_right_div7_in").click(function () {
            console.log($(this).children().eq(1).html());
            $(".plus5_no3_right_div10_span2").html($(this).children().eq(1).html());

            $(".plus5_no3_img img").css("display","none").eq($(this).index()).css("display", "block");
            $(this).siblings().removeClass("plus5_no3_right_div7_in_hover").end().addClass("plus5_no3_right_div7_in_hover");

        })
        $(".plus5_no3_right_div7 .plus5_no3_right_div7_in").click(function () {
//            var value = $(".plus5_no3_right_div7_span0 ").html();
            console.log($(this).children().eq(1).html());
            $(".plus5_no3_right_div10_span0").html($(this).children().html());
            $(".plus5_no3_right_span10").html($(this).children().eq(1).html());
            var value = "总计:"+$(this).children().eq(1).html()
            $(".plus5_no3_right_div10_p2").html(value);

            $(this).siblings().removeClass("plus5_no3_right_div7_in_hover").end().addClass("plus5_no3_right_div7_in_hover");
        })
    </script>

</body>
</html>