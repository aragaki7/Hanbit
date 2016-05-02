<%@page import="net.sf.json.JSONObject"%>
<%@page import="data.Dday"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">

#form {
	width: 400px;
	background-color: #F6F6F6;
}
#dday1{
	font-weight: bold;
	color: #50AF49;
	font-size:15pt;
	margin-left:64pt;
}
.dday2{
	color: #50AF49;
	font-size: 40pt;
	font-weight: bold;
	margin-left:-10pt;
}

#dday3{
	color: #50AF49;
	font-size:20pt;
	font-weight: bold;
	margin-left:85pt;
}

.dday4{
	color: #50AF49;
	font-size:20pt;
	font-weight: bold;
	margin-left:5pt;
}
#dday23{
	color: #50AF49;
	text-align:center;
	margin-left:14pt;
}
#text1 {
	text-align: left;
	margin-left: 10px;
	font-size: 15px;
}
#tel>img{
	width: 100%;
}
#kakao>img{
	width: 100%;
}
#online>a>img{
	width: 100%;
}
</style>
<div class="grid3 aside">
	
	<!-- d-day값 불러오기 -->
	<div id="dday">
	<div id="text1"></div><!-- 개강일 안내 태그 -->
	<%
		Dday day = new Dday();
		out.print("<span id=\"dday1\">"+ day.getMonth() + "월 개강 일정</span><p/>");
		out.print("<div id=\"dday23\"><span class=\"dday2\">"+day.getMonth()+"</span>&nbsp;<span class=\"dday4\">월</span><span class=\"dday2\">&nbsp;1</span>&nbsp;<span class=\"dday4\">일</span></div><p/>");
		out.print("<span id=\"dday3\"> D - "+ day.getDays()+"</span>");
	%>
</div>
	
	<div id="kakao">
		<img alt="카카오톡 안내"  src="/Hanbit/imgs/tel.gif"/>
	</div>

	<div id="tel">
		<img alt="전화번호 안내" src="/Hanbit/imgs/kakaotalk.gif"/>
	</div>
	
	<div id="online">
		<a href="/Hanbit/customer/ask.jsp"><img alt="온라인 문의" src="/Hanbit/imgs/online.gif" /></a>
	</div>
	
</div>
<div class="clear"></div>