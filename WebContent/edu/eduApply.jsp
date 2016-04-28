<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교육신청</title>

<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<!-- 신청페이지(eduApply)css 시작 -->
<style type="text/css">
/* 겹치는부분시작 */
*{
 		margin: 0px;
 		padding: 0px;
}
p{
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
 .yes{
	margin-top: 20px;
	width: 110px;
	height: 30px;
	margin-left: 250px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;	
}
/* 겹치는부분시작 */
/* 겹치지않는부분시작 */
.Apply tr #td{
	background:-o-linear-gradient(bottom, #4c4c4c 5%, #000000 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4c4c4c), color-stop(1, #000000) );
	background:-moz-linear-gradient( center top, #4c4c4c 5%, #000000 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#4c4c4c", endColorstr="#000000");	background: -o-linear-gradient(top,#4c4c4c,000000);
	background-color:#4c4c4c;
	border:0px solid #000000;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:14px;
	font-family:Arial;
	font-weight:bold;
	color:#ffffff;
 }
.Apply tr #td2{
	border-bottom: 1px solid lightgray; 
	font-size: 11pt;
	padding-bottom:10px;
}
.Apply tr #td3{
	font-size: 11pt;
}
input[type=text],input[type=email],input[type=textarea],input[type=password] {
	position: relative;
	height: 24px;
	border: 1px solid lightgray;
	overflow: hidden;
	font-size: 12px;
}
input[type=email]{
width:107pt;
}
input[name=tel]{
width:50pt;
}
select{
width:70pt;
height:20pt;
font-size:11pt;
padding-top:-10px;
}
input[type=radio],input[type=checkbox] {
    width:15px;
    height:15px;
}
#b{
 	background-color: firebrick;
}

/* 겹치지않는부분시작 */
</style>
<!-- 신청페이지(eduApply)css 끝 -->
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		<!-- content start -->
<!-- 신청 페이지 시작-->
<br/><div class="grid9 content" >
<p>정규교육신청</p>
			<hr/><br/>
<div>
<table class="Apply">
<tr><td id="td">지원과정 </td><td id="td2">자바 프로그래밍</td></tr>
<tr><td id="td">이름 </td><td id="td2"><input type="text"></td></tr>
<tr><td id="td">이메일 </td><td id="td2"><input type="email" name="em">@
                		<input type="email" name="em">
                		<select name="urlad">
	               	    <option value="직접입력">직접입력</option>
	                    <option value="naver">naver.com</option>
	                    <option value="chol">chol.com</option>
	                    <option value="gmail">gmail.com</option>
	                    <option value="nate">nate.com</option>
	                    <option value="daum">hanmail.net</option>s</select></td></tr>
<tr><td id="td">연락처 </td><td id="td2"><select name="tele">
	                	<option value="010">010</option>
	                    <option value="011">011</option>
	                    <option value="016">016</option>
	                    <option value="017">017</option>
	                    <option value="018">018</option>
	                    <option value="019">019</option>
	                    <option value="070">070</option>
	                    </select>-<input type="text" name="tel">-<input type="text" name="tel"></td></tr>                   
<tr><td><br/></td><td><br/></td></tr>
<tr><td colspan="2"><h4>개인정보보호를 위한 이용자 동의사항</h4>
<textarea name="content" rows="17" cols="109">
	개인정보의 수집범위
	한빛교육센터은 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다. 한빛교육센터의 회원제 서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 하며 선택항목을 입력하시지 않았다 하여 서비스 이용에 제한은 없습니다.
	1) 회원 가입시 수집하는 개인정보의 범위
	- 필수항목 : 희망 ID, 비밀번호, 비밀번호 힌트용 질문과 답변, 성명, 주민등록번호, 주소, 전화번호, 이메일주소, 이메일 수신 여부
	- 선택항목 : 회사주소, 회사전화번호, 생년월일, 결혼여부, 결혼기념일, 직업, 월평균소득, 최종학력, 자녀수, 차량정보
	개인정보의 수집목적 및 이용목적
	① 한빛교육센터은 회원님께 최대한으로 최적화되고 맞춤화된 서비스를 제공하기 위하여 다음과 같은 목적으로 개인정보를 수집하고 있습니다.
	- 성명, 아이디, 비밀번호, 주민등록번호 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용
	- 이메일주소, 이메일 수신여부, 전화번호 : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품이나 이벤트 정보의 안내
	- 주소, 전화번호 : 경품과 쇼핑 물품 배송에 대한 정확한 배송지의 확보
	- 비밀번호 힌트용 질문과 답변 : 비밀번호를 잊은 경우의 신속한 처리를 위한 내용
	- 그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료
	② 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.
	개인정보의 보유기간 및 이용기간
	① 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.
	- 회원가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된 경우 등 일정한 사전에 보유목적, 기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다.
	- 계약 또는 청약철회 등에 관한 기록 : 5년
	- 대금결제 및 재화등의 공급에 관한 기록 : 5년
	- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
	② 귀하의 동의를 받아 보유하고 있는 거래정보 등을 귀하께서 열람을 요구하는 경우 지체없이 그 열람,확인 할 수 있도록 조치합니다.</textarea></td></tr>
<tr><td></td><td id="td3"><input type="checkbox"name="check"value="sev">위 개인정보취급방침에 동의합니다.</td></tr>
<tr><td></td><td>
	<div><input type="submit" value="확인" class="yes"></div>
	<!-- <div><input type="reset" value="취소" class="yes1"></div> --></td></tr>
</table>
</div>
		</div>
<!-- 신청 페이지 끝-->
		
		<!-- content end -->	
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>
