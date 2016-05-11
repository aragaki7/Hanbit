<%@page import="bean.AttData"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="db.DBConnect"%>
<%@page import="bean.UserData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 정보 상세페이지</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<script type="text/javascript" src="../js/joinVaild.js"></script>
<script type="text/javascript" src="../js/search.js"></script>

<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

#p1 {
	text-align: left;
	display: block;
	width: 400px;
	font-size: 20pt;
	font-weight: bold;
	color: black;
}

hr {
	width: 800px;
	border-top: 3px solid #9C9C9C;
	border-bottom: 3px solid #F6F6F6;
	box-shadow: 5px 5px 5px lightgray;
}

.content {
	height: 400px;
}

.back {
	width: 60px;
	height: 20px;
	margin-left: 0px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
}

img {
	border: none
}

.join_tbl {
	width: 800px;
	border-collapse: collapse;
	border-spacing: 0;
	border-top: 2px solid #ddd;
	border-bottom: 2px solid #ddd;
	font-size: 11px;
	font-family: dotum;
	margin-bottom: 30px;
}

.join_tbl th {
	text-align: center;
	padding: 7px 4px;
	height: 30px;
	color: black;
	background-color: #e6e6e6;
	font-size: 10pt;
}

.join_tbl td {
	padding: 5px 15px;
	border-bottom: 1px solid #ddd
}

.join_tbl td span {
	color: black;
	font-size: 11pt;
}

.join_tbl textarea {
	width: 95%;
	height: 80px;
	border: 1px solid #ccc;
	padding: 10px
}

.btn {
	text-align: center;
}

span {
	font-size: 9pt;
}

#ck {
	width: 20px;
}

p {
	font-size: 9pt;
}

label {
	color: black;
	margin-left: 1px;
	width: 10px;
	font-size: 12pt;
}

.hid{
	display: none;
}

#changeBtn{
	width: 40px;
	height: 20px;
	background-color: firebrick;
	color: white;	
}
.saturday{
	color: blue;
}
.sunday{
	color: red;
}
.space{
	background-color: black;
}
#attendChart{
	border: 1px solid black;
	text-align: center;
}
#attendChart tr, #attendChart td{
	border: 1px solid black;
}
#attendChart td{
	width:20px;
}

</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.week').each(function(){
			if($(this).text()=='일'){
				$(this).css('color','red');
			}
			else if($(this).text()=='토'){
				$(this).css('color','blue');
			}
		});
	});
</script>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp"%>
		<%@ include file="../template/nav.jsp"%>

		<!-- content start -->

		<br />
		<div class="grid9 content">
			<form action="studedit.do">
				<p id="p1">출결 정보 수정 페이지</p>
				<hr />
				<br />
				<table class="join_tbl">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
				<%String id = request.getParameter("id");
				  String name = request.getParameter("name");
				  String mobile = request.getParameter("mobile");
				  String attDate = request.getParameter("attDate");
				  int attNum =  Integer.parseInt(request.getParameter("attNum"));
				%>	
					<tr class="hid">
						<th>아이디</th>
						<td colspan="3"><span id="name" name="name">
											<input type="hidden" value="<%=id%>" name="id"/>
											<input type="hidden" value="<%=attDate %>" name="attDate"/>
										</span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="3"><span id="name" name="name"><%=name%></span></td>
					</tr>
					<th>휴대폰</th>
					<td colspan="3"><span id="tel4" name="mobile" size="3"><%=mobile%></span></td>
					</tr>
					<tr>
						<th>강의실</th>
						<td colspan="3"><span name="classroom">이날 출결 상황 : 
						<%if(attNum==0) {%>
						 <span>출석</span>
						<%}%>
						<%if(attNum==1) {%>
						 <span>지각</span>
						<%}%>
						<%if(attNum==2) {%>
						 <span>조퇴</span>
						<%}%>
						<%if(attNum==3) {%>
						 <span>결석</span>
						<%}%> 
						</span>
						<span>
							<select name="attNum">
								<option value="0">출석</option>
								<option value="1">지각</option>
								<option value="2">조퇴</option>
								<option value="3">결석</option>
						
							</select><button type="submit" id="changeBtn"> 변경</button>
						</td>
						</span>
					</tr>
				</table>
			</form>
<%
    Calendar cal = Calendar.getInstance(); // Calendar Instance 생성
    int year = cal.get(Calendar.YEAR); //현재 연도를 가져옴
    int month = cal.get(Calendar.MONTH); // 현재 달을 가져옴
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    
    cal.set(year, month, 1); // - Calendar MONTH는 0-11까지이므로 1을 더해준다. 
    int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);  // 시작요일 확인 1~7 1 = 일요일
    int lastDay = cal.getActualMaximum(Calendar.DATE);
%>
 <h2><%=name%>님의 <%=year%>년 <%=month+1%>월 출결 상황</h2><p/>
 
 <%
 		ArrayList<AttData> attendDetailList = (ArrayList<AttData>)request.getAttribute("attendDetailList");
		String[] dayOfWeek = { "", "일", "월", "화", "수", "목", "금", "토" };
		String yo_il = dayOfWeek[cal.get(Calendar.DAY_OF_WEEK)];
		
	%>
	<table border="1">
	<tr>
	<%for(int i=0;i<lastDay;i++){ %>
		<td class="week"><%=dayOfWeek[cal.get(Calendar.DAY_OF_WEEK)] %></td>
	<%
	cal.set(year, month, i+2);
	} %>
	</tr>
	<tr>
	<%for(int i=0;i<lastDay;i++){ %>
		<td><%=i+1%></td>
	<%}  
	int cnt=0;%>
	</tr>
	<tr>
	<%for(int i=0;i<lastDay;i++){
		int j;
		for(j=0;j<attendDetailList.size();j++){
			if(Integer.parseInt(attendDetailList.get(j).getAttDate())==i+1){%>
				<%-- <td><%=attendDetailList.get(j).getAtt()%></td> --%>
				<%int attEq = attendDetailList.get(j).getAtt();
				if(attEq==0){out.print("<td><img src=\"../imgs/att"+attEq+".png\"/></td>");}
				else if(attEq==1){out.print("<td><img src=\"../imgs/att"+attEq+".png\"/></td>");}
				else if(attEq==2){out.print("<td><img src=\"../imgs/att"+attEq+".png\"/></td>");}
				else if(attEq==3){out.print("<td><img src=\"../imgs/att"+attEq+".png\"/></td>");}
				%>
			<%break;}
		}%>
		<%if(j>=attendDetailList.size()){%>
			<td><img src="../imgs/att4.png"/></td>
			<%}
		}%>
	</tr>
	</table>
 
 
<!-- <table> -->
<!-- <tr> -->
<!--     <td align="center"></td> -->
<!-- </tr> -->
<!-- <tr> -->
<!--     <td> -->

<!--         <table id="attendChart"> -->
<!--         	<tr>   -->
<%-- <%  --%>

<!--  	int cnt = 1; -->
<!--  	while(true){ -->
<!--  		if((bgnWeek+lastDay)==cnt)break; -->
<!--  		out.print("<td class=\"sunday\">일</td>"); -->
<!--  		cnt++; -->
<!--  		if((bgnWeek+lastDay)==cnt)break; -->
<!--  		out.print("<td>월</td>"); -->
<!--  		cnt++; -->
<!--  		if((bgnWeek+lastDay)==cnt)break; -->
<!--  		out.print("<td>화</td>"); -->
<!--  		cnt++; -->
<!--  		if((bgnWeek+lastDay)==cnt)break; -->
<!--  		out.print("<td>수</td>"); -->
<!--  		cnt++; -->
<!--  		if((bgnWeek+lastDay)==cnt)break; -->
<!--  		out.print("<td>목</td>"); -->
<!--  		cnt++; -->
<!--  		if((bgnWeek+lastDay)==cnt)break; -->
<!--  		out.print("<td>금</td>"); -->
<!--  		cnt++; -->
<!--  		if((bgnWeek+lastDay)==cnt)break; -->
<!--  		out.print("<td class=\"saturday\">토</td>"); -->
<!--  		if((bgnWeek+lastDay)==cnt)break; -->
<!--  		cnt++; -->
<!--  	} -->
<%-- %>		 --%>
<!-- 			</tr> -->
<%-- <% --%>
     <!-- // 시작요일까지 이동 -->
<%--     for (int i=1; i<bgnWeek; i++){%> --%>
<!--     	<td class="space"></td> -->
<%-- <% }%> --%>
<%-- <%        while (cal.get(Calendar.MONTH) == month) { //변수 month 의 값과, 현재달이 같을때까지 (즉 현재달의 날짜 만큼) --%>
<%-- %>    	 --%>
        
<%--         <td><%=cal.get(Calendar.DATE)%></td> --%>
<%-- <% 		//날짜를 가져온다. --%>
       
<!--  		// 날짜를 1씩 증가시킨다. -->
		
<!--           cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),  cal.get(Calendar.DATE)+1); -->
		
<!--      } -->

<%--     	%> --%>
<!--          </tr> -->
         
<!--          <tr> -->
<%--          <% ArrayList<UserData> attendDetailList = (ArrayList<UserData>)request.getAttribute("attendDetailList"); %> --%>
        
<%--          <% for (int i=1; i<bgnWeek; i++){%> --%>
<!--     		<td class="space"></td> -->
<%-- 		<%}%> --%>
		
<%-- 		<%	for (int i = 0; i < attendDetailList.size(); i++) {%> --%>
<%-- 			<td><%=attendDetailList.get(i).getAtt()%></td> --%>
<%-- 			<td><%=attendDetailList.get(i).getAttDate()%></td> --%>
<%-- 			<td><%String nalja = attendDetailList.get(i).getAttDate().substring(6); --%>
<!--  			System.out.println(nalja); -->
<%-- 			%></td> --%>
<%--        <%}%> --%>
       
    
<%--        <% while (cal.get(Calendar.MONTH) == month) { //변수 month 의 값과, 현재달이 같을때까지 (즉 현재달의 날짜 만큼) --%>
<%-- %>    	 --%>
        
<%--         <td><%=cal.get(Calendar.DATE)%></td> --%>
<%-- <% 		//날짜를 가져온다. --%>
       
<!--  		// 날짜를 1씩 증가시킨다. -->
<!--  		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1); -->
		
<!--      } -->

<%--     	%> --%>
		

<!-- 		</tr> -->
<!--         </table> -->
        

<!--     </td> -->
<!-- </tr> -->
<!-- </table> -->

		</div>
		<!-- content end -->

		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>