<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정소개</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<!-- 과정소개(edprocess)css 시작 -->
<style type="text/css">
/* 겹치는부분시작 */
*{
 		margin: 0px;
 		padding: 0px;
}
.size{
	width: 300px;
	height: 200px;
}

.submitbtn{ 
 	position: relative; 
 	left: -470px; 
	top: -35px; 
 	height: 30px;
}
.detailbtn{ 
 	position: relative; 
 	left: -340px; 
	top: -65px; 
 	height: 30px; 
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
		 	
 .yes{
	margin-top: 40px;
	width: 110px;
	height: 30px;
	margin-left: 690px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;	
}
 /* 겹치는부분시작 */
 /* 겹치지않는부분시작 */
#a{
	display: block;
	text-decoration: none;
	font-weight:bold;
	font-size:13pt;
	color:#4C4C4C;
}
#process table{
  margin:30px; 
}
#process table tr td {
	border-bottom: 1px solid lightgray;
	font-size:15px;
	font-family:Arial;
	font-weight:normal;
}
</style>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		<!-- content start -->
		<!-- 과정소개 페이지 시작 -->
<br/><div class="grid9 content" >
<p>REGULAR CURRICULUM<br/><h4>정규교육과정</h4></p>
			<hr/><br/>
<div id="process"> 
	<table>
		<tr><th rowspan="4"><img class="size" src="../imgs/javaLogo.PNG"/></th>
			<td><a href="eduJava.jsp" id="a">교육과정 : 자바 프로그래밍</a></td></tr>
		<tr><td>교육장소 : 한빛신촌교육센터</td></tr>
		<tr><td>교육기간 : 2016.05.01 ~ 2016.05.31</td></tr>
		<tr><td>모집인원 : 20명</td></tr>
		<tr><td></td><td><div class="submitbtn">
						 <a href="eduApply.jsp"><input type="button" value="신청하기" class="yes"/></a></div>
						 <div class="detailbtn">
						 <a href="eduJava.jsp"><input type="button" value="상세보기" class="yes"/></a></div></td></tr>
	</table>
	<table> 
		<tr><th rowspan="4"><img class="size" src="../imgs/AndroidLogo.png"/></th>
			<td><a href="eduAndroid.jsp" id="a">교육과정 : 안드로이드 프로그래밍</a></td></tr>
		<tr><td>교육장소 : 한빛신촌교육센터</td></tr>
		<tr><td>교육기간 : 2016.05.01 ~ 2016.05.31</td></tr>
		<tr><td>모집인원 : 20명</td></tr>
		<tr><td></td><td><div class="submitbtn">
						 <a href="eduApply.jsp"><input type="button" value="신청하기"  class="yes"/></a></div>
						 <div class="detailbtn">
						 <a href="eduAndroid.jsp"><input type="button" value="상세보기" class="yes"/></a></div></td></tr>
	</table>
	<table>
		<tr><th rowspan="4"><img class="size" src="../imgs/jspLogo.png"/></th>
			<td><a href="eduJsp.jsp" id="a">교육과정 : JSP 프로그래밍</a></td></tr>
		<tr><td>교육장소 : 한빛신촌교육센터</td></tr>
		<tr><td>교육기간 : 2016.05.01 ~ 2016.05.31</td></tr>
		<tr><td>모집인원 : 20명</td></tr>
		<tr><td></td><td><div  class="submitbtn">
				         <a href="eduApply.jsp"><input type="button" value="신청하기" class="yes"/></a></div>
						 <div class="detailbtn">
						 <a href="eduJsp.jsp"><input type="button" value="상세보기" class="yes"/></a></div></td></tr>
	</table>
</div>
</div>
<!-- 과정소개 첫 페이지 끝 -->
		
		<!-- content end -->	
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>

