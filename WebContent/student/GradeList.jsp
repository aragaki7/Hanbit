<%@page import="db.DBConnect"%>
<%@page import="bean.GreadeData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생성적리스트</title>
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

.yes {
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
 #d{
 	background-color: firebrick;
 }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#row').on('click',function(){
			var id=$('#row>td:eq(0)').text();
			var java=$('#row>td:eq(1)').text();
			var web=$('#row>td:eq(2)').text();
			var fw=$('#row>td:eq(3)').text();
			location.href="EditGrade.do?id="+id+"&java="+java+"&web="+web+"&fw="+fw;
		});
	});
</script>
</head>
<body>

	<div class="container_12">
		<%@ include file="../template/header.jsp"%>
		<%@ include file="../template/nav.jsp"%>	<br />

		<!-- content start -->
		<%
			JSONObject jsonObject = new JSONObject();

			jsonObject = (JSONObject) session.getAttribute("jsonObj");

			if (jsonObject != null) {
				if (jsonObject.getString("pm").equals("관리자")) {
		%>
	
		<div class="grid9 content">
			<p>STUDENT GRADE LIST</p>
			<hr />
			<br />
			<form action="../student/AddGrade.jsp">
				<div class="table">
					<table>
						<tr>
							<td>아이디</td>
							<td>자바</td>
							<td>웹</td>
							<td>프레임워크</td>
						</tr>
							<%
							ArrayList<GreadeData> list = (ArrayList<GreadeData>)request.getAttribute("list");
							for (int i = 0; i < list.size(); i++) {
							%>
							<tr id="row" style="cursor: hand;"><!--  onclick="location.href='EditGrade.do'"> -->
<!-- 							onclick="location.href='../student/EditGrade.jsp'"> 클릭 이벤트 jquery로 뺌-->
							

							<td><%=list.get(i).getId()%></td>
							<td><%=list.get(i).getJava()%></td>
							<td><%=list.get(i).getWeb()%></td>
							<td><%=list.get(i).getFw()%></td>

							
							</tr>
							<%}%>
							
						

					</table>
				</div>
				<button type="submit" class="yes">성적입력</button>
			</form>
		</div>
		<%
			}
			} else {
		%>
		<div align="center">

			<%
				out.print("권한이 없습니다.");
			%>
			<button type="submit">돌아가기</button>

			<%
				
			%>
		</div>
		<%
			}
		%>
		<!-- content end -->

		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>