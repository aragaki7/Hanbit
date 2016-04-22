<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="css/nav.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css"/>
<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="js/menuLoad.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	   $('.bxslider').bxSlider({
	        auto: true,
	        autoControls: true
	      });   
	});
</script>
</head>
<body>
	<div class="container_12">
		<%@ include file="template/header.jsp" %>
		<%@ include file="template/nav.jsp" %>
		
		<!-- content start -->
		
		<div class="grid9">
			<ul class="bxslider">
				<li><img alt="main slideshow" src="imgs/slideshow1.gif"></li>
				<li><img alt="main slideshow" src="imgs/slideshow2.gif"></li>
				<li><img alt="main slideshow" src="imgs/slideshow3.gif"></li>
			</ul>
		</div>
		<!-- content end -->
		
		<%@ include file="template/aside.jsp" %>
		<%@ include file="template/footer.jsp" %>
	</div>
</body>
</html>