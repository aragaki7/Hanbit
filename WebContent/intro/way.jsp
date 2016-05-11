<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Way</title>
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
    body{											/* 바탕을 검은색으로 바꿈 */
	   background-color: black;
	 }
	 .nav,.nav2,.nav3,.nav4,.nav5,.nav6{			/* nav를 없앰 */
	display:none;
	 }
	 #mobileblock{  								/* 없앤 nav자리를 비움 */
	margin-top:90px;
	 }
	 #intro_way{									/* way img */
	 position:absolute;
	 width:380px;
	 height:550px;
	 margin-top:-78px;
	 }
	 p{
	 display: none;
	 }
	 #Hblogo{										/* 한빛로고 */
	position:absolute;
	margin-top:-105px;
	margin-left:-286px; 
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
.table {
	margin:0px;
	padding:0px;
	width:800px;
	}
.table table{
    border-collapse: collapse;
    border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;
	padding:0px;
	
	}
.table td {
	vertical-align:middle;
	background-color:#F6F6F6;
	border-width:0px 1px 1px 0px;
	text-align:left;
	padding:7px;
	font-size:14px;
	font-family:Arial;
	font-weight:normal;
	color:#000000;
	width:100px;
}
 #intro_way{
 width:803px;
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
		<p>CENTER INTRODUCTION<br/><h4>찾아오는길</h4></p>
			<hr/><br/>
		<div class="grid9">
		<img src="../imgs/intro_way.JPG" id="intro_way">
		<br/><br/>
		<div class="table">
		<table>
		<tr><td>상세위치 : 2,7호선 5번출구 전방 600미터 롯데마트건물(1층 롯데마트)3층</td></tr>
		<tr><td>회사주소 : 서울특별시 광진구 자양동 아차산로 300</td></tr>
		<tr><td>대표전화 : 02-707-1480 (방문예정이신분은 사전에 예약바람)</td></tr>
		</table>
		</div>
		</div>
		</div>
		<img src="../imgs/BKLogo.png" alt="hblogo" id="Hblogo"/>  <!-- Logo -->
		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>