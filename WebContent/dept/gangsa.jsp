<%@page import="bean.UserData"%>
<%@page import="bean.GreadeData" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교육진페이지</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
<link rel="stylesheet" type="text/css" href="../css/jquery-ui.css"/>
</head>
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

.content {
	height: 500px;
}

hr {
	width: 800px;
	border-top: 3px solid #9C9C9C;
	border-bottom: 3px solid #F6F6F6;
	box-shadow: 5px 5px 5px lightgray;
}

.table {
	margin: -20px;
	padding: 0px;
	width: 800px;
	border: 1px solid #000000;
	box-shadow: 10px 10px 5px #888888;
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
	font-size: 13px;
	font-family: Arial;
	font-weight: normal;
	color: #000000;
	width: 100px;
	text-align: center;
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
	color: white;
}

.yes {
	margin-top: 70px;
	width: 110px;
	height: 50px;
	margin-left: 660px;
	font-size: 11pt;
	font-weight: bold;
	color: white;
	background-color: firebrick;
	border: none;
}

#d {
background-color:firebrick;
}
/*///////////////////////////////////////////////////////////////////////////////////////////*/
/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1),
	#css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2),
	#css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(3)
	{
	display: none;
}

#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked 
	 ~ div:nth-of-type(2),  #css_tabs input:nth-of-type(3):checked 
	 ~ div:nth-of-type(3) {
	display: block;
}
/* 라벨 기본 스타일 지정 */
#css_tabs>label {
	display: inline-block;
	font-size: 16px;
	padding: 5px;
	text-align: center;
	width: 130px;
	line-height: 20pt;
	font-weight: bold;
	border-radius: 3px 3px 0 0;
	background: black;
	color: white;
}

#css_tabs>label:hover {
	cursor: pointer;
}

#css_tabs label[for=tab1] {
	margin-top: 20pt;
}
#css_tabs label[for=tab2] {
	margin-top: 20pt;
}
#css_tabs label[for=tab3] {
	margin-top: 20pt;
}
/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs>label[for=tab1]:hover
	{
	background: firebrick;
	color: white;
}

#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs>label[for=tab2]:hover
	{
	background: firebrick;
	color: white;
}

#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs>label[for=tab3]:hover
	{
	background: firebrick;
	color: white;
}

/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab1_content, #css_tabs .tab2_content, #css_tabs .tab3_content {
	padding: 2em;
	height: 100%;
}

.ui-datepicker-trigger {
	text-align:right;
	width:30px;
	height: 25px;
}

#dateSearch{
	background: gray;
	text-align: center;
	width:50px;
	height: 20px;
	border: 0px;
}
</style>
<script type="text/javascript">
	function getRow(rowValue) {
		var rowIndex = rowValue.rowIndex;
		return rowIndex;
	}
	$(document).ready(function() {
		
		var result = <%=request.getAttribute("result") %>
			if(result!=null){
				if(result){
					alert('입력 성공');
				}else{
					alert('입력 실패');
				}
			}
		$('.row').on('click', function() {
			var ridx=getRow(this);
			var id=$('.row:eq('+(ridx-1)+')>td:eq(0)').text();
			var java=$('.row:eq('+(ridx-1)+')>td:eq(1)').text();
			var web=$('.row:eq('+(ridx-1)+')>td:eq(2)').text();
			var fw=$('.row:eq('+(ridx-1)+')>td:eq(3)').text();
			
			location.href="EditGrade.do?id="+id+"&java="+java+"&web="+web+"&fw="+fw;
		});
		
		$( "#datepicker" ).datepicker({
			/* 
			달력 UI 편집
			*/
			showOn: "button", // 버튼을 캘린더에 표시함
			changeYear: true, //년도 변경 가능
			changeMonth: true, //월 변경 가능
			prevText: '이전달',
			nextText: '다음달',  
			currentText: '오늘',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],  
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],  
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],  
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],   
	        yearSuffix: '년',  
			buttonImage: "../imgs/calendar.png", //달력 표시 버튼 이미지 경로
			buttonImageOnly: true, // 버튼에 있는 이미지만 표시
			buttonText: "Select date",
			dateFormat:"yymmdd", //날짜 출력 포맷 20160501
		 });
	});
</script>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp"%>
		<%@ include file="../template/nav.jsp"%>

	<%
		ArrayList<UserData> stulist = (ArrayList<UserData>)request.getAttribute("stulist"); 
		ArrayList<UserData> tealist = (ArrayList<UserData>)request.getAttribute("tealist");
		
	%>

		<!-- content start -->
		<%
			JSONObject jsonObject1 = new JSONObject();

			jsonObject1 = (JSONObject) session.getAttribute("jsonObj");

			if (jsonObject1 != null) {
				if (jsonObject1.getString("pm").equals("관리자")) {
		%>
		<div class="grid9 content"> 
			<p>EDUCATION<br/><h4>LIST</h4></p>
			<hr />
			<br />
			<div id="css_tabs">
				<input id="tab3" type="radio" name="tab" checked="checked" /> 
				<input id="tab1" type="radio" name="tab" />
				<input id="tab2" type="radio" name="tab" /> 
				<label for="tab3">학생</label>
				<label for="tab1">출결</label>
				<label for="tab2">성적</label>
				<div class="tab3_content"> <!-- 학생리스트(코멘트) -->
					<div class="table">
						<table>
							<tr>
								<td>이름</td>
								<td>휴대폰번호</td>
								<td>이메일</td>
								<td>강의실</td>
								</tr>
								<%
								for (int i = 0; i < stulist.size(); i++) {
							%>
							<tr id="row" style="cursor: hand;"
							onclick="location.href='../user/stuDetail.jsp'"	>
								<td><%=stulist.get(i).getName()%></td>
					
								<td><%=stulist.get(i).getMobile()%></td>
						
								<td><%=stulist.get(i).getEmail()%></td>

								<td><%=stulist.get(i).getClasss() %></td>
								</tr>
							<%
								}
							%>	
							</table>
					</div>
				</div>

				<div class="tab1_content"> <!-- 출결관리 -->
					<div class="table">
						<form action="datesearch.do" method="get"> 
						<table>
							<tr>
								<td>이름</td>
								<td>휴대폰번호</td>
								<!-- <td>이메일</td> -->
								<td>강의실</td>
								<td><input type="text" id="datepicker" value="" name="dateSearch"/>
									<button type="submit">검색</button>
								</td>
							</tr>
						</form>	
							<% for(int i=0; i<stulist.size();i++){ %> 
							<tr>
								<td><%=stulist.get(i).getName()%></td>
								<td><%=stulist.get(i).getMobile()%></td>
								<%-- <td><%=stulist.get(i).getEmail()%></td> --%>
								<td><%=stulist.get(i).getClasss() %></td>
								<td>
									<select>
										<option value="0" selected="selected">출석</option>
										<option value="1">지각</option>
										<option value="2">조퇴</option>
										<option value="3">결석</option>
									</select>
								</td>
							</tr>
							<%}%>							
						</table>
					</div>
						<button type="submit" class="yes"><a href="attendadd.do">출석 입력</a></button>
<!-- 						</form> -->
				</div>
				<div class="tab2_content"> <!-- 성적관리 -->
				<form action="../gangsa/AddGrade.jsp">
					<div class="table">
						<table>
						<tr>
							<td>아이디</td>
							<td>자바</td>
							<td>웹</td>
							<td>프레임워크</td>
						</tr>
							<%
							ArrayList<GreadeData> list = (ArrayList<GreadeData>)request.getAttribute("list");
							for (int i = 0; i < list.size(); i++) {
							%>
							<tr class="row" style="cursor: hand;"><!--  onclick="location.href='EditGrade.do'"> -->
<!-- 							onclick="location.href='../student/EditGrade.jsp'"> 클릭 이벤트 jquery로 뺌-->

							<td><%=list.get(i).getId()%></td>
							<td><%=list.get(i).getJava()%></td>
							<td><%=list.get(i).getWeb()%></td>
							<td><%=list.get(i).getFw()%></td>
							</tr>
							<%}%>
					</table>
				</div>
				<button type="submit" class="yes">성적 입력</button>
			</form>
		</div>
			</div>
		</div>
	   <%
			}
			} else {
		%>
		<div align="center">

			<script language="javascript">
				$(document).ready(function auth(){
				alert("권한이 없습니다.");
				document.location.href = "../main.jsp";
			});
			</script>
		</div>
		<%
			}
		%>
		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>