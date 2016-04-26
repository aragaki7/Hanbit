<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
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
	height: 500px;
	}
	.edit{
	width: 80px;
	height: 30px;
	margin-left: 300px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
	
	}
	.back{
	width: 80px;
	height: 30px;
	margin-left: 0px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: black;
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
	padding:7px 4px; 
	height: 20px;
	color:black;
	background-color:#e6e6e6;
	font-size: 10pt;
	}
	.join_tbl td {
	padding:5px 15px; 
	border-bottom:1px solid #ddd
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
	span{
		font-size: 9pt;
	}
	#ck{
		width: 20px;
	}
	p{
		font-size: 9pt;
	}
</style>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		
		<!-- content start -->
		
		<br/><div class="grid9 content">
		<form action="#">
			<p id="p1">회원정보수정</p>
			<hr/><br/>
			<table class="join_tbl">
			<colgroup>
			<col width="10%" />
			<col width="40%" />
			<col width="10%" />
			<col width="40%" />
			</colgroup>
			<tr>
			
			<th>아이디</th>
			<td colspan="3">
			<input type="text" id="id" name="id" value="" size="10" class="inputText" disabled="disabled">
			</td>
			</tr>
			<tr>
			<th>비밀번호</th>
			<td>
			<input type="password" id="userId" name="userId" value="" size="10" class="inputText">
			<span class="chkpw1">기존 비밀번호를 입력해주세요</span>
			</td>
			<th id="ck">변경할비밀번호</th>
			<td>
			<input type="password" id="pwcheck" name="password" size="10" class="inputText" />
			<span class="chkpw2">변경할 비밀번호를 입력해주세요</span>
			</td>
			</tr>
			<tr>
			<th>이름</th>
			<td colspan="3">
			<input type="text" id="id" name="name" value="" size="10" class="inputText"/>
			<span>개명으로 이름이 변경된 경우에 한하여 변경이 가능합니다</span>
			</td>
			</tr>
			<tr>
			<th>전화번호</th>
			<td colspan="3">
			<input type="text" id="tel1" name="phone" value="" size="3" class="inputText isN">
			-
			<input type="text" id="tel2" name="phone" value="" size="3" class="inputText isN">
			-
			<input type="text" id="tel3" name="phone" value="" size="3" class="inputText isN">
			</td>
			</tr>
			<tr>
			<th>휴대폰</th>
			<td colspan="3">
			<input type="text" id="tel4" name="mobile" value="" size="3" class="inputText isN">
			-
			<input type="text" id="tel5" name="mobile" value="" size="3" class="inputText isN">
			-
			<input type="text" id="tel6" name="mobile" value="" size="3" class="inputText isN">
			</td>
			</tr>
			<tr>
			<th>이메일</th>
			<td colspan="3">
			<input type="text" name="email" value="" size="10" class="inputText">@
			<input type="text" name="email" value="" size="10" class="inputText">
             <select >
                        <option value=""> 직접입력</option>
                        <option value="naver.com"> naver.com</option>
                        <option value="gmail.com"> gmail.com</option>
                        <option value="hamail.net"> hamail.net</option>
                        <option value="nate.com"> nate.com</option>
             </select>    
             <span>이메일 수신동의
                    <input type="radio" name="emailchk" value="y" checked> 예
                    <input type="radio" name="emailchk" value="n"> 아니오<br/>
              </span> 
			</td>
			</tr>
			<tr>
			<th>주소</th>
			<td colspan="3">
			<input type="text" id="id" name="post" value="" size="10" class="inputText postcodify_postcode5"/>
			<button id="postcodify_search_button"><img src="../imgs/post.JPG"  alt="우편번호검색" /></button>
			<br/><input type="text" id="id" name="main_address" value="" size="10" class="inputText postcodify_address" style="width: 200px;"/>
			<input type="text" id="id" name="sub_address" value="" size="10" class="inputText" style="width: 320px;"/>
			</td>
			</tr>
			</table>
 				 <button type="submit" class="edit" >수정</button>
 				 <button type="reset" class="back" >취소</button>
 				 </form>
		</div>
		<!-- content end -->
		
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>