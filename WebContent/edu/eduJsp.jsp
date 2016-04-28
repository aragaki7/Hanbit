<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jsp상세보기</title>

<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<!-- eduJsp상세보기css 시작 -->
<style type="text/css">
/* 겹치는부분시작(+eduAndroid와 겹치는것도 넣음) */
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
#hr2 { 
 	width: 100px;
 	border-top:3px solid #9C9C9C; 
 	border-bottom:1px solid lightgray; 
 	box-shadow: 5px 5px 5px lightgray;
 	}
.table ,.table2{
	margin:0px;
	padding:0px;
	width:800px;
	box-shadow: 10px 10px 5px #888888;
	border:1px solid #000000;
	font-size: 11pt;
	}
.table table{
    border-collapse: collapse;
    border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;
	padding:0px;
	}
.table td {
	vertical-align:middle;
	background-color:white;
	border:1px solid #000000;
	border-width:0px 1px 1px 0px;
	text-align:left;
	padding:7px;
	font-size:10px;
	font-family:Arial;
	font-weight:normal;
	color:#000000;
	width:100px;
}
.table tr:first-child td{
	background:-o-linear-gradient(bottom, #4c4c4c 5%, #000000 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4c4c4c), color-stop(1, #000000) );
	background:-moz-linear-gradient( center top, #4c4c4c 5%, #000000 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#4c4c4c", endColorstr="#000000");	background: -o-linear-gradient(top,#4c4c4c,000000);
	background-color:#4c4c4c;
	border:0px solid #000000;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:14px;
	font-family:Arial;
	font-weight:bold;
	color:#ffffff;
}
#text1{
 	 text-align: left;
	 display: block;
  	 font-size:13pt;
  	 font-weight:bold;
  	 font-family:Arial;
  	 color:#222;
 }
#text2{
 	 text-align: left;
	 display: block;
  	 font-size:10pt;
  	 font-family:Arial;
  	 color:#222;
 }
.yes{
	margin-top: 50px;
	width: 110px;
	height: 30px;
	margin-left: 690px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;	
}
/* 겹치는부분시작(+eduAndroid와 겹치는것도 넣음) */
</style>
<!-- eduJsp상세보기css 끝 -->
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
	
<!-- jsp 상세보기 시작-->
<br/><div class="grid9 content" >
<p>REGULAR CURRICULUM<br/><h4>정규교육과정보기</h4></p>
			<hr/><br/>
<div id="eduJsp"> 
	<table class="table2">
		<tr><th rowspan="7"><img src="../imgs/jspLogo.png" width="400" height="300"></th>
			<td>교육과정 | jsp 프로그래밍</td></tr>
		<tr><td>교육기간 | 2016.05.01 ~ 2016.05.31</td></tr>
		<tr><td>교육일정 | 총 48시간 월~목 19:15~22:15</td></tr>
		<tr><td>교육장소 | 한빛신촌교육센터</td></tr>
		<tr><td>교육대상 | 재직자환급,일반인,대학생</td></tr>
		<tr><td>교육비용 | 전화/온라인문의</td></tr>
		<tr><td>문의전화 | 02-707-1480</td></tr>
	</table>
	<br/><br/><div id="text1">▶교육개요<hr id="hr2"/></div><br/><br/> 
	<div id="text2">객체 지향적인 Java 프로그래밍 언어를 학습하여 Javar기반의 프로그래밍과 Java 기반의 웹 어플리케이션 프레임 워크 환경으로 개발 할 수 있는 가장 핵심적이고 효과적인 방법을 교육하는 과정으로, 차세대 IDE인 오라클사의 NetBeans을  사용해서 객체 지향 개념과 핵심적인 자바 프로그래밍 기능에 대해서 학습하게 되고, 이런 지식과 기술을 기반으로 JSP, Struts2 Spring과 같은 개발을 가능하도록 구성되어 있다.</div>
	<br/><br/><img src="../imgs/edujsp1.jpg"/>
	<br/><br/><div id="text1">▶교육대상<hr id="hr2"/></div><br/>
		<div id="text2">·웹 개발에 관심 있는 분<br/>·자바 개발 입문자
					<br/>·웹 개발 및 프로그램개발에 종사하는 직장인<br/>·고용보험 납입 중이신 재직자 및 일반인</div>
	
	<br/><br/><div id="text1">▶교육목표<hr id="hr2"/></div>
	<br/><br/><img src="../imgs/edujsp2.jpg"/> 
	
	<br/><br/><div id="text1">▶커리큘럼<hr id="hr2"/></div><br/><br/> 
	<table class="table">
	<tr><td>주제</td><td>내용</td></tr>
	<tr><td>Servlet의 개념 및 아키텍처 처리</td><td><ul><li>웹 어플리케이션 서비스의 이해와 환경설정</li>
											<li>Servlet의 중요성과 MVC에서 컨트롤러 객체 설계 및 활용에 대한 이해</li>
											<li>Servlet의 아키텍처의 이해</li></ul></td></tr>
	<tr><td>Webapplication에서의 Servlet기반의 개발방법</td><td><ul><li>Servlet에서의 FormDate의 Parameter 처리방법</li>
										<li>HttpServletRequest와 HttpServletResponse 이해</li>
										<li>Servlet의 redirect와 forward의 차이</li></ul></td></tr>
	<tr><td>JSP의 구조의 이해와 스크립팅 방식의 개발방법</td><td><ul><li>JSP의 개요 및 특징</li>
												<li>WAS에서 Deploy되는 JSP 아키텍처 파악</li>
												<li>지시어, 스크립트 방식(선언부, 스크립트릿, 표현식)을 활용한 개발</li></ul></td></tr>
	
	</table><br/>
	<div style="position:relative; left:-349px; top:-50px; height:30px;"><a href="eduApply.jsp">
	<input type="button" value="신청하기" class="yes"></a></div>
</div>
</div>
<!-- jsp 상세보기 끝-->
	    <%@ include file="../template/aside.jsp" %>
		<%@ include file="../template/footer.jsp" %>
</body>
</html>
