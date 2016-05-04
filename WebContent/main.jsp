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
				
		<!-- content end -->

		<%@ include file="template/aside.jsp"%>
		<%@ include file="template/footer.jsp"%>
	</div>
</body>
</html>