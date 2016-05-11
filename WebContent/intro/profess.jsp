<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profess</title>
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
	 #intro_profess{									/* profess img */
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
	margin-left:-7px; 
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
 #intro_profess{
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
		<p>CENTER INTRODUCTION<br/><h4>교수진소개</h4></p>
			<hr/><br/>
		<div class="grid9">
		<img src="../imgs/intro_profess.png" id="intro_profess">
		</div>
		</div>
		<img src="../imgs/BKLogo.png" alt="hblogo" id="Hblogo"/>  <!-- Logo -->
		<!-- content end -->
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>