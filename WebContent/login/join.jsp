<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 창</title>
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
	.join{
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
	.btn {
	text-align:center
	}
	span{
		font-size: 9pt;
	}
	#ck{
		width: 20px;
	}
</style>
<script type="text/javascript">
 	$(document).ready(function(){
		$(function() {
			$("#postcodify_search_button").click(
					function(e){e.preventDefault();
					})});
		$("#postcodify_search_button").postcodifyPopUp();
		
 		$('select').on('change',function(){
  			var idx = this.selectedIndex;
 			if(idx==0){
  				$('input[name="domain"]').val('');
 			}
 			else{
 				var str = "";
 				$('input[name="domain"]').val(this.options[this.selectedIndex].value);
 			}
 		});
 		
 		$('form').on('submit',function(){
 			var result=false;
 			if(flag1 && flag2 && flag3){
//  				alert('flag만족 함');
 				for(var a=0;a<$('input[type!="radio"]').length;a++){
	 				if($('input[type!="radio"]').eq(a).val()==""){
						alert('비어있는 항목이 있습니다.');	 					
	 					return false
	 				}
 				}
 				for(var b=0;b<$('.isN').length;b++){
 					if(!($.isNumeric($('.isN').eq(b).val()))){
 						alert('연락처는 숫자만 입력 하세요');
 						return false;
 					}
 				}
 				
				return true;
 			}else{
 				alert('ID 및 PassWord를 확인하세요');
 			}
 			return false;
 		});
	});

</script>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		
		<!-- content start -->
		
		<br/><div class="grid9 content">
		<form action="join.do" method="post">
			<p id="p1">회원가입</p>
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
			<input type="text" id="id" name="id" value="" size="10" class="inputText">
			<span class ="chkid">띄어쓰기 없는 영문 숫자조합, 6~12글자</span>
			</td>
			</tr>
			<tr>
			<th>비밀번호</th>
			<td>
			<input type="password" name="password1" value="" size="10" class="inputText">
			<span class="chkpw1">6˜12 이내의 영문/숫자</span>
			</td>
			<th id="ck">비밀번호확인</th>
			<td>
			<input type="password" id="pwcheck" name="password2" size="10" class="inputText" />
			<span class="chkpw2">입력한 비밀번호를 다시 입력</span>
			</td>
			</tr>
			<tr>
			<th>이름</th>
			<td>
			<input type="text" id="id" name="name" value="" size="10" class="inputText">
			<span>반드시 실명으로 입력해주세요</span>
			</td>
			</tr>
			<tr>
			<th>성별</th>
			<td colspan="3">
			<input type="radio" name="sex" value="male" checked>남자 
            <input type="radio" name="sex" value="female">여자	
			</td>
			</tr>
			
			<tr>
			<th>전화번호</th>
			<td colspan="3">
			<input type="text" id="tel1" name="phone1" value="" size="3" class="inputText isN">
			-
			<input type="text" id="tel2" name="phone2" value="" size="3" class="inputText isN">
			-
			<input type="text" id="tel3" name="phone3" value="" size="3" class="inputText isN">
			</td>
			</tr>
			<tr>
			<th>휴대폰</th>
			<td colspan="3">
			<input type="text" id="tel4" name="mobile1" value="" size="3" class="inputText isN">
			-
			<input type="text" id="tel5" name="mobile2" value="" size="3" class="inputText isN">
			-
			<input type="text" id="tel6" name="mobile3" value="" size="3" class="inputText isN">
			</td>
			</tr>
			<tr>
			<th>이메일</th>
			<td colspan="3">
			<input type="text" name="email" value="" size="10" class="inputText">@
			<input type="text" name="domain" value="" size="10" class="inputText">
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
 				 <button type="submit" class="join" >가입</button>
 				 <button type="reset" class="back" >취소</button>
 				 </form>
		</div>
		<!-- content end -->
		
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>