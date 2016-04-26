<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.sql.Date"%>
<%@page import="bean.BoardData"%>
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
<title>Ask</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
<style type="text/css">
#e {
	background-color: firebrick;
}
</style>
</head>

<%!PreparedStatement statement;
	ResultSet rs;
	String sql;
	Date today = new Date(System.currentTimeMillis());
	ArrayList<BoardData> list = new ArrayList<BoardData>();%>
<%
	try {
		statement = DBConnect.get().prepareStatement(sql);
		rs = statement.executeQuery();
		list.clear();
		while (rs.next()) {
			list.add(new BoardData(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getDate(5), rs.getTimestamp(6), rs.getInt(7)));
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
			<h1>1:1 문의</h1>

			<Table border="1" width="100%">

				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>제목</td>
					<td>날짜</td>
					<td>조회수</td>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
						// today = time, !today = days 
						if (today.toString().equals(list.get(i).getData().toString())) {
				%>
				<tr>
					<td><%=list.get(i).getNum()%></td>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getTitle()%></td>
					<td><%=list.get(i).getTime()%></td>
					<td><%=list.get(i).getCount()%></td>
				</tr>

				<%
					} else {
				%>
				<tr>
					<td><%=list.get(i).getNum()%></td>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getTitle()%></td>
					<td><%=list.get(i).getData()%></td>
					<td><%=list.get(i).getCount()%></td>
				</tr>
				<%
					}
					}
				%>
			</Table>

		</div>

		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>