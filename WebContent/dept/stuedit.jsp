<%@page import="db.DBConnect"%>
<%@page import="bean.UserData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 정보 상세페이지</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<script type="text/javascript" src="../js/joinVaild.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

#p1 {
	text-align: left;
	display: block;
	width: 400px;
	font-size: 20pt;
	font-weight: bold;
	color: black;
}

hr {
	width: 800px;
	border-top: 3px solid #9C9C9C;
	border-bottom: 3px solid #F6F6F6;
	box-shadow: 5px 5px 5px lightgray;
}

.content {
	height: 400px;
}

.back {
	width: 60px;
	height: 20px;
	margin-left: 0px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
}

img {
	border: none
}

.join_tbl {
	width: 800px;
	border-collapse: collapse;
	border-spacing: 0;
	border-top: 2px solid #ddd;
	border-bottom: 2px solid #ddd;
	font-size: 11px;
	font-family: dotum;
	margin-bottom: 30px;
}

.join_tbl th {
	text-align: center;
	padding: 7px 4px;
	height: 30px;
	color: black;
	background-color: #e6e6e6;
	font-size: 10pt;
}

.join_tbl td {
	padding: 5px 15px;
	border-bottom: 1px solid #ddd
}

.join_tbl td span {
	color: black;
	font-size: 11pt;
}

.join_tbl textarea {
	width: 95%;
	height: 80px;
	border: 1px solid #ccc;
	padding: 10px
}

.btn {
	text-align: center;
}

span {
	font-size: 9pt;
}

#ck {
	width: 20px;
}

p {
	font-size: 9pt;
}

label {
	color: black;
	margin-left: 1px;
	width: 10px;
	font-size: 12pt;
}

.hid{
	display: none;
}

#changeBtn{
	width: 40px;
	height: 20px;
	background-color: firebrick;
	color: white;	
}
</style>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp"%>
		<%@ include file="../template/nav.jsp"%>

		<!-- content start -->

		<br />
		<div class="grid9 content">
			<form action="#">
				<p id="p1">출결 정보 수정 페이지</p>
				<hr />
				<br />
				<table class="join_tbl">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
				<%String id = request.getParameter("id");
				  String name = request.getParameter("name");
				  String mobile = request.getParameter("mobile");
				  String attDate = request.getParameter("attDate");
				  String classroom = request.getParameter("classroom");
				%>	
					<tr class="hid">
						<th>아이디</th>
						<td colspan="3"><span id="name" name="name"><%=id%></span></td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="3"><span id="name" name="name"><%=name%></span></td>
					</tr>
					<th>휴대폰</th>
					<td colspan="3"><span id="tel4" name="mobile" size="3"><%=mobile%></span></td>
					</tr>
					<tr>
						<th>강의실</th>
						<td colspan="3"><span name="classroom">현재 강의실 : <%=classroom%></span>
						<span>
							<select>
								<option value="0">없음</option>
								<option value="1">1강의실</option>
								<option value="2">2강의실</option>
								<option value="3">3강의실</option>
						
							</select><button type="submit" id="changeBtn"> 변경</button>
						</td>
						</span>
						
					</tr>
				
				</table>
			</form>
		</div>
		<!-- content end -->

		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>