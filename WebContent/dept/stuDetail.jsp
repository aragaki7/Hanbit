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
				<p id="p1">학생정보 상세페이지</p>
				<hr />
				<br />
				<table class="join_tbl">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					  <%ArrayList<UserData> stuDetailList = (ArrayList<UserData>)request.getAttribute("stuDetailList");%>
					 <% for(int i=0; i<stuDetailList.size(); i++){%>
					<tr>
						<th>아이디</th>
						<td colspan="3"><span id="id" name="id"><%=stuDetailList.get(i).getId()%></span></td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="3"><span id="name" name="name"><%=stuDetailList.get(i).getName()%></span></td>
					</tr>
					<tr>
						<th>성별</th>
						<td colspan="3"><span id="sex" name="sex"><%=stuDetailList.get(i).getSex()%></span></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="3"><span id="tel1" name="phone"><%=stuDetailList.get(i).getMobile()%></td>
					</tr>
					<th>휴대폰</th>
					<td colspan="3"><span id="tel4" name="mobile" size="3"><%=stuDetailList.get(i).getPhone()%></span></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3"><span name="email" size="3"><%=stuDetailList.get(i).getEmail()%></span></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><span name="post" size="3"><%=stuDetailList.get(i).getMain_address() + " " + stuDetailList.get(i).getSub_address() + "(" + stuDetailList.get(i).getPost() + ")"%></span>
							</div></td>
					</tr>
					<tr>
						<th>강의실</th>
						<td colspan="3"><span name="classroom" size="3"><%=stuDetailList.get(i).getClasss()%></span></td>
					</tr>
					<%} %>
				</table>
			</form>
		</div>
		<!-- content end -->

		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>