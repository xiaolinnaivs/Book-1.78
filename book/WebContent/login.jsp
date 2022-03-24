<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
	String picPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/bookpic/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Sign In And Sign Up Forms a Flat Responsive Widget
	Template :: w3layouts</title>
<link rel="stylesheet" href="css/style.css">
<link href="css/popup-box.css" rel="stylesheet" type="text/css"
	media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Sign In And Sign Up Forms  Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>

<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<script type="text/javascript" src="js/modernizr.custom.53451.js"></script>
<script>
	$(document).ready(function() {
		$('.popup-with-zoom-anim').magnificPopup({
			type : 'inline',
			fixedContentPos : false,
			fixedBgPos : true,
			overflowY : 'auto',
			closeBtnInside : true,
			preloader : false,
			midClick : true,
			removalDelay : 300,
			mainClass : 'my-mfp-zoom-in'
		});

	});
</script>
</head>
<body>
	<h1>Sign In And Sign Up Forms</h1>
	<div class="w3layouts">
		<div class="signin-agile">
			<h2>Sign In</h2>
			<form  method="post" action="<%=basePath %>user?method=login">
				<input type="text" name="username" class="username" placeholder="Username"
					required=""> <input type="password" name="upwd"
					class="upwd" placeholder="Password" required="">
				<ul>
					<li><input type="checkbox" id="brand1" value=""> <label
						for="brand1"><span></span>Remember me</label></li>
				</ul>
				
				<a href="forgetpwd.jsp" >Forgot Password?</a>
				<br>
				<div class="clear"></div>
				
				<input type="submit" value="Login">
				<!--高先建  -->
			</form>
		</div>
		
		
		
		<div class="signup-agileinfo">
			<h3>Sign Up</h3>
			<p>If you have not registered an account,
			 please click the "sign up" button to jump to the registration page.
			 </p>
			<div class="more">
				<a class="book popup-with-zoom-anim button-isi zoomIn animated"
					data-wow-delay=".5s" href="#small-dialog">Sign Up</a>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="footer-w3l">
		<p class="agileinfo">&copy;</p>
	</div>
	<div class="pop-up">
		<div id="small-dialog" class="mfp-hide book-form">
			<h3>Sign Up Form</h3>
			<form action="user?method=regist" method="post" id="regist">
				<table style="width: 570px;" border="0" cellspacing="0">
             			<tr>
             				<td>
             					<input type="text" name="username" id="username" placeholder="Your Name"  />
             					<span id="username_msg"></span>
             				</td>
             				
             			</tr>
             			<tr>
             				<td><input type="text" name="uphone" id="uphone" placeholder="Phone"  />
             				
             					<span id="uphone_msg"></span>
             				</td>
             			</tr>
             			<tr>
             				<td><input type="text" name="email" id="email" placeholder="Email"/> 
             				
             					<span id="email_msg"></span>
             				</td>
             			</tr>
             			<tr>
             				<td><input type="password" name="upwd" id="upwd" placeholder="Password"  />
             				
             					<span id="upwd_msg"></span>
             				</td>
             			</tr>
             			<tr>
             				<td><input type="password" name="upwd2" id="upwd2" placeholder="Password"  /> 
             				
             					<span id="upwd2_msg"></span>
             				</td>
             			</tr>
             			
             			<tr>
             				<td colspan="2"><input type="text" value="" placeholder="请输入验证码（不区分大小写）" class="input-val" /> 
             				
             					<canvas id="canvas"  color="red"></canvas>
             				</td>
             			</tr>
             			
             		</table>
					<input type="button" value="Sign Up" id="btn" class="btn">
			</form>
		</div>
	</div>
	
</body>

<script>
 $(function(){
  var show_num = [];
  draw(show_num);
  $("#canvas").on('click',function(){
	  show_num = [];
 	  draw(show_num);
  })
  $(".btn").on('click',function(){
   var val = $(".input-val").val().toLowerCase();
   var num = show_num.join("");
   if(val==''){
    alert('请输入验证码！');
   }else if(val == num){
	   yzm_flag=true;
    /* $(".input-val").val(''); */
   }else{
     alert('验证码错误！'); 
    $(".input-val").val('');
   }
  })
 })
 //生成并渲染出验证码图形
 function draw(show_num) {
  var canvas_width=$('#canvas').width();
  var canvas_height=$('#canvas').height();
  var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
  var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
  canvas.width = canvas_width;
  canvas.height = canvas_height;
  var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
  var aCode = sCode.split(",");
  var aLength = aCode.length;//获取到数组的长度
  for (var i = 0; i < 4; i++) { //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
   var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
   // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
   var deg = Math.random() - 0.5; //产生一个随机弧度
   var txt = aCode[j];//得到随机的一个内容
   show_num[i] = txt.toLowerCase();
   var x = 50 + i * 20;//文字在canvas上的x坐标
   var y = 50 + Math.random() * 8;//文字在canvas上的y坐标
   context.font = "bold 23px 微软雅黑";
   context.translate(x, y);
   context.rotate(deg);
   context.fillStyle = randomColor();
   context.fillText(txt, 0, 0);
   context.rotate(-deg);
   context.translate(-x, -y);
  }
  for (var i = 0; i <= 5; i++) { //验证码上显示线条
   context.strokeStyle = randomColor();
   context.beginPath();
   context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
   context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
   context.stroke();
  }
  for (var i = 0; i <= 30; i++) { //验证码上显示小点
   context.strokeStyle = randomColor();
   context.beginPath();
   var x = Math.random() * canvas_width;
   var y = Math.random() * canvas_height;
   context.moveTo(x, y);
   context.lineTo(x + 1, y + 1);
   context.stroke();
  }
 }
 //得到随机的颜色值
 function randomColor() {
  var r = Math.floor(Math.random() * 256);
  var g = Math.floor(Math.random() * 256);
  var b = Math.floor(Math.random() * 256);
  return "rgb(" + r + "," + g + "," + b + ")";
 }
</script>

<script type="text/javascript">
	//单机立即注册按钮提交表单
	$("#btn").click(function(){
	if(username_flag&&uphone_flag&&email_flag&&upwd_flag&&upwd2_flag&&yzm_flag){	
		//两个form 要取id
		$("#regist").submit();
		
		alert("注册成功！");
	}else if(yzm_flag==false){
		
	}else{
		alert("请填写有效用户数据");
	}
	})
//标识表单验证是否通过
	var username_flag,uphone_flag,email_flag,upwd_flag,upwd2_flag,yzm_flag=false;
	var upwd ,upwd2;
//********************
	$("#upwd").blur(function(){
		//清空错误消息
		$("#upwd_msg").html("");
		//获取姓名文本框的值
		upwd = $(this).val();
		//非空验证
		if($.trim(upwd).length == 0){
			$("#upwd_msg").html("密码不能为空!").css("color","red");
			upwd_flag=false;
			return;
		}
		
		//********20200716
		if($.trim(upwd).length < 6){
			$("#upwd_msg").html("密码不能少于6位数").css("color","red");
			upwd_flag=false;
			return;
		}else if($.trim(upwd).length > 20){
			$("#upwd_msg").html("密码不能多于20位数").css("color","red");
			upwd_flag=false;
			return;
		}
		//alert(upwd);
		var m=0;
		 //匹配数字
	    if (/\d+/.test(upwd)) {
	      debugger;
	      m++;
	    };
	    //匹配字母
	    if (/[A-Za-z]+/.test(upwd)) {     
	      m++;
	    };
	    //匹配除数字字母外的特殊符号
	    if (/[^0-9a-zA-Z]+/.test(upwd)) {      
	      m++;
	    };
	    //alert(m);
	    if(m<3){
	    	$("#upwd_msg").html("密码请由数字、字母、特殊符号组成").css("color","red");
			upwd_flag=false;
			return;
	    }	
		
		upwd_flag=true;
	});
//******************************XXXXXXXXXXXXXXXXXXXXXXXXXX
	$("#upwd2").blur(function(){
		//清空错误消息
		$("#upwd2_msg").html("");
		//获取姓名文本框的值
		upwd2 = $(this).val();
		upwd = $("#upwd").val();
		//alert(upwd);
		//非空验证
		if($.trim(upwd2).length == 0){
			$("#upwd2_msg").html("密码不能为空!").css("color","red");
			upwd2_flag=false;
			return;
		}
		if(upwd != upwd2 ){
			$("#upwd2_msg").html("两次密码不相同！").css("color","red");
			upwd2_flag=false;
			return;
		}
		upwd2_flag=true;
	});	

//**********************
	$("#username").blur(function(){
		//清空错误消息
		$("#username_msg").html("");
		//获取姓名文本框的值
		var username = $(this).val();
		//非空验证
		if($.trim(username).length == 0){
			$("#username_msg").html("账号不能为空!").css("color","red");
			username_flag=false;
			return;
		}
		 //唯一验证 ajax异步请求 
		 $.ajax({
			 url:"user",//向后台servlet发出请求
			 data:{"method":"checkUserName","username":username},//向后台传递的参数
			 type:"post",//提交方式
			 dataType:"text",//响应回来的数据类型
			 success:function(data){//data响应回来的数据
				 //对返回的数据进行判断处理
				 if(data == "true"){
					 $("#username_msg").html("该账号已被注册！").css("color","red");
				 }else{
					 $("#username_msg").html("√").css("color","green");
				 } 
			 } 
		 })
		username_flag=true;
	});
//********************
	$("#email").blur(function(){
		//清空错误消息
		$("#email_msg").html("");
		//获取姓名文本框的值
		var email = $(this).val();
		//非空验证
		if($.trim(email).length == 0){
			$("#email_msg").html("email不能为空!").css("color","red");
			email_flag=false;
			return;
		}
		$("#email_msg").html("√").css("color","green");
		email_flag=true;
	});
//********************
	$("#uphone").blur(function(){
		//清空错误消息
		$("#uphone_msg").html("");
		//获取手机号
		var uphone = $(this).val();
		//非空验证
		if($.trim(uphone).length == 0){
			$("#uphone_msg").html("手机号不能为空!").css("color","red");
			uphone_flag=false;
			return;
		}
		//格式验证 正则表达式
		 var reg = /^1[3456789]\d{9}$/;
		 if(!(reg.test(uphone))){ 
			 $("#uphone_msg").html("手机号码有误!").css("color","red");
		        return false; 
		    } 
		 //唯一验证 ajax异步请求 
		 $.ajax({
			 url:"user",//向后台servlet发出请求
			 data:{"method":"checkPhone","uphone":uphone},//向后台传递的参数
			 type:"post",//提交方式
			 dataType:"text",//响应回来的数据类型
			 success:function(data){//data响应回来的数据
				 //对返回的数据进行判断处理
				 if(data == "true"){
					 $("#uphone_msg").html("该手机号已被注册！").css("color","red");
				 }else{
					 $("#uphone_msg").html("√").css("color","green");
				 } 
			 } 
		 })
		uphone_flag=true;
	});

</script>	



</html>