<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
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
#attInfo{
	font-size:12px;
	background-color: #EAEAEA;
	width: 600px;
	border-top: 2px solid #D5D5D5;
	border-bottom: 2px solid #D5D5D5;
	margin:5px 0px;
	padding: 10px;
}
#attView span ~ span, #attView>span{
	font-size:12px;
	color:red;
	font-weight: bold;
	border: 1px solid #D5D5D5;
}
h2{
margin-bottom: 20px;
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
// 					System.out.println(attDate);
				%>	
				<%
				    Calendar cal = Calendar.getInstance(); // Calendar Instance 생성
				    int year = cal.get(Calendar.YEAR); //현재 연도를 가져옴
				    int month = cal.get(Calendar.MONTH); // 현재 달을 가져옴
				    
				    cal.set(year, month, 1); // - Calendar MONTH는 0-11까지이므로 1을 더해준다. 
				    int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);  // 시작요일 확인 1~7 1 = 일요일
				    int lastDay = cal.getActualMaximum(Calendar.DATE);
				    SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
				    Date tempDate = transFormat.parse(attDate); //String attDate -> date type 으로 변환
				    SimpleDateFormat dateFormat = new SimpleDateFormat("yy년 MM월 dd일 E요일");
				    
				%>
				
				<%ArrayList<AttData> attendDetailList = (ArrayList<AttData>)request.getAttribute("attendDetailList");
					int weekCnt = 0; // 주말 숫자 계산 카운트
					int checkCnt=0; //출석 일 수 계산 카운트
					int leaveCnt=0; //지각&조퇴 카운트
					int absenceCnt=0; //결석카운트
				
				%>
					<tr class="hid">
						<th>아이디</th>
						<td colspan="3"><span id="name" name="name">
											<input type="hidden" value="<%=id%>" name="id"/>
											<input type="hidden" value="<%=attDate%>" name="attDate"/>
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
						<th>출결수정</th>
						<td colspan="3"><span name="classroom"><%=dateFormat.format(tempDate)%> 출결 상황 : 
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

 <h2><%=name%>님의 <%=year%>년 <%=month+1%>월 출결 상황</h2><p/>
 
 <%
 		
		String[] dayOfWeek = { "", "일", "월", "화", "수", "목", "금", "토" };
		String yo_il = dayOfWeek[cal.get(Calendar.DAY_OF_WEEK)];
		
	%>
	<table border="1">
	<tr>
	<%for(int i=0;i<lastDay;i++){ %>
		<%if("일".equals(dayOfWeek[cal.get(Calendar.DAY_OF_WEEK)])||"토".equals(dayOfWeek[cal.get(Calendar.DAY_OF_WEEK)])){
			weekCnt++;
		} %>
		<td class="week"><%=dayOfWeek[cal.get(Calendar.DAY_OF_WEEK)] %></td>
	<%
	cal.set(year, month, i+2);
	} %>
	</tr>
	<tr>
	<%for(int i=0;i<lastDay;i++){ %>
		<td><%=i+1%></td>
	<%}  
	int cnt=0;
	
	%>
	</tr>
	<tr>
	<%for(int i=0;i<lastDay;i++){
		int j;
		for(j=0;j<attendDetailList.size();j++){
			if(Integer.parseInt(attendDetailList.get(j).getAttDate())==i+1){%>
				<%-- <td><%=attendDetailList.get(j).getAtt()%></td> --%>
				<%int attEq = attendDetailList.get(j).getAtt();
				if(attEq==0){checkCnt++;
					out.print("<td><img src=\"../imgs/att"+attEq+".png\"/></td>");}
				else if(attEq==1){
					leaveCnt++;
					out.print("<td><img src=\"../imgs/att"+attEq+".png\"/></td>");}
				else if(attEq==2){
					leaveCnt++;
					out.print("<td><img src=\"../imgs/att"+attEq+".png\"/></td>");}
				else if(attEq==3){
					absenceCnt++;
					out.print("<td><img src=\"../imgs/att"+attEq+".png\"/></td>");}
				%>
			<%break;}
		}%>
		<%if(j>=attendDetailList.size()){%>
			<td>&nbsp;&nbsp;</td>
			<%}
		}%>
	</tr>
	</table>
	<br/>
	<%int attTotal = lastDay-weekCnt;
	double attPer = (double)checkCnt/attTotal*100;
	int leaveTotal = (int)(absenceCnt+(leaveCnt/3));
	String format = "#.##";
	DecimalFormat df = new java.text.DecimalFormat(format);
	
	%>
	<div id =attView>
		<span>소정 출석 횟수 : <%=lastDay-weekCnt%>일</span>
		<span>출석 일 수 : <%=checkCnt%>일</span>
		<span>결석 일 수 : <%=leaveTotal%>일</span>
		<span>출석률 : <%out.println(df.format(attPer));%>%</span>
	</div>
	<div id="attInfo">
	* 화면상태 표시 설명 => 출석:[<img src="../imgs/att0.png"/>]&nbsp;지각:[<img src="../imgs/att1.png"/>]
							조퇴:[<img src="../imgs/att2.png"/>]&nbsp;결석:[<img src="../imgs/att3.png"/>]
							&nbsp;입력 없음:[&nbsp;&nbsp;]<br/>
	* 지각, 조퇴, 외출 3회 마다 1일 결석으로 처리됩니다.<br/> 
	* 출결유무는 교육진에서 출결자료를 입력한 후에 반영됩니다.<br/>
	* 단위기간 출석률이 80% 미만인 경우 제적될 수 있습니다.
	</div>
		</div>
		<!-- content end -->

		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>