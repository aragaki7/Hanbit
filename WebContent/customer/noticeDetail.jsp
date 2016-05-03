<%@page import="bean.NoticeData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 detail_comment</title>
<style>
   *{
      margin: 0px;
      padding: 0px;
    }
    #ptitle{
        text-align: left;
       display: block;
       width: 400px;
         font-size:25pt;
         font-weight:bold;
         color:black;
    }
    .col-md-10{
       width: 1100px;
    }
    .tablemain td{
      vertical-align:middle;
      background-color:white;
      border:1px solid #000000;
      border-width:0px 1px 1px 0px;
      text-align:left;
      padding:7px;
      font-size:14px;
      font-family:Arial;
      font-weight:normal;
      color:#000000;
   }
    hr{ 
         width: 800px;
       border-top:3px solid #9C9C9C; 
       border-bottom:3px solid #F6F6F6; 
        box-shadow: 5px 5px 5px lightgray;
   }
   .tablemain{
        margin:0px;
         padding:0px;
         box-shadow: 10px 10px 5px #888888;
         border:1px solid #000000;
   }
   td{
      padding: 10px;
   }
   #commentParentText{
      width:100%;
   }
   #boardtitle{
      background:-o-linear-gradient(bottom, #4c4c4c 5%, #000000 100%);   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4c4c4c), color-stop(1, #000000) );
      background:-moz-linear-gradient( center top, #4c4c4c 5%, #000000 100% );
      filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#4c4c4c", endColorstr="#000000");   background: -o-linear-gradient(top,#4c4c4c,000000);
   
      background-color:#4c4c4c;
      border:0px solid #000000;
      text-align:center;
      height:35px;
      border-width:0px 0px 1px 1px;
      font-size:17px;
      font-family:Arial;
      font-weight:bold;
      color:#ffffff;
   }
   #clickconents{
      float:right;
   }
   .form-group{
      display: inline-block;
   }
   .col-lg-2{
      width: 200px;
      height: 20px;
   }
   .commentbtn{
      height: 22px;
      background: grey;
      border: 1px grey solid;
      color: white;
   }
   .col-lg-12{
      margin-top: 5px;
   }
   #commentTable{
      background-color: #f1f1f1;
      font-size: 12px;
   }
   button{
      border: 1px solid black;
      background-color: black;
      color:white;
      width: 50px;
      height: 30px;
   }
   .commenttext{
      background-color: #f1f1f1;
   }
   #btnlayout{
      margin-top: -10px;
      margin-right: -10px;
      float: right;
   }
</style>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />

</head>
<body>
   <!-- 좌우측의 공간 확보 -->
   <div class="container_12">
   <%@ include file="../template/header.jsp"%>
   <%@ include file="../template/nav.jsp"%>
      
   <!-- content start -->
   		<%  
			NoticeData dto = (NoticeData)request.getAttribute("noticeDto");
		%>
   <div class="row grid9 content">
      <p id="ptitle">CUSTOMER CENTER<h4>공지사항</h4></p>
      <hr/><br/>
      <div class="col-md-10">
         <table class="table table-condensed tablemain">
            <thead>
               <tr align="center">
                  <th colspan="2" id="boardtitle"><%=dto.getTitle() %></th>
               </tr>
            </thead>  
            <tbody>
               <tr>
                  <td>작성일</td>
                  <td><%=dto.getData() %></td>
               </tr>
               <tr>
                  <td>글쓴이</td>
                  <td><%=dto.getId() %><span id="clickconents">조회 : <%=dto.getCount() %></span></td>
               </tr>
               <tr>
                  <td colspan="2"><%=dto.getContent() %><p>이름, 패스워드 내용을 적으시고 확인버튼을 누르세요.</p></td>
               </tr>
            </tbody>   
         </table>
         
         <table class="table table-condensed">
            <thead>
               <tr>
                  <td>
                     <span id="btnlayout">
                        <a href='../customer/notice.do'><button type="button" id="list" class="btn btn-default" >목록</button></a>
                        <a href='../customer/noticeEdit.do?idx=<%=request.getParameter("idx")%>'><button type="button" id="modify" class="btn btn-default">수정</button></a>
                        <button type="button" id="delete" class="btn btn-default">삭제</button>
                     </span>
                  </td>
               </tr>
            </thead>
         </table> 
            

      </div>
   </div>
   <!-- content end -->
   <%@ include file="../template/asideIn.jsp"%>
   <%@ include file="../template/footer.jsp"%>
</div>    
</body>
</html>