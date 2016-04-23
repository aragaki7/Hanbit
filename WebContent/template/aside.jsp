<%@page import="net.sf.json.JSONObject"%>
<%@page import="data.Dday"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
button {
	margin-top: -35px;
	height: 80px;
	width: 93px;
	background-color: white;
	color: black;
	border: 1px solid black;
	position: absolute;
}

input {
	margin-top: 10px;
	width: 50%;
	height: 31px;
	position: relative;
}

#log {
	font-size: 10pt;
}

#form {
	width: 400px;
	background-color: #F6F6F6;
}

#dday {
	border: 1px solid black;
	width: 100%;
	font-size: 20px;
	font-family: "a피오피동글";
	text-align: center;
}
</style>
<div class="grid3 aside">
	<%
	JSONObject re = (JSONObject) session.getAttribute("jsonObj");
		if (re != null) {
			if (re.getString("result").equals("success")) {
	%>
	<div id="form">
		<div class="login">
			<div><h2><%=re.getString("name")%>님 환영합니다.</h2></div>
		<div>
			<a href="/Hanbit/logout.do"><span>logout</span></a>
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
			<button>로그인</button>
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
			<button>로그인</button>
		</div>
		<a href="/Hanbit/login/join.jsp" id="log"><span>회원가입</span></a>
	</div>
	<%
		}
	%>

	<!-- d-day값 불러오기 -->
	<div id="dday">
		<%
			Dday day = new Dday();
			out.print(day.getMonth() + "월 1일 개강</br>");
			out.print("D-DAY " + day.getDays());
		%>
	</div>
</div>
<div class="clear"></div>