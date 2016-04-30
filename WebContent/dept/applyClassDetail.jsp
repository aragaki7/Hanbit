<%@page import="bean.UserData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 학생 상세페이지</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<script type="text/javascript" src="../js/joinVaild.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<style type="text/css">
 	*{
 		margin: 0px;
 		padding: 0px;
 	}
 	#p1{
 	 	text-align: left;
	 	display: block;
  	 	width: 400px;
  	 	font-size:20pt;
  	 	font-weight:bold;
  	 	color:black;
 	}
 	hr { 
 		width: 800px;
 		border-top:3px solid #9C9C9C; 
 		border-bottom:3px solid #F6F6F6; 
 	 	box-shadow: 5px 5px 5px lightgray;
 	}
	.content{
		height: 400px;
	}
	.join_tbl {
		width:800px;
	 	border-collapse:collapse;
	  	border-spacing:0;
	   	border-top:2px solid #ddd; 
	  	border-bottom:2px solid #ddd; 
	  	font-size:11px; 
	  	font-family:dotum; 
	  	margin-bottom:30px;
	}
	.join_tbl th { 
		text-align:center; 
		padding:7px 4px; 
		height: 30px;
		color:black;
		background-color:#e6e6e6;
		font-size: 10pt;
	}
	.join_tbl td {
		padding:5px 15px; 
		border-bottom:1px solid #ddd
	}
	.join_tbl td span {
		color:black;
		font-size: 11pt;
	}
	.btn {
		text-align:center;
	}
	span{
		font-size: 9pt;
	}
	p{
		font-size: 9pt;
	}
	label{
		color: black;
		margin-left: 1px;
		width:10px;
		font-size: 12pt;
	}
	.yes{
		margin-top: 20px;
		width: 110px;
		height: 30px;
		margin-left: 270px;
		font-size: 11pt;
		font-weight: bold;
		color: white;
		background-color: firebrick;
		border: none;	
	}
	.delete{
		width: 110px;
		height: 30px;
		margin-left: 40px;
		font-size: 11pt;
		font-weight: bold;
		color: white;
		background-color: black;
		border: none;	
	}
</style>
<script type="text/javascript">
<%
JSONObject jsonObject2 = new JSONObject();
jsonObject2 = (JSONObject) session.getAttribute("jsonObj");

if (jsonObject2 != null) {%>
	var pm = "<%=jsonObject2.getString("pm")%>";
	if (!("관리자" == pm || "영업부"==pm)) {
		alert('권한이 부족합니다.');
		location.href="/Hanbit/main.do";
	}else{
		//권한이 맞음
	}
<%}else{%>
	alert('권한이 부족합니다.');
	location.href="/Hanbit/main.do";
<%}%>

	$(document).ready(function(){
// 		$('.yes').on('click',function(){
// 			var id = $('#id').text();
// 			location.href="salesy.do?id="+id;
// 		});
// 		$('.delete').on('click',function(){
// 			var id = $('#id').text();
// 			location.href="salesn.do?id="+id;
// 		});
	});
</script>
</head>
<body>
<!-- 행정부에서 반배정 할때 쓰는 페이지 -->
<!-- 행정부에서 반배정 할때 쓰는 페이지 -->
<!-- 행정부에서 반배정 할때 쓰는 페이지 -->
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		
		<!-- content start -->
		<%
			UserData dto = (UserData)request.getAttribute("userDto");
		%>
		<br/><div class="grid9 content">
		<form action="#">
			<p id="p1">신청학생 상세페이지</p>
			<hr/><br/>
				<table class="join_tbl">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tr>
						<th>아이디</th><td colspan="3"><span id="id" name="id" ><%=dto.getId() %></span></td>
					</tr>
					<tr>
						<th>이름</th><td colspan="3"><span id="name" name="name" ><%=dto.getName() %></span></td>
					</tr>
					<tr>
						<th>성별</th><td colspan="3"><span id="sex" name="sex" ><%=dto.getSex() %></span></td>
					</tr>
					<%
						String phoneNum = dto.getPhone();
						String p1 = phoneNum.split("-")[0];
						String p2 = phoneNum.split("-")[1];
						String p3 = phoneNum.split("-")[2];
					%>
					<tr>
						<th>전화번호</th><td colspan="3">
						<span id="tel1" name="phone" size="3" ><%=p1 %></span> -
						<span id="tel2" name="phone" size="3" ><%=p2 %></span> -
						<span id="tel3" name="phone" size="3" ><%=p3 %></span></td>
					</tr>
					<%
					String mobileNum = dto.getMobile();
					String m1 = mobileNum.split("-")[0];
					String m2 = mobileNum.split("-")[1];
					String m3 = mobileNum.split("-")[2];
					%>
					<tr>
						<th>휴대폰</th><td colspan="3">
						<span id="tel4" name="mobile" size="3" ><%=m1 %></span> -
						<span id="tel5" name="mobile" size="3" ><%=m2 %></span> -
						<span id="tel6" name="mobile" size="3" ><%=m3 %></span></td>
					</tr>
					<%
					String emailaddr = dto.getEmail();
					String email = emailaddr.split("@")[0];
					String domain = emailaddr.split("@")[1];
					%>
					<tr>
						<th>이메일</th><td colspan="3">
						<span name="email" size="3" ><%=email %></span>@
						<span name="email" size="3" ><%=domain %></span></td>
					</tr>
					<tr>
						<th>주소</th><td colspan="3">
						<span name="post" size="3" ><%=dto.getPost() %></span>
						<div>
							<span name="main_address" size="3" ><%=dto.getMain_address() %></span>
							<span name="sub_address" size="3" ><%=dto.getSub_address() %></span>
						</div></td>
					</tr>
			</table>
			<div>
				<div>
					<input type="button" value="승인" class="yes">
					<input type="button" value="삭제" class="delete">
				</div>
			</div>
 		</form>
	</div>
		<!-- content end -->
		
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>