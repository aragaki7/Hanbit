<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java상세보기</title>

<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<!-- eduJava상세보기css 시작 -->
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
.table {
	margin:0px;
	padding:0px;
	width:800px;
	box-shadow: 10px 10px 5px #888888;
	border:1px solid #000000;
	font-size: 11pt;
	}
#hr2 { 
 	width: 100px;
 	border-top:3px solid #9C9C9C; 
 	border-bottom:1px solid lightgray; 
 	box-shadow: 5px 5px 5px lightgray;
 	}
.table2{
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
 #b{
 	background-color: firebrick;
 	}
/* 겹치는부분시작(+eduAndroid와 겹치는것도 넣음) */
</style>
<!-- eduJava상세보기css 끝 -->
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
	
<!-- eduJava 상세보기 시작-->
<br/><div class="grid9 content" >
<p>REGULAR CURRICULUM<br/><h4>정규교육과정보기</h4></p>
			<hr/><br/>
<div id="eduJava"> 
	<table class="table2">
		<tr><th rowspan="7"><img src="../imgs/javaLogo.PNG" width="400" height="300"></th>
			<td>교육과정 | 자바 프로그래밍</td></tr>
		<tr><td>교육기간 | 2016.05.01 ~ 2016.05.31</td></tr>
		<tr><td>교육일정 | 총 48시간 월~목 19:15~22:15</td></tr>
		<tr><td>교육장소 | 한빛신촌교육센터</td></tr>
		<tr><td>교육대상 | 재직자환급,일반인,대학생</td></tr>
		<tr><td>교육비용 | 전화/온라인문의</td></tr>
		<tr><td>문의전화 | 02-707-1480</td></tr>
	</table>
	<br/><br/><div id="text1">▶교육개요<hr id="hr2"/></div><br/>
	<div id="text2">객체 지향적인 JAVA 프로그래밍 언어를 학습하여 Java기반의 프로그래밍과 Java 기반의 웹 어플리케이션 프레임 워크 환경으로 개발<br/>할 수 있는 가장 핵심적이고 효과적인 방법을 교육하는 과정으로, 차세대 IDE인 오라클사의 NetBeans을 사용해서 객체 지향 개념과<br/>핵심적인 자바 프로그래밍 기능에 대해서 학습하게 되고, 이런 지식과 기술을 기반으로 JSP, Struts2 Spring과 같은 개발을 가능하도록<br/> 구성되어 있다.</div>
	<br/><br/><img src="../imgs/edujava1.jpg"/>
	<br/><br/><br/><div id="text1">▶교육대상</div><br/>
	<div id="text2">·웹 개발에 관심 있는 분<br/>·자바 개발 입문자
					<br/>·웹 개발 및 프로그램개발에 종사하는 직장인<br/>·고용보험 납입 중이신 재직자 및 일반인</div>
	
	<br/><br/><div id="text1">▶교육목표<hr id="hr2"/></div><br/>
	<div id="text2">객체지향 언어의 개념 및 활용에 대하여 학습한다.<br/>
	자바의 기본 문법부터 Class의 개념과 프로그래밍 작성까지 체계적으로 학습.</div>
	<br/><br/><img src="../imgs/edujava2.jpg"/> 
	
	<br/><br/> <div id="text1">▶커리큘럼<hr id="hr2"/></div><br/><br/>
	<table  class="table">
	<tr><td>주제</td><td>내용</td></tr>
	<tr><td>자바 개요 및 자바 기초문법</td><td><ul><li>자바의 소개와 현업에서 많이 사용되는 자바 기반의 프로그래밍과 프레임워크를 소개</li>
											<li>JDK설치 및 컴파일과정과 JVM메모리 구조에 대한 이해</li>
											<li>넷빈즈 IDE에 대한 소개와 설치, 환경설정,자바 식별자와 자료형, 연산자, 캐스팅</li></ul></td></tr>
	<tr><td>클래스와 객체의 개념</td><td><ul><li>제어문과 반복문의 문법과 실무적인응용</li>
										<li>클래스의 개념과 설계, 객체 개념 이해와 설계</li>
										<li>오버로딩, Call By Value, Call By Reference</li></ul></td></tr>
	<tr><td>자바 제네릭과 컬렉션 & Swind</td><td><ul><li>제네릭의 개념과 제네릭을 사용하기 전의 자료구조 사용법</li>
												<li>제네릭과 Collection, Collection으로 로또 프로그램 만들기</li>
												<li>GUI의 개념</li></ul></td></tr>
	
	</table><br/>
	<div style="position:relative; left:-349px; top:-50px; height:30px;"><a href="eduApply.jsp">
	<input type="button" value="신청하기" class="yes"></a></div>
</div>
	</div>
<!-- eduJava 상세보기 끝-->
		
		<!-- content end -->	
		<%@ include file="../template/aside.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>
