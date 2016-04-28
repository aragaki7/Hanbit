<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Android상세보기</title>

<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<!-- eduAndroid상세보기css 시작 -->
<style type="text/css">
/* 겹치는부분시작 */
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
.table {
	margin:0px;
	padding:0px;
	width:800px;
	box-shadow: 10px 10px 5px #888888;
	border:1px solid #000000;
	font-size: 11pt;
	}
hr { 
 	width: 800px;
 	border-top:3px solid #9C9C9C; 
 	border-bottom:3px solid #F6F6F6; 
	box-shadow: 5px 5px 5px lightgray;
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
/* 겹치는부분시작 */
/* 겹치지않는부분시작 */	
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
/* 겹치지않는부분시작 */	

</style>
<!-- eduAndroid상세보기css 끝 -->
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
	
<!-- eduAndroid 상세보기 시작-->
<br/><div class="grid9 content" >
<p>REGULAR CURRICULUM<br/><h4>정규교육과정보기</h4></p>
			<hr/><br/>
<div id="eduAndroid"> 
	<table class="table2">
		<tr><th rowspan="7"><img src="../imgs/AndroidLogo.png" width="400" height="300"></th>
			<td>교육과정 | 안드로이드 프로그래밍</td></tr>
		<tr><td>교육기간 | 2016.05.01 ~ 2016.05.31</td></tr>
		<tr><td>교육일정 | 총 48시간 월~목 19:15~22:15</td></tr>
		<tr><td>교육장소 | 한빛신촌교육센터</td></tr>
		<tr><td>교육대상 | 재직자환급,일반인,대학생</td></tr>
		<tr><td>교육비용 | 전화/온라인문의</td></tr>
		<tr><td>문의전화 | 02-707-1480</td></tr>
	</table>
	<br/><br/><div id="text1">▶교육개요</div><hr id="hr2"/><br/> 
	
<div id="text2">안드로이드 개발 경험이 전혀 헙는 교육생 들도 빠르게 어플리케이션 개발을 할수 있도록 하고 실무에서 혹은 일상생활에서 바로 사용<br/>할수 있는 자신만의 어플리케이션을 개발 할 수 있고 또한 인드로이드 마켓에 하나 이상 앱을 등록하는 것이 목표이다. 고급기법인<br/> 소셜커머스 구현. 증강현을을 활용한 실전 App개발등 수강생들에게 퀄리티 높은 앱 제작을 지원하고 있다.</div>
	<br/><br/><img src="../imgs/eduAndroid1.jpg"/>
	<br/><br/><img src="../imgs/eduAndroid2.gif"/> 

	<br/><br/><div id="text1">▶커리큘럼</div><hr id="hr2"/><br/>
	<table class="table">
	<tr><td>주제</td><td>내용</td></tr>
	<tr><td>안드로이드 개발</td><td><ul><li>안드로이드 SDK 설치및 개발환경 설정</li>
											<li>개발도구 사용법 및 프레임워크 구축</li>
											<li>Layout과 Button을 활용한 전자 계산기 App개발하기</li></ul></td></tr>
	<tr><td>Animation</td><td><ul><li>Animation 기법을 활용한 시각효과 주기</li>
										<li>Animation과 스트레스를 사용해서 이미지, 텍스트에 효과를 주기</li>
										<li>실전 예제 테스트하기</li></ul></td></tr>
	<tr><td> View Class</td><td><ul><li> View Class를 상속받아 자신만의 View를 만들기</li>
												<li> View를 이용한 화면구성 및 Canvas의 개념 익히기</li>
												<li>화면에 Bitmap 이미지 출력해서 움직이기</li></ul></td></tr>
	</table><br/>
	<div style="position:relative; left:-349px; top:-50px; height:30px;"><a href="eduApply.jsp">
	<input type="button" value="신청하기" class="yes"></a></div>
</div>
</div>
<!-- eduAndroid 상세보기 끝-->
        <%@ include file="../template/aside.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>
