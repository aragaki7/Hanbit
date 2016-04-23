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
<style type="text/css">
<<<<<<< HEAD
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
	border:1px solid #000000;
	box-shadow: 10px 10px 5px #888888;
	}
	.table table{
    border-collapse: collapse;
    border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;
	padding:0px;
	}
	.table tr:hover td{
	background-color : #d2d2d2;
	color:black;
	}
	.table td{
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
=======
* {
	margin: 0px;
	padding: 0px;
}
>>>>>>> branch 'master' of https://github.com/aragaki7/Hanbit.git

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
</style>
<%!PreparedStatement statement;
	ResultSet rs;
	String sql;
	ArrayList<UserData> list = new ArrayList<UserData>();%>
<body>

	<%
		list.clear();
		try {
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email from TB_USER";
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

		<div class="grid9 content">
			<p>STUDENT LIST</p>
			<hr />
			<br />
			<form action="../user/AddStudent.jsp">
				<div class="table">
					<table>
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
				<button type="submit" class="yes">성적입력</button>
			</form>
		</div>

		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>