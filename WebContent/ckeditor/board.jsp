<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 등록</title>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#btnBack').click(function(){
                window.location.href = "/board/boardList.html";
            });//
        });
    </script>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
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
	border-bottom:1px solid #ddd
	}
	.join_tbl td ight: 20px;s
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
	margin-top: 100px;
	
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
		<p>BOARD</p>
			<p id="write">문의게시판 쓰기</p>
			<hr />
			<br />
			<form action="" method="post">
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
			<input type="text" name="id" value="" size="10" class="inputText">
			</td>
			</tr>
			<tr>
			<th>이름</th>
			<td>
			<input type="text" name="name" value="" size="10" class="inputText">
			<span>반드시 실명으로 입력해주세요</span>
			</td>
			</tr>
			<tr>
			<th>휴대폰번호</th>
			<td colspan="3">
			<input type="text" id="tel1" name="mobile" value="" size="3" class="inputText">
			-
			<input type="text" id="tel2" name="mobile" value="" size="3" class="inputText">
			-
			<input type="text" id="tel3" name="mobile" value="" size="3" class="inputText">
			</td>
			</tr>
			<tr>
			<th>이메일</th>
			<td colspan="3">
			<input type="email" name="email" value="" size="10" class="inputText">@
			<input type="email" name="email" value="" size="10" class="inputText">
             <select >
                        <option value=""> 직접입력</option>
                        <option value="naver.com"> naver.com</option>
                        <option value="gmail.com"> gmail.com</option>
                        <option value="hamail.net"> hamail.net</option>
                        <option value="nate.com"> nate.com</option>
             </select>    
			</td>
			</tr>
			<tr>
			<th>제목</th>
			<td>
			<input type="text" id="id" name="name" value="" size="10" class="inputText">
			</td>
			</tr>
			</table>
	        <li  id="li1" ><textarea cols="80" id="contents" name="contents" rows="10" ></textarea>
	            <script type="text/javascript">
	                CKEDITOR.replace( 'contents' );
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