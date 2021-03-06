<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 등록</title>
	<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="../js/menuLoad.js"></script>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript">

<%
JSONObject jsonObject2 = new JSONObject();
jsonObject2 = (JSONObject) session.getAttribute("jsonObj");
if (jsonObject2 != null) {%>
	var pm = "<%=jsonObject2.getString("pm")%>";
	if (!("관리자"== pm)) {
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
		$('form').submit(function(){
			var title = $('#title').val();
			if(title=="" || title==null){
				alert('제목을 입력하세요');
				$('#title').focus();
				return false;
			}
			
			if(CKEDITOR.instances.contents.getData()==''|CKEDITOR.instances.contents.getData()==null){
				alert('내용을 입력하세요');
				CKEDITOR.instances.contents.focus();
				return false;
			}
		}); 
		$('.back').click(function(){
			window.location.href = "../customer/notice.do";
		}); 
	});
  </script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
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
#write{
	text-align: left;
	display: block;
	width: 400px;
	font-size: 14pt;
	font-weight: bold;
	color: black;
}
hr {
	width: 800px;
	border-top: 3px solid #9C9C9C;
	border-bottom: 3px solid #F6F6F6;
	box-shadow: 5px 5px 5px lightgray;
}
#li1{
	margin-top:-30px;
	width: 800px;
	list-style-type: none;
	height: 300px;
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
	margin:5px;
	height: 20px;
	color:black;
	font-size: 10pt;
	background-color:#e6e6e6;
}
.join_tbl td {
	padding:5px 15px; 
	border-bottom:1px solid #ddd;
	height: 20px;
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
#id{
	width: 700px;
}
.join{
	width: 80px;
	height: 30px;
	margin-left: 300px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
	margin-top: 270px;
}
.back{
	width: 80px;
	height: 30px;
	margin-left: 0px;
	margin-top: 270px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: black;
	border: none;
}
textarea {
	resize: none;
}
span{
	font-size: 9pt;
}
</style>
</head>
<body>

<div class="container_12">
	<%@ include file="../template/header.jsp" %>
	<%@ include file="../template/nav.jsp" %>	
	<!-- content start -->
		
	<div class="grid9">
		<p>NOTICE</p>
		<p id="write">공지사항 쓰기</p><hr/><br/>
		<%
			JSONObject loginID = new JSONObject();
			loginID = (JSONObject) session.getAttribute("jsonObj");
		%>
		<form action="../customer/noticeinsert.do" method="post">
			<table class="join_tbl">
			<colgroup>
				<col width="10%" />
				<col width="40%" />
				<col width="10%" />
				<col width="40%" />
			</colgroup>
			<tr> 
				<th>제목</th>
				<td><input type="text" id="title" name="title" value="" size="100" class="inputText">
				<input type="hidden" name="name" value="<%= loginID.get("id") %>" readonly="readonly"></td>
			</tr>
			</table>
				
			<li id="li1" >
				<textarea cols="80" id="contents" name="contents" rows="10" ></textarea>
				<script type="text/javascript">
					window.onload=function(){
						CKEDITOR.replace('contents',{enterMode:'2',shiftEnterMode:'3'});
					};
				</script>
			</li><br/>
			<button type="submit" class="join" >작성</button>
			<button type="reset" class="back" >취소</button>
		</form>	
	</div>
		
	<!-- content end -->
	<%@ include file="../template/asideIn.jsp" %>
	<%@ include file="../template/footer.jsp" %>
</div>
</body>
</html>