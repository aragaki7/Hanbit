<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 창</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<style type="text/css">
 	*{
 		margin: 0px;
 		padding: 0px;
 	}
 	p{
 	 text-align: left;
	 display: block;
  	 width: 400px;
  	 font-size:25pt;
  	 font-weight:bold;
  	 color:black;
 	}
 	hr { 
 	width: 800px;
 	border-top:3px solid #9C9C9C; 
 	border-bottom:3px solid #F6F6F6; 
 	 box-shadow: 5px 5px 5px lightgray;
 	}
	.content{
	height: 300px;
	}
	.join{
	margin-top: 40px;
	width: 100px;
	height: 40px;
	margin-left: 200px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
	
	}
	.back{
	margin-top: 40px;
	width: 100px;
	height: 40px;
	margin-left: 350px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
	}
</style>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		
		<!-- content start -->
		
		<br/><div class="grid9 content">
			<p>회원가입</p>
			<hr/><br/>
			
 				 <button type="submit" class="join" >가입</button>
 				 <button type="submit" class="back" >취소</button>
		</div>
		<!-- content end -->
		
		<%@ include file="../template/aside.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>