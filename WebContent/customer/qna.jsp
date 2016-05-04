<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<style type="text/css">
 #e{
 	background-color: firebrick;
 }

 /*///////////////////////////////////////////////////////////////////////////////////////////*/
#css_tabs2 {
    font-family:'nanumgothic', '나눔고딕', 'malgun gothic', '맑은 고딕', 'dotum', '돋움', sans-serif
}
/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs2 input:nth-of-type(1), #css_tabs2 input:nth-of-type(1) ~ div:nth-of-type(1), #css_tabs2 input:nth-of-type(2), #css_tabs2 input:nth-of-type(2) ~ div:nth-of-type(2) 
, #css_tabs2 input:nth-of-type(3), #css_tabs2 input:nth-of-type(3) ~ div:nth-of-type(3) , #css_tabs2 input:nth-of-type(4), #css_tabs2 input:nth-of-type(4) ~ div:nth-of-type(4)
, #css_tabs2 input:nth-of-type(5), #css_tabs2 input:nth-of-type(5) ~ div:nth-of-type(5)
{
    display:none
}
#css_tabs2 input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs2 input:nth-of-type(2):checked ~ div:nth-of-type(2)
, #css_tabs2 input:nth-of-type(3):checked ~ div:nth-of-type(3) , #css_tabs2 input:nth-of-type(4):checked ~ div:nth-of-type(4)
, #css_tabs2 input:nth-of-type(5):checked ~ div:nth-of-type(5)
 {
    display:block
}
/* 라벨 기본 스타일 지정 */
#css_tabs2 > label {
    display:inline-block;
    font-variant:small-caps;
    font-size:.9em;
    padding:5px;
    text-align:center;
    width:140px;
    line-height:1.8em;
    font-weight:700;
    border-radius:3px 3px 0 0;
    background:#eee;
    color:#777;
    border:1px solid #ccc;
    border-width:1px 1px 0
}
#css_tabs2 > label:hover {
    cursor:pointer;
}
#css_tabs2 label[for=tb1] {
    margin-top:20px;
}
/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs2 input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs2 > label[for=tb1]:hover 
,#css_tabs2 input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs2 > label[for=tb2]:hover
,#css_tabs2 input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs2 > label[for=tb3]:hover
,#css_tabs2 input:nth-of-type(4):checked ~ label:nth-of-type(4), #css_tabs2 > label[for=tb4]:hover
,#css_tabs2 input:nth-of-type(5):checked ~ label:nth-of-type(5), #css_tabs2 > label[for=tb5]:hover {
    background:firebrick;
    color:white;
}

/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs2 .tb1_content, #css_tabs2 .tb2_content, #css_tabs2 .tb3_content, #css_tabs2 .tb4_content, #css_tabs2 .tb5_content{
    padding:2em;
    border:1px solid #333;
    width:80%;
    height:100%;
    margin-top:0px;
}
/* /////////////////////////////////////////////////////// */
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
#content2,#content3,#content4,#content5,#content6 {
	margin-top:10pt;
    display: none;
    font-size:11pt;
    text-align:center;
}
#toggle1,#toggle2,#toggle3,#toggle4,#toggle5{
	width: 777px;
	height: 30px;
	font-size: 12pt;
	font-weight: bold;
	color: black;
	background-color: #eee;
	border: none;
	margin-left:-30px;
	
} 	
</style>
<script type="text/javascript">

$(function(){
//id가 toggle안 태그에 click이벤트가 발생하면
 $("#toggle1").click(function(){
  //div영역이 1초동안 접히게 된다.
  //다음 이벤트가 발생하면, 1초동안 펼쳐지게 된다.
  $("div#content2").slideToggle(1000);
 })
  $("#toggle2").click(function(){
  $("div#content3").slideToggle(1000);
 })
  $("#toggle3").click(function(){
  $("div#content4").slideToggle(1000);
 })
  $("#toggle4").click(function(){
  $("div#content5").slideToggle(1000);
 })
  $("#toggle5").click(function(){
  $("div#content6").slideToggle(1000);
 })
});
</script>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		
		<!-- content start -->
		
		<div class="grid9">
			<p>
			Q & A<br/>
			<h4>자주묻는질문</h4>
			</p>
			<hr/><br/>
			<div id="css_tabs2">
			
		    <input id="tb1" type="radio" name="tb" checked="checked" />
		    <input id="tb2" type="radio" name="tb" />
		    <input id="tb3" type="radio" name="tb" />
		    <input id="tb4" type="radio" name="tb" />
		    <input id="tb5" type="radio" name="tb" />
		    <label for="tb1">입학관련</label>
		    <label for="tb2">교육비관련</label>
		    <label for="tb3">교육과정</label>
		    <label for="tb4">취업및정부지원</label>
		    <label for="tb5">기타</label> 
		    
		    <div class="tb1_content">
			    <button id="toggle1">Q. 재직자 교육과정 진행 중에 다른 과정을 수강할 수 있나요?</button>
				 <div id="content2">
				 A. 수강지원금 및 능력개발카드의 경우 교육과정의 교육시간이 다른 경우에 한하여 <br/>1일 2개 과정의 수강이
				가능합니다.<br/>(인터넷원격교육과정이 포함된 경우에는 3개 과정까지 수강이 가능합니다.)<br/> 
				단, 교육시간이 중복되는 교육과정일 경우 동시 수강은 가능하나 한 과정에 대해서만 비용지원이 <br/>
				이루어집니다. 
				또한 사업주위탁 교육의 경우 동일기간 중 2개 이상의 교육과정을 수강할 수 <br/>없습니다.</div>
			</div>
		    <div class="tb2_content">
	 			<button id="toggle2">Q. 교육비용은 어떻게 진행되나요?</button>
				 <div id="content3"> A. 안녕하세요 교육비용은 전액무료이며 내일배움카드를 발급 받으시면 됩니다.<br/>
				  자세한 사항은 센터로 문의 주시면 안내해 드리도록 하겠습니다.</div>
			</div>
		    <div class="tb3_content">
			    <button id="toggle3">Q. 재직자 환급과정 출석률 기준은 어떻게 되나요?</button>
				<div id="content4">
			      A. 재직자 환급 과정의 경우 출석률 80% 이상 되셔야 수료후 환급이 가능합니다. <br/>
	
				과정마다 출석률 계산 기준이 다르니 다음을 참고하시길 바랍니다.<br/><br/> 
				
				1. 총수업시간 30시간 이상인 과정 : <br/>
				30시간 이상인 과정의 경우 총 수업일수를 기준으로 출석률을 계산합니다. <br/>
				출석일수 / 총수업일수 * 100 하시면 출석률이 나옵니다. <br/>
				(단, 지각,조퇴 3회인 경우 1일 결석으로 처리됩니다.) <br/><br/>
				
				2. 총수업시간 30시간 미만인 과정 : <br/>
				30시간 미만인 과정의 경우 총 수업시간(분)을 기준으로 출석률을 계산합니다. <br/>
				출석시간(분) / 총수업시간(분) * 100 하시면 출석률이 나옵니다. <br/>
				(단, 지각,조퇴도 출석시간(분)에도 포함시켜 처리됩니다.)</div>
			</div>
		    <div class="tb4_content">
				<button id="toggle4">Q. 구인구직은 어떻게 진행되나요?</button>
				<div id="content5"> A. 취업지원팀을 통해 도움을 받을 수 있습니다.<br/>
				계속적인 구인의뢰를 희망 하시는 업체는 인력추천요청서 작성하시어,<br/>
				아래 네임카드의 편하신 경로로 보내주시면 필요한 시점에,  <br/>
				귀사에서 원하시는 적합한 전문 인력을
				취업지원 하도록 하겠습니다. 고맙습니다.</div>
			</div>
		    <div class="tb5_content">
			<button id="toggle5">Q. 교육문의는 어떻게 하나요?</button>
			<div id="content6"> A. 남겨주신 연락처로 유선 or 문자답변 드립니다.<br/>
			교육상담 02-123-4567~8(평일 09:00~22:00/토,일,공휴일:10:00~18:00)<br/>
			업무상담 02-123-5678~9(평일 09:00~22:00/토,일,공휴일:10:00~18:00)<br/>
			카카오톡 hb.kakao 건대점 친구추가 후 문의 주세요. 
			</div>
		    </div>
			</div>
			</div>
	
		<!-- content end -->
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>