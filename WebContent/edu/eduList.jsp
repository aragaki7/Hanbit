<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정소개</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
<!-- 과정소개(edprocess)css 시작 -->
<style type="text/css">
/* 겹치는부분시작 */
*{
    margin: 0px;
    padding: 0px;
}

table {
   width: 50px;
}

.size{
   width: 300px;
   height: 200px;
}

#aa{
   display: block;
   text-decoration: none;
   font-weight:bold;
   font-size:13pt;
   color:#4C4C4C;
}

.yes{
   margin-top: 40px;
   width: 110px;
   height: 30px;
   margin-left: 690px;
   font-size: 11pt;
   font-weight: bold;
   color: white;
   background-color: firebrick;
   border: none;   
}

.submitbtn{ 
   position: relative; 
    left: -70px; 
   top: -8px; 
    height: 30px;
}

.detailbtn{ 
    position: relative;
    left: -197px; 
   top: -78px; 
    height: 30px; 
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
    

 /* 겹치는부분시작 */
 /* 겹치지않는부분시작 */

#tab{
  margin:-40px;
  width:778px;
  height:100px;
}
#tab tr td {
   border-bottom: 1px solid lightgray;
   font-size:15px;
   font-family:Arial;
   font-weight:normal;
}
    #b{
    background-color: firebrick;
    }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.submitbtn').on('click',function(){
			<%
			JSONObject loginsuc = new JSONObject();
			loginsuc = (JSONObject) session.getAttribute("jsonObj");
			%>
			<%if (loginsuc == null) {%>
				alert('로그인이 필요한 시스템입니다.');
				location.href="/Hanbit/main.do";
				return false;
			<%}else{%>
				var re = "<%=loginsuc.getString("result")%>";
				if ("success" != re) {
					alert('로그인이 필요한 시스템입니다.');
					location.href="/Hanbit/main.do";
					return false;
				}
			<%}%>
			
		});
	});
</script>
</head>
<body>
   <div class="container_12">
      <%@ include file="../template/header.jsp" %>
      <%@ include file="../template/nav.jsp" %>
      <!-- content start -->
      <!-- 과정소개 페이지 시작 -->
<br/><div class="grid9 content" >
<p>
   REGULAR CURRICULUM<br/>
   <h4>정규교육과정</h4>
</p>
<hr/><br/><br/><br/>
   <table id="tab">
      <tr>
         <th rowspan="4">
            <img class="size" src="../imgs/javaLogo.PNG"/>
         </th>
         <td>
            <a href="eduJava.jsp" id="aa">
               교육과정 : 자바 프로그래밍</a>
         </td>
      </tr>
      <tr>
         <td>교육장소 : 한빛신촌교육센터</td>
      </tr>
      <tr>
         <td>교육기간 : 2016.05.01 ~ 2016.05.31</td>
      </tr>
      <tr>
         <td>모집인원 : 20명</td>
      </tr>
      <tr>
       </tr>
   </table>
   <br/>
<!--             <div> -->
               <a href="eduApply.jsp"><input type="button" value="신청하기" class="yes submitbtn"/></a>
<!--             </div> -->
<!--              <div class="detailbtn"> -->
                <a href="eduJava.jsp"><input type="button" value="상세보기" class="yes detailbtn"/></a>
<!--              </div> -->
   <table id="tab"> 
      <tr>
         <th rowspan="4">
            <img class="size" src="../imgs/AndroidLogo.png"/>
         </th>
         <td>
            <a href="eduAndroid.jsp" id="aa">
            교육과정 : 안드로이드 프로그래밍</a>
         </td>
      </tr>
      <tr>
         <td>교육장소 : 한빛신촌교육센터</td>
      </tr>
      <tr>
         <td>교육기간 : 2016.05.01 ~ 2016.05.31</td>
      </tr>
      <tr>
         <td>모집인원 : 20명</td>
      </tr>
   </table>
      <br/>
      
<!--          <div class="submitbtn"> -->
             <a href="eduApply.jsp"><input type="button" value="신청하기"  class="yes submitbtn"/></a>
<!--              </div> -->
<!--              <div class="detailbtn"> -->
             <a href="eduAndroid.jsp"><input type="button" value="상세보기" class="yes detailbtn"/></a>
<!--              </div> -->
      
   <table id="tab">
      <tr><th rowspan="4"><img class="size" src="../imgs/jspLogo.png"/></th>
         <td><a href="eduJsp.jsp" id="aa">교육과정 : JSP 프로그래밍</a></td></tr>
      <tr><td>교육장소 : 한빛신촌교육센터</td></tr>
      <tr><td>교육기간 : 2016.05.01 ~ 2016.05.31</td></tr>
      <tr><td>모집인원 : 20명</td></tr>
   </table>
      <br/>
                  
<!--       <div  class="submitbtn"> -->
                     <a href="eduApply.jsp"><input type="button" value="신청하기" class="yes submitbtn"/></a>
<!--                      </div> -->
<!--                    <div class="detailbtn"> -->
                   <a href="eduJsp.jsp"><input type="button" value="상세보기" class="yes detailbtn"/></a>
<!--                    </div> -->
</div>
<!-- 과정소개 첫 페이지 끝 -->
      <!-- content end -->   
      <%@ include file="../template/asideIn.jsp" %>
</div>
      <%@ include file="../template/footer.jsp" %>
</body>
</html>