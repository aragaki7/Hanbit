<%@page import="bean.UserData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
</head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
p {
	text-align: left;
	display: block;
	width: 400px;
	font-size: 25pt;
	font-weight: bold;
	color: black;
}

.content {
	height: 500px;
}

hr {
	width: 800px;
	border-top: 3px solid #9C9C9C;
	border-bottom: 3px solid #F6F6F6;
	box-shadow: 5px 5px 5px lightgray;
}

.table {
	margin: -30px;
	padding: 0px;
	width: 800px;
	border: 1px solid #000000;
	box-shadow: 10px 10px 5px #888888;
}

.table table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
}

.table tr:hover td {
	background-color: #d2d2d2;
	color: black;
}

.table td {
	vertical-align: middle;
	background-color: white;
	border: 1px solid #000000;
	border-width: 0px 1px 1px 0px;
	text-align: left;
	padding: 7px;
	font-size: 13px;
	font-family: Arial;
	font-weight: normal;
	color: #000000;
	width: 100px;
	text-align: center;
}

.table tr:first-child td {
	background: -o-linear-gradient(bottom, #4c4c4c 5%, #000000 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #4c4c4c
		), color-stop(1, #000000));
	background: -moz-linear-gradient(center top, #4c4c4c 5%, #000000 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#4c4c4c",
		endColorstr="#000000");
	background: -o-linear-gradient(top, #4c4c4c, 000000);
	background-color: #4c4c4c;
	border: 0px solid #000000;
	text-align: center;
	border-width: 0px 0px 1px 1px;
	font-size: 14px;
	font-family: Arial;
	font-weight: bold;
	color: white;
}

.yes {
	margin-top: 40px;
	width: 110px;
	height: 50px;
	margin-left: 690px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
}

#d {
	background-color: firebrick;
}
/*///////////////////////////////////////////////////////////////////////////////////////////*/
/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1),
	#css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2)
	{
	display: none;
}

#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked 
	 ~ div:nth-of-type(2) {
	display: block;
}
/* 라벨 기본 스타일 지정 */
#css_tabs>label {
	display: inline-block;
	font-size: 16px;
	padding: 5px;
	text-align: center;
	width: 150px;
	line-height: 20pt;
	font-weight: bold;
	border-radius: 3px 3px 0 0;
	background: black;
	color: white;
}

#css_tabs>label:hover {
	cursor: pointer;
}

#css_tabs label[for=tab1] {
	margin-left: 30pt;
	margin-top: 20pt;
}
/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs>label[for=tab1]:hover
	{
	background: firebrick;
	color: white;
}

#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs>label[for=tab2]:hover
	{
	background: firebrick;
	color: white;
}

/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab1_content, #css_tabs .tab2_content {
	padding: 2em;
	height: 100%;
}
</style>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp"%>
		<%@ include file="../template/nav.jsp"%>

		<!-- content start -->
		<div class="grid9 content">
			<p>
				
				ATTENDANCE LIST<br />
			<h4>학생&강사</h4>
			</p>
			<hr />
			<br />
			<div id="css_tabs">
				<input id="tab1" type="radio" name="tab" checked="checked" /> <input
					id="tab2" type="radio" name="tab" /> <label for="tab1">학생</label>
				<label for="tab2">강사</label>
				<div class="tab1_content">
					<div class="table">
						<table>
							<tr>
								<td>index</td>
								<td>아이디</td>
								<td>출결분류</td>
								<td>출결오류발생날짜</td>
							</tr>

							
						</table>
					</div>
				</div>
				<div class="tab2_content">
					<div class="table">
						<table>
							<tr>
								<td>index</td>
								<td>아이디</td>		
								<td>출결분류</td>
								<td>출결오류발생날짜</td>
							</tr>
							
							
						</table>
					</div>
				</div>
			</div>
		</div>
		<div align="center">

		
			<button type="submit">돌아가기</button>

		</div>
		
		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>