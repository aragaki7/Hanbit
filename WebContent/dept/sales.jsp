<%@page import="net.sf.json.JSONObject"%>
<%@page import="bean.UserData"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>apply list</title>
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
	padding: 0px;
	margin-top: 20px;
	margin-left: 0px;
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
</style>
<script type="text/javascript">
<%
JSONObject jsonObject2 = new JSONObject();

jsonObject2 = (JSONObject) session.getAttribute("jsonObj");

if (jsonObject2 != null) {%>
	var pm = <%=jsonObject2.getString("pm")%>
	if (!("관리자".equals(pm) || "영업부".equals(pm))) {
		alert('권한이 부족합니다.');
		history.go(-1);
	}else{
		//권한이 맞음
		System.out.println("권한 맞음");
	}
<%}else{%>
	alert('권한이 부족합니다.');
	history.go(-1);
<%}%>
	$(document).ready(function(){
		
		
	});
</script>
<body>
<%
	ArrayList<UserData> appl= (ArrayList<UserData>)request.getAttribute("userList");
%>
	<div class="container_12">
		<%@ include file="../template/header.jsp"%>
		<%@ include file="../template/nav.jsp"%>

		<!-- content start -->
		
		<div class="grid9 content"> 
			<p>APPLY LIST<br/><h4>LIST</h4></p>
			<hr/><br/>
			<div>
				<div class="table">
					<table>
						<tr>
							<td>이름</td>		
							<td>이메일</td>
							<td>연락처</td>
							<td>강의실</td>
						</tr>
						 <%for(int i=0;i<appl.size();i++) {%>
		                 <tr id="row" style="cursor: hand;" onclick="location.href='../dept/applyDetail.jsp'">
                 			<td><%=appl.get(i).getName() %></td>
	               			<td><%=appl.get(i).getEmail() %></td>
                  			<td><%=appl.get(i).getPhone() %></td>
							<td><%=appl.get(i).getClasss() %></td>
						</tr>
						<%} %>
					</table>
				</div>
			</div>
		</div>

		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>