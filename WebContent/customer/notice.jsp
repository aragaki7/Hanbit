<%@page import="java.sql.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="db.DBConnect"%>
<%@page import="bean.BoardData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice</title>

<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />

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

hr {
	width: 800px;
	border-top: 3px solid #9C9C9C;
	border-bottom: 3px solid #F6F6F6;
	box-shadow: 5px 5px 5px lightgray;
}

.table {
	margin: 0px;
	padding: 0px;
	width: 800px;
	box-shadow: 10px 10px 5px #888888;
	border: 1px solid #000000;
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
	font-size: 10px;
	font-family: Arial;
	font-weight: normal;
	color: #000000;
	width: 100px;
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
	color: #ffffff;
}

#row>td {
	text-align: center;
	font-size: 10pt;
}

.content {
	height: 300px;
}

.page {
	text-align: center;
	margin-top: 13px;
	margin-left: -95px;
}

.page a {
	text-decoration: none;
	color: black;
}

.yes {
	margin-top: 40px;
	width: 105px;
	height: 30px;
	margin-left: 690px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
}

input[type=text] {
	border-color: black;
	height: 20px;
}

input[type=submit] {
	margin-bottom: 10pt;
	width: 55px;
	height: 23px;
	font-size: 8pt;
	font-weight: bold;
	color: white;
	background-color: black;
	border: none;
}

#keyword {
	width: 55pt;
	height: 17pt;
	font-size: 11pt;
	border-color: black;
}

#write {
	position: relative;
	height: 30px;
	margin-top: -50px;
}

#gumsackjang {
	text-align: center;
	margin-left: -95px;
	margin-top: 30px;
}

#e {
	background-color: firebrick;
}
</style>
</head>

<%!PreparedStatement statement;
	String sql;
	ResultSet rs;
	ArrayList<BoardData> list = new ArrayList<BoardData>();%>

<%
	sql = "select idx, TB_USER.id, title, content, days, times, count from TB_NOTICE join TB_USER on TB_NOTICE.id_fk = TB_USER.id order by idx desc";
	try {
		statement = DBConnect.get().prepareStatement(sql);
		rs = statement.executeQuery();
		list.clear();
		while (rs.next()) {
			list.add(new BoardData(rs.getInt("idx"), rs.getString("TB_USER.id"), rs.getString("title"),
					rs.getString("content"), rs.getDate("days"), rs.getTimestamp("times"), rs.getInt("count")));
		}
	} catch (Exception e) {

	} finally {
		if (rs != null)
			rs.close();
		if (statement != null)
			statement.close();
	}
%>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp"%>
		<%@ include file="../template/nav.jsp"%>

		<!-- content start -->

		<div class="grid9">
			<!--  게시판 내용 시작-->
			<p>CUSTOMER CENTER
			<h4>공지사항</h4>
			</p>
			<hr />
			<br />
			<div class="table">
				<table>
					<tr>
						<td>index</td>
						<td>작성자</td>
						<td>제목</td>
						<td>내용</td>
						<td>날짜</td>
						<td>조회 수</td>
					</tr>

					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr id="row" style="cursor: hand;" onclick="location.href='#'">
						<td><%=list.get(i).getNum()%></td>
						<td><%=list.get(i).getId()%></td>
						<!--아이디-->
						<td><%=list.get(i).getTitle()%></td>
						<td><a href="askDetail.jsp"><%=list.get(i).getContent()%></a></td>
						<%
							if (list.get(i).getData().toString().equals(new Date(System.currentTimeMillis()).toString())) {

									String[] time = list.get(i).getTime().toString().split(" ");
						%>

						<td><%=time[1]%></td>

						<%
							} else {
						%>
						<td><%=list.get(i).getData()%></td>
						<%
							}
						%>
						<td><%=list.get(i).getCount()%></td>

					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div class="page">
				<a href="#">◀</a> <a href="#">[1]</a> <a href="#">[2]</a> <a
					href="#">[3]</a> <a href="#">[4]</a> <a href="#">[5]</a> <a
					href="#">▶</a>
			</div>
			<div id="gumsackjang">
				<div id="write">
					<%
						JSONObject jsonObject = new JSONObject();

						jsonObject = (JSONObject) session.getAttribute("jsonObj");

						if (jsonObject != null) {
							if (jsonObject.getString("pm").equals("관리자")) {
					%>

					<a href="../ckeditor/board.jsp"> <input type="button"
						value="글쓰기" class="yes"></a>
					<%
						}
						}
					%>
				</div>
				<form action="#">
					<select id="keyword">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="name">글쓴이</option>
					</select> <input type="text" name="search"> <input type="submit"
						value="검색">
				</form>
			</div>

			<!--  게시판 내용 끝 -->
		</div>

		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>