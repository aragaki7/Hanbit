<%@page import="data.Dday"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" type="text/css" href="css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="css/nav.css" />
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
		</div>
		<!-- content end -->

		<%@ include file="template/aside.jsp"%>
		<%@ include file="template/footer.jsp"%>
	</div>
</body>
</html>