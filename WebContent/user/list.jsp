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
<title>Cnt</title>
<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
</head>

<%!PreparedStatement statement;
	ResultSet rs;
	String sql;
	ArrayList<UserData> list = new ArrayList<UserData>();%>
<body>

	<%
		list.clear();
		try {
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email from TB_STU";
			statement = DBConnect.get().prepareStatement(sql);
			rs = statement.executeQuery();

			while (rs.next()) {
				list.add(new UserData(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
			}
		} catch (Exception e) {

		} finally {
			if (rs != null)
				rs.close();
			if (statement != null)
				statement.close();
		}
	%>

	<div class="container_12">
		<%@ include file="../template/header.jsp"%>
		<%@ include file="../template/nav.jsp"%>

		<!-- content start -->

		<div class="grid9">
			<h1>학생 관리</h1>
			<table border="1" width="100%">

				<tr>
					<td>이름</td>
					<td>성별</td>
					<td>전화번호</td>
					<td>휴대폰번호</td>
					<td>주소</td>
					<td>이메일</td>
				</tr>

				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getName()%></td>
					<td><%=list.get(i).getSex()%></td>
					<td><%=list.get(i).getPhone()%></td>
					<td><%=list.get(i).getMobile()%></td>
					<td><%=list.get(i).getMain_address() + " " + list.get(i).getSub_address() + "("
						+ list.get(i).getPost() + ")"%></td>
					<td><%=list.get(i).getEmail()%></td>
				</tr>


				<%
					}
				%>
			</table>
		</div>

		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>