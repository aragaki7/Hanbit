<%@page import="bean.AskData"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.sql.Date"%>
<%@page import="bean.BoardData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ask</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
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

hr {
	width: 800px;
	border-top: 3px solid #9C9C9C;
	border-bottom: 3px solid #F6F6F6;
	box-shadow: 5px 5px 5px lightgray;
}

.table {
	margin: 0px;
	padding: 0px;
	width: 800px;
	box-shadow: 10px 10px 5px #888888;
	border: 1px solid #000000;
}

.table table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
}

.table tr:hover td {
	background-color: #d2d2d2;
	color: black;
}

.table td {
	vertical-align: middle;
	background-color: white;
	border: 1px solid #000000;
	border-width: 0px 1px 1px 0px;
	text-align: left;
	padding: 7px;
	font-size: 10px;
	font-family: Arial;
	font-weight: normal;
	color: #000000;
	width: 100px;
}

.table tr:first-child td {
	background: -o-linear-gradient(bottom, #4c4c4c 5%, #000000 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #4c4c4c
		), color-stop(1, #000000));
	background: -moz-linear-gradient(center top, #4c4c4c 5%, #000000 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#4c4c4c",
		endColorstr="#000000");
	background: -o-linear-gradient(top, #4c4c4c, 000000);
	background-color: #4c4c4c;
	border: 0px solid #000000;
	text-align: center;
	border-width: 0px 0px 1px 1px;
	font-size: 14px;
	font-family: Arial;
	font-weight: bold;
	color: #ffffff;
}

#row>td {
	text-align: center;
	font-size: 10pt;
}

.content {
	height: 300px;
}

.page {
	text-align: center;
	margin-top: 13px;
	margin-left: -95px;
}

.page a {
	text-decoration: none;
	color: black;
}

.yes {
	margin-top: 30px;
	width: 105px;
	height: 30px;
	margin-left: 690px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
}

#e {
	background-color: firebrick;
}
</style>
<script type="text/javascript">
function getRow(rowValue) {//테이블 클릭시 row num 넘겨주는 함수
	var rowIndex = rowValue.rowIndex;
	return rowIndex;
}

	$(document).ready(function(){
		$('.rownum').on('click', function() {
			var ridx=getRow(this);
// 			alert("ridx : "+ridx);
		    var id = $('.rownum:eq('+(ridx-1)+')>td:eq(0)').text();//$('.rownum:eq(n)>td:eq(0)').text();id 받음
			location.href="/Hanbit/customer/askdetail.do?id="+id;
		});
		
	});
	

</script>
</head>
<body>

   <div class="container_12">
      <%@ include file="../template/header.jsp"%>
      <%@ include file="../template/nav.jsp"%>

      <!-- content start -->
<%
      ArrayList<AskData> list= (ArrayList<AskData>)request.getAttribute("list");
%>
       <div class="grid9">
         <!--  1:1문의 내용 시작-->
         <p>1:1 문의
         
         </p>
         <hr />
         <br />
         <div class="table">
            <table style="width: 100%">
                  <col style="width:5%">
                  <col style="width:15%">
                  <col style="width:55%">
                  <col style="width:15%">
                  <col style="width:10%">
                  <tr>
                     <td>index</td>
                     <td>작성자</td>
                     <td>제목</td>
                     <td>날짜</td>
                     <td>시간</td>
                  </tr>

               <%
                  for (int i = 0; i < list.size(); i++) {
               %>
               <tr id="row" style="cursor: hand;" onclick="location.href='#'">
                  <td><%=list.get(i).getNum() %></td>
                  <td><%=list.get(i).getId() %></td>
                   <td><%=list.get(i).getTitle()%></td>
                  
                  <%
                     if (list.get(i).getDate().toString().equals(new Date(System.currentTimeMillis()).toString())) {

                           String[] time = list.get(i).getTime().toString().split(" ");
                  %>

                  <td><%=time[1]%></td>

                  <%
                     } else {
                  %>
                  <td><%=list.get(i).getDate()%></td>
                  <%
                     }
                  %>

               </tr>
               <%
                  }
               %>
               </table>
			</div>
			<div id="write">
				<a href="../ckeditor/ask.jsp"> <input type="button" value="글쓰기"
					class="yes"></a>
			</div>
		</div>
		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>