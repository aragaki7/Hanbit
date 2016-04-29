<%@page import="net.sf.json.JSONObject"%>
<%@page import="data.Dday"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">

#form {
	width: 400px;
	background-color: #F6F6F6;
}
#dday {
	border: 1px solid black;
	width: 98%;
	height: 200px;
	margin-top:10px;
	margin-left:5px;
	text-align: center;
	box-shadow: 0px 5px 0px 0px rgba(0,0,0,0.1);
}
#text1{
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
	<div id="text1">개강일 안내</div>
		<%
			Dday day = new Dday();
			out.print(day.getMonth() + "월 개강</br>");
			out.print("D-" + day.getDays());
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