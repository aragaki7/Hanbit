<%@page import="bean.UserDataGrade"%>
<%@page import="bean.UserData"%>
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
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
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
	height: 30px;
	margin-left: 660px;
	font-size: 11pt;
	font-weight: bold;
	color: white;  
	background-color: firebrick;
	border: none;
}

#e {
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
.hid{
	display: none;
}

#attSearchBtn{
	background-color: black;
	color:white;
	width:40px;
	height: 20px;
	border: 0px;
}
.endBtn{
	position: relative;
	left : 350px;
	top : 50px;
	
 	padding: 15px;
	font-size: 11pt;
	font-weight: bold;
	color: white;  
	background-color: firebrick;
	border: none;
}


</style>
<script type="text/javascript">
<%
		JSONObject jsonObject1 = new JSONObject();
		jsonObject1 = (JSONObject) session.getAttribute("jsonObj");
// 		String admin = jsonObject1.getString("pm");
		if (jsonObject1 != null) {%>
			var pm = "<%=jsonObject1.getString("pm")%>";
			if (!("관리자" == pm || "교육부"==pm)) {
				alert('권한이 부족합니다.');
				location.href="/Hanbit/main.do";
			}else{
				//권한이 맞음
			}
<%		}else{%>
			alert('권한이 부족합니다.');
			location.href="/Hanbit/main.do";
<%}%>
	<%
	String dateEdit = request.getParameter("dateSearch");
	ArrayList<UserData> dateSearch = (ArrayList<UserData>)request.getAttribute("dateSearch");
	int attNum = 0;
	for(int i=0; i<dateSearch.size(); i++){
		attNum = dateSearch.get(i).getAtt();	
	}
	
	%>
	function getRow(rowValue) {
		var rowIndex = rowValue.rowIndex;
		return rowIndex;
	}
	$(document).ready(function() {
		$('.rbtn').show();
		// css_tab input(우리현재 메뉴탭) 을 클릭했을때 이벤트 발생
		$("#css_tabs input").click(function () {
			//클릭한 input(메뉴탭)의 index 번호를 가져와 쿠키에 저장함. expires : 쿠키 저장기간
		  $.cookie("gangsaIndex", $(this).index(), { expires:1 });
// 			alert( $(this).index());
		});
		
		//쿠키에 index 값이 있다면
		 if($.cookie("gangsaIndex")) {
			 gangsaIndex = $.cookie("gangsaIndex"); // index 는 쿠키에서 index를 받아와서 초기화하고 
			 $("#css_tabs input:eq("+gangsaIndex+")").attr('checked','checked'); //해당 탭을 선택한다.
		 } 
		
		var result = <%=request.getAttribute("result") %>
			if(result!=null){
				if(result){
					alert('입력 성공');
				}else{
					alert('입력 실패');
				}
			}
		$('.graderow').on('click', function() {
			var ridx=getRow(this);
			var id=$('.graderow:eq('+(ridx-1)+')>td:eq(0)').text();
			location.href="egradeser.do?id="+id;
			});
		
		$('.stuListRow').on('click', function(event) {
			if (event.target.type == 'checkbox') return;
			var ridx=getRow(this);
			var id=$('.stuListRow:eq('+(ridx-1)+')>td:eq(0)').text();
			location.href="studetail.do?id="+id;
		});
		$(".chkAll").click(function(){
	        //클릭되었으면
	        if($(".chkAll").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=chkId]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chkId]").prop("checked",false);
	        }
	    })

		$('.attendListRow').on('click', function(){
			var ridx=getRow(this);
			var id=$('.attendListRow:eq('+(ridx-1)+')>td:eq(0)').text();
			var name=$('.attendListRow:eq('+(ridx-1)+')>td:eq(1)').text();
			var mobile=$('.attendListRow:eq('+(ridx-1)+')>td:eq(2)').text();
			
			location.href="attenddetail.do?id="+id+"&name="+name+"&mobile="+mobile+"&attNum="+<%=attNum%>+"&attDate="+<%=dateEdit%>;
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
// 		ArrayList<UserData> stulist = (ArrayList<UserData>)request.getAttribute("stulist"); 
		ArrayList<UserDataGrade> stulist = (ArrayList<UserDataGrade>)request.getAttribute("stulist"); 
	%>

		<!-- content start -->
		<%
			jsonObject1 = (JSONObject) session.getAttribute("jsonObj");
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
								<td class="rarea"><input type="checkbox" class="chkAll rbtn"/></td>
								<td>이름</td>
								<td>휴대폰번호</td>
								<td>이메일</td>
								<td>강의실</td>
								</tr>
								<form action="delstulist.do" method="post">
								<%
								String tmp ="없음";
								String loginclass = jsonObject1.getString("classs");
						
								if("2".equals(loginclass))
									tmp = "1강의장";
								else if("3".equals(loginclass))
									tmp = "2강의장";
								if("4".equals(loginclass))
									tmp = "3강의장";
								
								for (int i = 0; i < stulist.size(); i++) {
// 										System.out.println(stulist.get(i).getClasss());
									if(jsonObject1.getString("pm").equals("관리자")){
									}else if(!(stulist.get(i).getClasss().equals(tmp)))
										continue;
								%>
							<tr class="stuListRow" style="cursor: hand;">
<%-- 								<input type="hidden" readonly="readonly" name="id" value="<%=stulist.get(i).getId()%>"/> --%>
								<td class="hid"><%=stulist.get(i).getId()%></td>
								<td class="rarea"><input type="checkbox" name="chkId" class="rbtn"value="<%=stulist.get(i).getId()%>"/></td>
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
							<button class="endBtn" type="submit">수강 종료</button>
							</form>
				</div>

				<div class="tab1_content"> <!-- 출결관리 -->
			<%-- 	<%
					ArrayList<UserData> dateSearch = (ArrayList<UserData>)request.getAttribute("dateSearch");
				 %> --%>
					<div class="table">
						<form action="gangsa.do" method="get"> 
						<table>
							<tr>
								<td>이름</td>
								<td>휴대폰번호</td>
								<!-- <td>이메일</td> -->
								<td>강의실</td>
								<td><input type="text" id="datepicker" value="" name="dateSearch"/>
									<button type="submit" id="attSearchBtn">검색</button>
								</td>
							</tr>
						</form>	
							<% for(int i=0; i<dateSearch.size();i++){ 
								if(jsonObject1.getString("pm").equals("관리자")){
								}else if(!(stulist.get(i).getClasss().equals(tmp)))
										continue; %>
							<tr class="attendListRow">
						<%-- 	<%
								int attNum = dateSearch.get(i).getAtt();
							 %> --%>
							 	<td class="hid"><%=dateSearch.get(i).getId()%></td>
							 	<%
							 		int attNumm = dateSearch.get(i).getAtt();
							 	%>
								<td><%=dateSearch.get(i).getName()%></td>
								<td><%=dateSearch.get(i).getMobile()%></td>
								<td><%=dateSearch.get(i).getClasss() %></td>
								<td>
									<select>
										<option value="0" <%=(attNumm==0) ? "selected":"" %>>출석</option>
										<option value="1" <%=(attNumm==1) ? "selected":"" %>>지각</option>
										<option value="2" <%=(attNumm==2) ? "selected":"" %>>조퇴</option>
										<option value="3" <%=(attNumm==3) ? "selected":"" %>>결석</option>
									</select>
								</td>
							</tr>
							<%}%>							
						</table>
					</div>
						<a href="attendadd.do"><button type="submit" class="yes">출석 입력</button></a>
<!-- 						</form> -->
				</div>
				<div class="tab2_content"> <!-- 성적관리 -->
				<form action="../gangsa/AddGrade.jsp">
					<div class="table">
						<table>
						<tr>
							<td class="hid">아이디</td>
							<td>이름</td>
							<td>강의장</td>
							<td>총 점</td>
							<td>평 균</td>
						</tr>
							<%
// 							ArrayList<GreadeData> list = (ArrayList<GreadeData>)request.getAttribute("list");
							for (int i = 0; i < stulist.size(); i++) {
								if(jsonObject1.getString("pm").equals("관리자")){
								}else if(!(stulist.get(i).getClasss().equals(tmp)))
									continue; 
// 							int sum =stulist.get(i).getJava()+stulist.get(i).getWeb()+stulist.get(i).getFw();
// 							int avg = sum/3;
							%>
							<tr class="graderow" style="cursor: hand;"><!--  onclick="location.href='EditGrade.do'"> -->
<!-- 							onclick="location.href='../student/EditGrade.jsp'"> 클릭 이벤트 jquery로 뺌-->

							<td class="hid"><%=stulist.get(i).getId()%></td>
							<td><%=stulist.get(i).getName()%></td>
							<td><%=stulist.get(i).getClasss()%></td>
							<td><%=stulist.get(i).getSum() %></td>
							<td><%=stulist.get(i).getSum()/3%>
							<%-- <%
							int sum = stulist.get(i).getJava()+stulist.get(i).getWeb()+stulist.get(i).getFw();
							int avg = sum/3;
							%>
							<td><%=sum %></td>
							<td><%=avg %></td> --%>
							</tr>
							<%}%>
					</table>
				</div>
			</form>
		</div>
			</div>
		</div>
	   <%
			
		%>
		<div align="center">
		
		</div>
		<%
			
		%>
		<!-- content end -->
		<%@ include file="../template/asideIn.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	</div>
</body>
</html>