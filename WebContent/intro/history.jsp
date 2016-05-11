<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>History</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<style type="text/css">
@media only screen and (max-width:399px){
          /*mobile*********************************************/
    *{
      margin: 0px;
      padding: 0px; 
   }
   .container_12{
      width: 100%;
   }
  
   .grid3{
   	display: none;
   }
    .footer{
    	display: none;
    }
    .header>.img1{
    	display:none;
    }
  
  
	 .nav,.nav2,.nav3,.nav4,.nav5,.nav6{			/* nav를 없앰 */
	display:none;
	 }
	 #mobileblock{  								/* 없앤 nav자리를 비움 */
	margin-top:90px;
	 }
	 p,hr{
	 display: none;
	 }
	 #Hblogo{										/* 한빛로고 */
	position:absolute;
	margin-top:-105px;
	margin-left:53px; 
	 }
	  #rowspan{										/* table의 년도 */
	 background-color:#D5D5D5;
	 font-weight:bold;
	 font-size: 25px;
	 text-align:center;
	 color:#4C4C4C;
	 }
	 #month{										/* table의 월 */
	 background-color:#F6F6F6;
	  font-size: 20px;
	  text-align:center;
	 }
	 #hcnt{											/* table의 내용 */
	  border: 1px solid #F6F6F6;
	  font-size:15px;
	 }
	 .history{										/* table의 넓이 */
	 width:100%;
	 }
	 }
 @media only screen and (min-width:400px){
	/*pc  **********************************************************************/
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
 #rowspan{
 background-color:#D5D5D5;
 font-weight:bold;
 font-size: 25px;
 text-align:center;
 color:#4C4C4C;
 }
 #month{
 background-color:#F6F6F6;
  font-size: 20px;
  text-align:center;
 }
 #hcnt{
  border: 1px solid #F6F6F6;
  font-size:15px;
 }
 #intro_history{
 width:803px;
 }
 .history{
 width:800px;
 }
  #a{
 	background-color: firebrick;
 }
  #Hblogo{										/* 한빛로고 */
	display: none;
	 }
 }
</style>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		
		<!-- content start -->
		<br/><div class="grid9 content" >
		<p>CENTER INTRODUCTION<br/><h4>연혁</h4></p>
			<hr/><br/>
		<div class="grid9">
		<table class="history">
		<tr><td rowspan="7" id="rowspan">2015</td><td id="month">11</td><td id="hcnt">일본해외취업 K-Move 스쿨 연수기관 운영-한국산업인력공단</td></tr>
		<tr><td id="month">10</td><td id="hcnt">스펙초월아카데미 - 신명용의 멘토스쿨 운영업무 수행</td></tr>
		<tr><td id="month">9</td><td id="hcnt">근로자직업능력개발 훈련 4개 과정 승인 및 수행</td></tr>
		<tr><td id="month">7</td><td id="hcnt">KB데이타시스템 - 클라우드 가상화 시스템 직무교육</td></tr>
		<tr><td id="month">6</td><td id="hcnt">한빛이엔아이 사물인터넷 역량강화 컨소시엄 승인 및 수행-KOSA</td></tr>
		<tr><td id="month">5</td><td id="hcnt">일본해외취업 K-Move스쿨 연수기관 운영(와이엔지커리어와 컨소시엄 진행)</td></tr>
		<tr><td id="month">4</td><td id="hcnt">근로자 직업능력개발훈련 -고용노동부</td></tr>
		</table>
		<br/>
		<table class="history">
		<tr><td rowspan="7" id="rowspan">2014</td><td id="month">11</td><td id="hcnt">일본해외취업 K-Move 스쿨 연수기관 운영-한국산업인력공단</td></tr>
		<tr><td id="month">10</td><td id="hcnt">스펙초월아카데미 - 신명용의 멘토스쿨 운영업무 수행</td></tr>
		<tr><td id="month">9</td><td id="hcnt">근로자직업능력개발 훈련 4개 과정 승인 및 수행</td></tr>
		<tr><td id="month">7</td><td id="hcnt">KB데이타시스템 - 클라우드 가상화 시스템 직무교육</td></tr>
		<tr><td id="month">6</td><td id="hcnt">한빛이엔아이 사물인터넷 역량강화 컨소시엄 승인 및 수행-KOSA</td></tr>
		<tr><td id="month">5</td><td id="hcnt">일본해외취업 K-Move스쿨 연수기관 운영(와이엔지커리어와 컨소시엄 진행)</td></tr>
		<tr><td id="month">4</td><td id="hcnt">근로자 직업능력개발훈련 -고용노동부</td></tr>
		</table>
		<br/>
		<table class="history">
		<tr><td rowspan="7" id="rowspan">2013</td><td id="month">11</td><td id="hcnt">일본해외취업 K-Move 스쿨 연수기관 운영-한국산업인력공단</td></tr>
		<tr><td id="month">10</td><td id="hcnt">스펙초월아카데미 - 신명용의 멘토스쿨 운영업무 수행</td></tr>
		<tr><td id="month">9</td><td id="hcnt">근로자직업능력개발 훈련 4개 과정 승인 및 수행</td></tr>
		<tr><td id="month">7</td><td id="hcnt">KB데이타시스템 - 클라우드 가상화 시스템 직무교육</td></tr>
		<tr><td id="month">6</td><td id="hcnt">한빛이엔아이 사물인터넷 역량강화 컨소시엄 승인 및 수행-KOSA</td></tr>
		<tr><td id="month">5</td><td id="hcnt">일본해외취업 K-Move스쿨 연수기관 운영(와이엔지커리어와 컨소시엄 진행)</td></tr>
		<tr><td id="month">4</td><td id="hcnt">근로자 직업능력개발훈련 -고용노동부</td></tr>
		</table>
		<br/>
		<table class="history">
		<tr><td rowspan="7" id="rowspan">2012</td><td id="month">11</td><td id="hcnt">일본해외취업 K-Move 스쿨 연수기관 운영-한국산업인력공단</td></tr>
		<tr><td id="month">10</td><td id="hcnt">스펙초월아카데미 - 신명용의 멘토스쿨 운영업무 수행</td></tr>
		<tr><td id="month">9</td><td id="hcnt">근로자직업능력개발 훈련 4개 과정 승인 및 수행</td></tr>
		<tr><td id="month">7</td><td id="hcnt">KB데이타시스템 - 클라우드 가상화 시스템 직무교육</td></tr>
		<tr><td id="month">6</td><td id="hcnt">한빛이엔아이 사물인터넷 역량강화 컨소시엄 승인 및 수행-KOSA</td></tr>
		<tr><td id="month">5</td><td id="hcnt">일본해외취업 K-Move스쿨 연수기관 운영(와이엔지커리어와 컨소시엄 진행)</td></tr>
		<tr><td id="month">4</td><td id="hcnt">근로자 직업능력개발훈련 -고용노동부</td></tr>
		</table>
		</div>
		</div>
		<img src="../imgs/BKLogo.png" alt="hblogo" id="Hblogo"/>  <!-- Logo -->
		<!-- content end -->
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>