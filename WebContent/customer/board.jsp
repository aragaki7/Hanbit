<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board</title>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
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
      background:-o-linear-gradient(bottom, #4c4c4c 5%, #000000 100%);   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4c4c4c), color-stop(1, #000000) );
      background:-moz-linear-gradient( center top, #4c4c4c 5%, #000000 100% );
      filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#4c4c4c", endColorstr="#000000");   background: -o-linear-gradient(top,#4c4c4c,000000);
   
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
   .page{
         text-align:center;
         margin-top:13px;
         margin-left:-95px;
      }       
    .page a {
              text-decoration: none;
              color:black;
       }       
   .yes{
   margin-top: 40px;
   width: 105px;
   height: 30px;
   margin-left: 690px;
   font-size: 11pt;
   font-weight: bold;
   color: white;
   background-color: firebrick;
   border: none;   
}
   input[type=text]{
   border-color:black;
   height: 20px;
}
   input[type=submit]{
   margin-bottom:10pt;
   width: 55px;
   height: 23px;
   font-size: 8pt;
   font-weight: bold;
   color: white;
   background-color:black;
   border: none;   
}
   #keyword{
   width:55pt;
   height:17pt;
   font-size:11pt;
   border-color:black;
}
#write{
   position:relative; 
   height:30px;
   margin-top:-50px;
}
#gumsackjang{
   text-align:center;
   margin-left:-95px;
   margin-top:30px;
}
 #e{
 	background-color: firebrick;
 }
</style>
</head>
<body>
   <div class="container_12">
      <%@ include file="../template/header.jsp" %>
      <%@ include file="../template/nav.jsp" %>
      
      <!-- content start -->
      
      <div class="grid9">
         <!--  게시판 내용 시작-->
      <p>BOARD<h4>문의게시판</h4></p>
         <hr/><br/>
         <div class="table">
          <table>
          <tr>
             <td>index</td>
              <td>아이디</td>
              <td>제목</td>
              <td>내용</td>
              <td>날짜</td>
              <td>시간</td>
              <td>조회 수</td>
          </tr>
          
         
          <tr id="row" style="cursor:hand;" onclick="location.href='#'">
               <td>index</td>
              <td>ID</td> <!--아이디-->
              <td>제목</td>
              <td><a href="boardDetail.jsp">내용</a></td>
              <td>2011.11.15</td> <!--날짜-->
              <td>10:26</td><!--시간-->
              <td>0000</td> <!--조회 수-->
          </tr>
                      
          </table>
              </div>        
         <div class="page">
              <a href="#">◀</a>   
              <a href="#">[1]</a>
              <a href="#">[2]</a>      
              <a href="#">[3]</a>
              <a href="#">[4]</a>
              <a href="#">[5]</a>
              <a href="#">▶</a>
          </div>
          <div id="gumsackjang">
         <div id="write"><a href="../ckeditor/board.jsp">
         <input type="button" value="글쓰기" class="yes"></a>
         </div>
            <form action="#">
               <select id="keyword">
                  <option value="title">제목</option>
                  <option value="content" >내용</option>
                  <option value="name" >글쓴이</option>
               </select>
               <input type="text" name="search">
               <input type="submit" value="검색">
            </form>
         </div>
         
         <!--  게시판 내용 끝 --> 
      </div>
      
      <!-- content end -->
      <%@ include file="../template/asideIn.jsp" %>
      <%@ include file="../template/footer.jsp" %>
   </div>
</body>
</html>