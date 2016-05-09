<%@page import="data.Dday"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>      
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" type="text/css" href="css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="css/navmain.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" />
<style type="text/css"> 
.bxslider>li img {
	width: 80%;
	margin: 20px auto; 
	border: 0px;
}

.bx-viewport {
	border: 0px;
} 
span>a>img {
	width: 49%;
	margin: 20px auto;
}	

.bx-wrapper .bx-controls-auto .bx-stop {
	display: block;
	text-indent: -9999px;
	width: 9px;
	height: 11px;
	outline: 0;
	background: url(imgs/controls.png) -86px -44px no-repeat;
	margin: 0 3px;
}

.bx-wrapper .bx-controls-auto .bx-start {
	display: block;
	text-indent: -9999px;
	width: 10px;
	height: 11px;
	outline: 0;
	background: url(imgs/controls.png) -86px -11px no-repeat;
	margin: 0 3px;
}

.bx-wrapper .bx-prev {
	left: 10px;
	background: url(imgs/controls.png) no-repeat 0 -32px;
}

.bx-wrapper .bx-next {
	right: 10px;
	background: url(imgs/controls.png) no-repeat -43px -32px;
}
/*
.nav2{
  	position:absolute;
    z-index: 1;
	margin-top:150px;
}
.nav3{
  	position:absolute;
    z-index: 1;
	margin-left:240px;
	margin-top:150px;
}
.nav4{
  	 position:absolute;
     z-index: 1;
	 margin-left:480px;
	 margin-top:150px;
}
.nav5{
  	 position:absolute;
     z-index: 1;
  	 margin-left:720px;
	 margin-top:150px;
}
.nav6{
  	 z-index: 1;
	 position:absolute;
	 margin-left:960px;
	 margin-top:150px;
}
*/

.bx-prev{
	position:absolute;
	z-index:-1;
}

.bx-next{
	position:absolute;
	z-index:-1;
}
#img1, #img2{
	margin-top: -30px;
}
</style>
<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="js/menuLoad.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('.bxslider').bxSlider({
			auto : true,
			autoControls : true,
			controls : true,
			pager : true
		});
		
		<%
			String joinResult = (String)request.getParameter("joinresult");
			if(joinResult!=null)
				if("success".equals(joinResult)){%>
					alert('가입을 축하드립니다.');
				<%}%>
			<%
			String editResult = (String)request.getParameter("editresult");
			if(editResult!=null)
				if("success".equals(editResult)){%>
					alert('수정이 완료되었습니다.');
				<%}%>
			<%
			String appresult = (String)request.getParameter("appresult");
			if(appresult!=null)
				if("success".equals(appresult)){%>
					alert('신청이 완료되었습니다.');
				<%}%>
	});
</script>
</head>
<body>
	<div class="container_12">
		<%@ include file="template/header.jsp"%>
		<%@ include file="template/nav.jsp"%>

		<!-- content start -->

		<div class="grid9">
			<ul class="bxslider">
				<li><img alt="main slideshow" src="imgs/slideshow1.gif"></li>
				<li><img alt="main slideshow" src="imgs/slideshow2.gif"></li>
				<li><img alt="main slideshow" src="imgs/slideshow3.gif"></li>
			</ul>
			
			<span><a href="http://hanbitsc.com/"><img id="img1" alt="한빛 신촌점" src="imgs/center_hanbit.jpg"/></a></span>
			<span><a href="http://hanbitgn.com/"><img id="img2" alt="한빛 강남점" src="imgs/center_gangnam.jpg"/></a></span>
		
		</div>
<!-------------- mobile 버전 main 시작----------------->
<div id="mobileblock">
<form action="#" class="mbform" id="layerBtn">		<!-- intro폼 -->
<button class="mbbtn1" ><a href="#" id="mbintro">Intro</a><img src="imgs/mbintro.png" alt="logo" id="mbimg1"/></button>
</form>
<div id="lay">
  <h2>Intro</h2>
  <button>개요</button><br/><button>CEO소개</button><br/>
  <button>연혁</button><br/><button>시설/장비</button><br/>
  <button>교수진</button><br/><button>입학안내</button><br/>
  <button>수상현황</button><br/><button>찾아오는길</button><br/>
  <span id="close">닫기</span>
 </div>
 
<form action="#" class="mbform" id="layerBtn2">		<!-- Edu폼 -->
<button class="mbbtn2"><a href="#" id="mbedu">Edu</a><img src="imgs/mbedu.png" alt="logo" id="mbimg2"/></button>
</form>
<div id="lay2">
  <h2>Edu</h2>
  <button>과정소개</button>
  <span id="close2">닫기</span>
 </div>

<form action="#" class="mbform" id="layerBtn3">		<!-- Service폼 -->
<button class="mbbtn3"><a href="#" id="mbservice">Service</a><img src="imgs/mbservice.png" alt="logo" id="mbimg3"/></button>
</form>
<div id="lay3">
  <h2>Service</h2>
  <button>취업교육</button><br/><button>재직자교육</button><br/>
  <button>기업맞춤교육</button>
  <span id="close3">닫기</span>
 </div>
 
<form action="#" class="mbform" id="layerBtn4">		<!-- Dept폼 -->
<button class="mbbtn4"><a href="#" id="mbdept">Dept</a><img src="imgs/mbdept.PNG" alt="logo" id="mbimg4"/></button>
</form>
<div id="lay4">
  <h2>Dept</h2>
  <button>영업부</button><br/><button>행정부</button><br/>
  <button>교육진</button><br/><button>관리자</button><br/>
  <span id="close4">닫기</span>
 </div>

<form action="#" class="mbform" id="layerBtn5">		<!-- Customer폼 -->
<button class="mbbtn5"><a href="#" id="mbcustomer">Customer</a><img src="imgs/mbcustomer.png" alt="logo" id="mbimg5"/></button>
</form>
<div id="lay5">
  <h2>Customer</h2>
  <button>공지사항</button><br/><button>1:1문의</button><br/>
  <button>자유게시판</button><br/><button>Q&A</button><br/>
  <span id="close5">닫기</span>
 </div>

<img src="imgs/BKLogo.png" alt="hblogo" id="Hblogo"/>  <!-- Logo -->
</div>

<script type="text/javascript">
$(document).ready(function(){
	   $("#lay,#lay2,#lay3,#lay4,#lay5").hide(); // 팝업창 숨김
	   $("#layerBtn").click(function(){   //layerBtn=>Intro폼을 클릭하면
	    $('<div id="blind_box"></div>').css('opacity',0.7).appendTo('body');     
	    $('#lay').fadeIn(300);    
	    $('#lay').css('z-index', '100');        //blind_box와 lay=>팝업창을 보여준다.
	   });
	   $("#layerBtn2").click(function(){
		    $('<div id="blind_box"></div>').css('opacity',0.7).appendTo('body');     
		    $('#lay2').fadeIn(300);    
		    $('#lay2').css('z-index', '100');        
		   });
	   $("#layerBtn3").click(function(){
		    $('<div id="blind_box"></div>').css('opacity',0.7).appendTo('body');     
		    $('#lay3').fadeIn(300);    
		    $('#lay3').css('z-index', '100');        
		   });
	   $("#layerBtn4").click(function(){
		    $('<div id="blind_box"></div>').css('opacity',0.7).appendTo('body');     
		    $('#lay4').fadeIn(300);    
		    $('#lay4').css('z-index', '100');        
		   });
	   $("#layerBtn5").click(function(){
		    $('<div id="blind_box"></div>').css('opacity',0.7).appendTo('body');     
		    $('#lay5').fadeIn(300);    
		    $('#lay5').css('z-index', '100');        
		   });
	  
	   $("#close").click(function(){ //#close=>닫기 를 누르면 
	    $("#blind_box").remove();	 // blind_box를 제거하고
	    $("#lay").hide();			 // lay=>팝업창을 숨긴다.
	   });
	   $("#close2").click(function(){
		    $("#blind_box").remove();
		    $("#lay2").hide();
		   });
	   $("#close3").click(function(){
		    $("#blind_box").remove();
		    $("#lay3").hide();
		   });
	   $("#close4").click(function(){
		    $("#blind_box").remove();
		    $("#lay4").hide();
		   });
	   $("#close5").click(function(){
		    $("#blind_box").remove();
		    $("#lay5").hide();
		   });
	   });
</script>
<!-------------- mobile 버전 main 끝----------------->
		<!-- content end -->

		<%@ include file="template/aside.jsp"%>
		<%@ include file="template/footer.jsp"%>
	</div>
</body>
</html>