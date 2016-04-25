<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 창</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
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
  	 font-size:25pt;
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
	height: 700px;
	}
	.join{
	margin-top: 55px;
	width: 100px;
	height: 40px;
	margin-left: 100px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
	
	}
	.back{
	margin-top: 55px;
	width: 100px;
	height: 40px;
	margin-left: 250px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
	}
	img {
	border:none
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
	padding:10px 20px; 
	color:black;
	background-color:#e6e6e6
	}
	.join_tbl td {
	padding:5px 15px; 
	border-bottom:1px solid #ddd
	}
	.join_tbl td .inputText {
	width:100px; 
	border:1px solid #ccc
	}
	.join_tbl td span {
	color:#888
	}
	.join_tbl textarea {
	width:95%; 
	height:80px;
	 border:1px solid #ccc; 
	 padding:10px
	 }
	.btn {
	text-align:center
	}
</style>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		
		<!-- content start -->
		
		<br/><div class="grid9 content">
			<p id="p1">회원가입</p>
			<hr/><br/>
			<table class="join_tbl">
			<tr>
			<th>아이디</th>
			<td colspan="3">
			<input type="text" id="id" name="id" value="" size="10" class="inputText">
			<a href="#"><img src="images/members/btn_doubleCheck.gif" alt="중복확인" /></a>
			<span>띄어쓰기 없는 영문 숫자조합, 6~12글자</span>
			</td>
			</tr>
			<tr>
			<th>비밀번호</th>
			<td>
			<input type="text" id="userId" name="userId" value="" size="10" class="inputText">
			<span>한글 2~4글자</span>
			</td>
			<th>비밀번호확인</th>
			<td>
			<input type="password" maxlength="7" id="secretNum2" name="secret" size="10" class="inputText"/>
			</td>
			</tr>
			<tr>
			<th><label for="tel1">전화번호</label></th>
			<td colspan="3">
			<input type="text" id="tel1" name="tel" value="" size="3" class="inputText">
			-
			<input type="text" id="tel2" name="tel" value="" size="3" class="inputText">
			-
			<input type="text" id="tel3" name="tel" value="" size="3" class="inputText">
			</td>
			</tr>
			</table>
 				 <button type="submit" class="join" >가입</button>
 				 <button type="submit" class="back" >취소</button>
		</div>
		<!-- content end -->
		
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>