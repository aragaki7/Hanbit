<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">

.out {
	font-size: 12px;
	color: red;
}

.login {
	font-size: 12px;
}

.header {
	height: 100px;
}

.log {
	margin-right: 0px;
}
.img{
	margin-left: 480px;
}
#hh{
	font-size:12pt;
	margin-left:140px;
	margin-top:65px;
}
#hh a{
	text-decoration: none;
	color:gray;
}
</style>

<div class="grid9 header">
	<a href="<%=request.getContextPath()%>/main.do" class="img"><img
		src="<%=request.getContextPath()%>/imgs/logo.jpg" alt="logo" /></a>
</div>
	<div class="grid3 header"><div id="hh">
	<%
		JSONObject loginre = (JSONObject) session.getAttribute("jsonObj");
		if (loginre != null) {
			if (loginre.getString("result").equals("success")) {
	%>
    <a href="/Hanbit/useredit.do" >개인정보</a>
	<a href="/Hanbit/logout.do" >/ 로그아웃</a></div>
	<%}else{%>
	<a href="#" >로그인</a>
	<a href="/Hanbit/login/join.jsp" >/ 회원가입</a></div>
	<%}}else{%>
		<a href="#" >로그인</a>
	<a href="/Hanbit/login/join.jsp" >/ 회원가입</a></div>	
	<%}%>
	</div>

