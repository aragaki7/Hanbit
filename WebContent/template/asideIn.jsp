<%@page import="net.sf.json.JSONObject"%>
<%@page import="data.Dday"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">

button {
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
	margin-top:20px;
}
input {
	margin-top: 10px;
	margin-left:10px;
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
</style>
<div class="grid3 aside">
	
	<!-- d-day값 불러오기 -->
	<div id="dday">
	<div id="text1">개강일 안내</div>
		<%
			Dday day = new Dday();
			out.print(day.getMonth() + "월 개강</br>");
			out.print("D-"+day.getDays());
		%>
	</div>
	
	<div id="kakao">
		<img alt="카카오톡 안내"  src="../imgs/tel.gif"/>
	</div>

	<div id="tel">
		<img alt="전화번호 안내" src="../imgs/kakaotalk.gif"/>
	</div>
	
</div>
<div class="clear"></div>