<%@page import="bean.BoardData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의게시판 detail_comment</title>
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
      float: right;
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
<script type="text/javascript">
   $(function(){
      //제일 하단에 있는 depth1의 댓글을 다는 이벤트
       $("#commentParentSubmit").click(function( event ) {
    	   var pName="";
    	   <%
   		JSONObject re = (JSONObject) session.getAttribute("jsonObj");
   		if (re != null){ 
   			if (re.getString("result").equals("success")){%>
   				pName="<%=re.getString("name")%>";
   				<%
   			}
   		}
   		%>
      //로그인한 후 id 가져와 추가하기
         var pText = $("#commentParentText"); 
         if($.trim(pText.val())==""){
	            alert("내용을 입력하세요.");
	            pText.focus();
	            return;
         }
         
         var commentParentText = '<tr id="r1" name="commentParentCode">'+'<td colspan=2>'+ '<strong>'+pName+'</strong>' +
                           '| <a style="cursor:pointer; color:firebrick;" name="pDel">삭제</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+'</td>'+'</tr>';
         
         //댓글테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 새로운 tr을 붙인다.
         if($('#commentTable').contents().size()==0){
            $('#commentTable').append(commentParentText);
         }else{
            $('#commentTable tr:last').after(commentParentText);
         }
         $("#commentParentText").val("");
      });
      
      //답글 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
      $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
         if($(this).attr("name")=="pDel"){
            if (confirm("정말 삭제하시겠습니까?") == true){    //확인
                 var delComment = $(this).parent().parent();
               var nextTr = delComment.next();
               var delTr;
               delComment.remove();
            }else{   //취소
               return;
            }
         }else if($(this).attr("name")=="cDel"){
            if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                  $(this).parent().parent().remove();
            }else{   //취소
                return;
            }
         }
      });
   
      $( "#list" ).click(function( event ) { //목록으로
         location.href='../customer/board.do';
      });
      $( "#modify" ).click(function( event ) { //수정하기
          location.href='#'/* /community/modify/board/${community.id} */;
      });
      $( "#delete" ).click(function( event ) { //삭제하기
         location.href='#'/* /community/delete//${community.id} */;
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
	BoardData dto = (BoardData)request.getAttribute("boardDto");
%>
   <div class="row grid9 content">
      <p id="ptitle">BOARD<h4>게시글 보기</h4></p>
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
                  <td><%=dto.getDate() %></td>
               </tr>
               <tr>  
                  <td>글쓴이</td>
                  <td><%=dto.getName() %><span id="clickconents">조회 :  <%=dto.getCount() %></span></td>
               </tr>
               <tr>  
                  <td colspan="2"><p><%=dto.getContent() %></p></td>
               </tr>
            </tbody>
         </table>
         
         <table class="table table-condensed">
            <thead>
               <tr>
                  <td>
                     <span id="btnlayout">
                        <button type="button" id="list" class="btn btn-default">목록</button>
                        <button type="button" id="modify" class="btn btn-default">수정</button>
                        <button type="button" id="delete" class="btn btn-default">삭제</button>
                     </span>
                  </td>
               </tr>
            </thead>
         </table> 
            
         <table id="commentTable" class="table table-condensed"></table>
         <table class="table table-condensed commenttext ">
            <tr>
               <td>
                  <span class="form-inline" role="form">
                  <p>
                     <textarea id="commentParentText" placeholder="내용" class="form-control col-lg-12" rows="4"></textarea>
                     <div class="form-group">
                        <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn commentbtn btn-default">등록</button>
                     </div>
                  </p>
                 
                  </span>
               </td>
            </tr>
         </table>      
      </div>
   </div>
   <!-- content end -->
   <%@ include file="../template/asideIn.jsp"%>
   <%@ include file="../template/footer.jsp"%>
</div>    
</body>
</html>