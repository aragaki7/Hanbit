<%@page import="db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.UserData"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin page</title>
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
	#css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2),
	#css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3),
	#css_tabs input:nth-of-type(4), #css_tabs input:nth-of-type(4) ~ div:nth-of-type(4),
	#css_tabs input:nth-of-type(5), #css_tabs input:nth-of-type(5) ~ div:nth-of-type(5)
	{
	display: none;
}

#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked 
	 ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3),
	#css_tabs input:nth-of-type(4):checked ~ div:nth-of-type(4), #css_tabs input:nth-of-type(5):checked 
	 ~ div:nth-of-type(5) {
	display: block;
}
/* 라벨 기본 스타일 지정 */
#css_tabs>label {
	display: inline-block;
	font-size: 16px;
	padding: 5px;
	text-align: center;
	width: 130px;
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
	margin-top: 20pt;
}

#css_tabs label[for=tab2] {
	margin-top: 20pt;
}

#css_tabs label[for=tab3] {
	margin-top: 20pt;
}

#css_tabs label[for=tab4] {
	margin-top: 20pt;
}

#css_tabs label[for=tab5] {
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

#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs>label[for=tab3]:hover
	{
	background: firebrick;
	color: white;
}

#css_tabs input:nth-of-type(4):checked ~ label:nth-of-type(4), #css_tabs>label[for=tab4]:hover
	{
	background: firebrick;
	color: white;
}

#css_tabs input:nth-of-type(5):checked ~ label:nth-of-type(5), #css_tabs>label[for=tab5]:hover
	{
	background: firebrick;
	color: white;
}
/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab1_content, #css_tabs .tab2_content, #css_tabs .tab3_content,
	#css_tabs .tab4_content, #css_tabs .tab5_content {
	padding: 2em;
	height: 100%;
}
</style>

<%!String sql;
	PreparedStatement statemnet;
	ResultSet rs;
	ArrayList<UserData> list = new ArrayList<UserData>();

	public void getUser(int pm) {

		try {
			sql = "select id, name, post, main_address, sub_address, sex, phone, mobile, email, class_room from TB_USER join TB_CLASS on TB_USER.class_fk = TB_CLASS.class_pk where pm_fk = "
					+ pm;
			statemnet = DBConnect.get().prepareStatement(sql);
			rs = statemnet.executeQuery();
			list.clear();
			while (rs.next()) {
				list.add(new UserData(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10)));
			}
		} catch (Exception e) {

		} finally {
			if (rs != null) {
				//rs.close();
			}

			if (statemnet != null) {
				//statemnet.close();
			}
		}

	}%>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp"%>
		<%@ include file="../template/nav.jsp"%>

		<!-- content start -->
		<%
			JSONObject jsonObject = new JSONObject();

			jsonObject = (JSONObject) session.getAttribute("jsonObj");

			if (jsonObject != null) {
				if (jsonObject.getString("pm").equals("관리자")) {
		%>
		<div class="grid9 content">
			<p>
				USER LIST<br />
			<h4>LIST</h4>
			</p>
			<hr />
			<br />
			<div id="css_tabs">
				<input id="tab1" type="radio" name="tab" checked="checked" /> <input
					id="tab2" type="radio" name="tab" /> <input id="tab3" type="radio"
					name="tab" /> <input id="tab4" type="radio" name="tab" /> <input
					id="tab5" type="radio" name="tab" /> <label for="tab1">일반</label>
				<label for="tab2">학생</label> <label for="tab3">교육부</label> <label
					for="tab4">영업부</label> <label for="tab5">행정부</label>

				<div class="tab1_content">
					<!-- 일반 회원 -->
					<%
						getUser(1);
					%>
					<div class="table">
						<table>
							<tr>
								<td>이름</td>
								<td>휴대폰번호</td>
								<td>이메일</td>
								<td>강의실</td>
							</tr>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr id="row" style="cursor: hand;" onclick="#'">
								<input type="hidden" id="id" value="" />
								<td><%=list.get(i).getName()%></td>
								<td><%=list.get(i).getMobile()%></td>
								<td><%=list.get(i).getEmail()%></td>
								<td><%=list.get(i).getClasss()%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>

				<div class="tab2_content">
					<!-- 학생 회원 -->
					<%
						getUser(2);
					%>
					<div class="table">
						<table>
							<tr>
								<td>이름</td>
								<td>휴대폰번호</td>
								<td>이메일</td>
								<td>강의실</td>
							</tr>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr id="row" style="cursor: hand;" onclick="#'">
								<input type="hidden" id="id" value="" />
								<td><%=list.get(i).getName()%></td>
								<td><%=list.get(i).getMobile()%></td>
								<td><%=list.get(i).getEmail()%></td>
								<td><%=list.get(i).getClasss()%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>

				<div class="tab3_content">
					<!-- 교육부 -->
					<%
						getUser(5);
					%>
					<div class="table">
						<table>
							<tr>
								<td>이름</td>
								<td>휴대폰번호</td>
								<td>이메일</td>
								<td>강의실</td>
							</tr>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr id="row" style="cursor: hand;" onclick="#'">
								<input type="hidden" id="id" value="" />
								<td><%=list.get(i).getName()%></td>
								<td><%=list.get(i).getMobile()%></td>
								<td><%=list.get(i).getEmail()%></td>
								<td><%=list.get(i).getClasss()%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>

				<div class="tab4_content">
					<!-- 영업부 -->
					<%
						getUser(3);
					%>
					<div class="table">
						<table>
							<tr>
								<td>이름</td>
								<td>휴대폰번호</td>
								<td>이메일</td>
								<td>강의실</td>
							</tr>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr id="row" style="cursor: hand;" onclick="#'">
								<input type="hidden" id="id" value="" />
								<td><%=list.get(i).getName()%></td>
								<td><%=list.get(i).getMobile()%></td>
								<td><%=list.get(i).getEmail()%></td>
								<td><%=list.get(i).getClasss()%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>

				<div class="tab5_content">
					<!-- 행정부 -->
					<%
						getUser(4);
					%>
					<div class="table">
						<table>
							<tr>
								<td>이름</td>
								<td>휴대폰번호</td>
								<td>이메일</td>
								<td>강의실</td>
							</tr>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr id="row" style="cursor: hand;" onclick="#'">
								<input type="hidden" id="id" value="" />
								<td><%=list.get(i).getName()%></td>
								<td><%=list.get(i).getMobile()%></td>
								<td><%=list.get(i).getEmail()%></td>
								<td><%=list.get(i).getClasss()%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>

		</div>
		<%
			}
			} else {
		%>
		<div align="center">

			<script language="javascript">
				$(document).ready(function auth(){
				alert("권한이 없습니다.");
				document.location.href = "../main.jsp";
			});
			</script>




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