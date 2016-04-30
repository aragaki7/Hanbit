<%@page import="bean.UserData"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출결 수정</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<link rel="stylesheet" type="text/css" href="../css/jquery-ui.css"/>
<style type="text/css">
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
	box-shadow: 10px 10px 5px #888888;
	border:1px solid #000000;
	}
	.table table{
    border-collapse: collapse;
    border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;
	padding:0px;
	}
.table tr:hover td{
	background-color : #d2d2d2;
	color:black;
}
.table td{
	vertical-align:middle;
	background-color:white;
	border:1px solid #000000;
	border-width:0px 1px 1px 0px;
	text-align:left;
	padding:7px;
	font-size:10px;
	font-family:Arial;
	font-weight:normal;
	color:#000000;
	width:100px;
}
.table tr:first-child td{
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
#row>td{
	text-align: center;
	font-size: 10pt;
}
.content{
	height: 300px;
}
.edit{
	margin-top: 40px;
	width: 110px;
	height:30px;
	margin-left: 350px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
	
}
#ip{
	text-align: center;
	width:150px;
	margin-left: 15px;
}
 #d{
 	background-color: firebrick;
 	}
</style>
<script type="text/javascript" >
$(document).ready(function(){
	$( "#datepicker" ).datepicker({
		showOn: "button",
		buttonImage: "../imgs/calendar.png",
		buttonImageOnly: true,
		buttonText: "Select date"
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
			<p>Attendance ADD</p>
			<hr/><br/>
<!-- 			<form action="../student/GradeList.jsp"> -->
			<div class="table" >
                <form action="">
                <table>
                    <tr>
                       	<td>이름</td>
						<td>강의실</td>
						<td><input type="text" id="datepicker" name="attenddate"/></td>
                    </tr>
	                <%ArrayList<UserData> attendlist = (ArrayList<UserData>)request.getAttribute("attendlist");%>
                    <% for(int i=0; i<attendlist.size(); i++){ 
                    %>
                    <tr>
                       	<td><input type="text" readonly="readonly" name="name" value="<%=attendlist.get(i).getName() %>"/></td>
                        <td><input type="text" readonly="readonly" name="class" value="<%=attendlist.get(i).getClasss() %>"/></td>
                        <td>
                        	<select>
								<option value="0" selected="selected">출석</option>
								<option value="1">지각</option>
								<option value="2">조퇴</option>
								<option value="3">결석</option>
							</select>
                        </td>
                    </tr>
                   <% } %>
                </table>
                </form>
            </div>
 				 <button type="submit" class="edit" >입력</button>
<!--  			</form> -->
		</div>
		<!-- content end -->
		
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>