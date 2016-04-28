<%@page import="net.sf.json.JSONObject"%>
<%@page import="data.Dday"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
#loginbtn {
	margin-top: -35px;
	margin-left: 10px;
	height: 78px;
	width: 80px;
	background-color: white;
	color: black;
	border: 1px solid black;
	position: absolute;
}

#id {
	margin-top: 20px;
}

input {
	margin-top: 10px;
	margin-left: 10px;
	width: 50%;
	height: 31px;
	position: relative;
}

#log {
	font-size: 10pt;
	margin-top: 20px;
	margin-left: 240px;
}

#form {
	width: 400px;
	background-color: #F6F6F6;
}

#dday {
/* 	border: 1px solid black; */
/* 	width: 98%; */
/* 	height: 200px; */
/* 	margin-top: 10px; */
/* 	margin-left: 5px; */
/* 	text-align: center; */
/* 	box-shadow: 0px 5px 0px 0px rgba(0, 0, 0, 0.1); */
	height: 150px;
 	margin-top:20px; 
	text-align:center; 
	color: #50AF49;
/* 	font-family: 'Jeju Hallasan', serif; */
/*  	font-weight: bold; */
} 

#dday1{
	font-weight: bold;
	color: #50AF49;
	font-size:15pt;
}
.dday2{
	color: #50AF49;
	font-size: 40pt;
	font-weight: bold;
}

#dday3{
	font-size:20pt;
	font-weight: bold;
}

.dday4{
	font-size:20pt;
	font-weight: bold;
}

#text1 {
	text-align: left;
	margin-left: 10px;
	font-size: 15px;
}

#tel>img {
	width: 100%;
}

#kakao>img {
	width: 100%;
}

#online>a>img {
	width: 100%;
}
.success {
	margin-left: 10px;
}
</style>
<div class="grid3 aside">
	<%
		JSONObject re = (JSONObject) session.getAttribute("jsonObj");
		if (re != null) {
			if (re.getString("result").equals("success")) {
	%>
	<div class="success" id="form">
		<div class="login">
		<div>
			<h2><%=re.getString("name")%>님 환영합니다.
			</h2>
		</div>
		<div>
			<a href="/Hanbit/logout.do"><span>logout</span></a> 
			<a href="/Hanbit/useredit.do"><span>회원정보수정</span></a>
<!-- 			<a href="/Hanbit/login/edituser.jsp"><span>회원정보수정</span></a> -->
		</div>
	</div>


</div>
<%
	} else {
%>
<div>
	<a href="/mvc04/login/login.naver"><span>login</span>페이지</a>
</div>
<div id="form">
	<div class="login">
		<input type="text" id="id" name="id" maxlength="41" title="아이디"
			accesskey="L" placeholder="아이디"> <input type="password"
			id="pw" name="pw" maxlength="16" title="비밀번호" placeholder="비밀번호">
		<button id="loginbtn">로그인</button>
	</div>
	<a href="/Hanbit/login/join.jsp" id="log"><span>회원가입</span></a>
</div>
<%
	}
	} else {
%>
<div id="form">
	<div class="login">
		<input type="text" id="id" name="id" maxlength="41" title="아이디"
			accesskey="L" placeholder="아이디"> <input type="password"
			id="pw" name="pw" maxlength="16" title="비밀번호" placeholder="비밀번호">
		<button id="loginbtn">로그인</button>
	</div>
	<a href="/Hanbit/login/join.jsp" id="log"><span>회원가입</span></a>
</div>
<%
	}
%>

<!-- d-day값 불러오기 -->
<div id="dday">
	<div id="text1"></div><!-- 개강일 안내 태그 -->
	<%
		Dday day = new Dday();
		out.print("<span id=\"dday1\">"+ day.getMonth() + "월 개강 일정</span><p/>");
		out.print("<span class=\"dday2\">"+day.getMonth()+"</span>&nbsp;<span class=\"dday4\">월</span><span class=\"dday2\">&nbsp;1</span>&nbsp;<span class=\"dday4\">일</span><p/>");
		out.print("<span id=\"dday3\"> D - "+ day.getDays()+"</span>");
	%>
</div>

<div id="kakao">
	<img alt="카카오톡 안내" src="imgs/tel.gif" />
</div>

<div id="tel">
	<img alt="전화번호 안내" src="imgs/kakaotalk.gif" />
</div>

<div id="online">
	<a href="/Hanbit/customer/ask.jsp"><img alt="온라인 문의" src="imgs/online.gif" /></a>
</div>

</div>
<div class="clear"></div>