<%@page import="bean.BoardComm"%>
<%@page import="bean.BoardData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   		width:800px;
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
       margin-top: 10px;
      margin-left: 600px;
      float: right;
   }
    .table-condensed{
   	width:800px;
   }
</style>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css" />
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
<script type="text/javascript">
<%
	JSONObject re = (JSONObject) session.getAttribute("jsonObj");
	ArrayList<BoardComm> commList = (ArrayList<BoardComm>)request.getAttribute("boardCommDto");
%>

function Convert(str){//혹시나 태그로 댓글 쓸까봐 그거 차단하는 함수
 str = str.replace(/</g,"&lt;");
 str = str.replace(/>/g,"&gt;");
 str = str.replace(/\"/g,"&quot;");
 str = str.replace(/\'/g,"&#39;");
 str = str.replace(/\n/g,"<br />");
 return str;
}
var addComm = function(name, comm, pk_num){//댓글추가 하는 함수
	var pName=name;
	var pText = Convert(comm);
	var commentParentText = '<tr id="r1" name="commentParentCode">'+'<td colspan=2>'
					+ '<input type="hidden" name="num" value="'+pk_num+'"/>' 
					+'<strong>'+pName+'</strong>'+
                    '| <a style="cursor:pointer; color:firebrick;" name="pDel">삭제</a><p>'+pText+'</p>'+'</td>'+'</tr>';
  
    //댓글테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 새로운 tr을 붙인다.
    if($('#commentTable').contents().size()==0){
    	$('#commentTable').append(commentParentText);
    }else{
    	$('#commentTable tr:last').after(commentParentText);
    }
  $("#commentParentText").val("");
};

   $(function(){
      //제일 하단에 있는 depth1의 댓글을 다는 이벤트
       $("#coform").on('submit',function( event ) {
    	   //유효성 검사 통과하면 return true
    	   var cname="";
    	   <%if (re != null){ 
    			if (re.getString("result").equals("success")){%>
    				cname="<%=re.getString("name")%>";
    		  <%}else{%>
    				alert('로그인이 필요한 시스템입니다.');
    				return false;
    				<%}
    		}else{%>
    			alert('로그인이 필요한 시스템입니다.');
				return false;
    		<%}%>
    		var comn=$('#commentParentText');
    	  	if($.trim(comn.val())==""){
    	  		alert("내용을 입력하세요.");
    	  		comn.focus();
    	  		return false;
    	  		}
    		
    	  	return true;
//     		var comment = $("#commentParentText").val(); 
//     		addComm(cname, comment);
      });
      
      //답글 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
      $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
         if($(this).attr("name")=="pDel"){
            if (confirm("정말 삭제하시겠습니까?") == true){    //확인
//                var delComment = $(this).parent().parent();
//                var nextTr = delComment.next();
//                var delTr;
//                delComment.remove();
				var comNum=$(this).siblings('input').val();//클릭 했을때 hidden으로 넣어둔 댓글 고유 번호 뽑아냄
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
   
      $( "#list" ).click(function(event) { //목록으로
         location.href='../customer/board.do';
      });
      $( "#modify" ).click(function(event) { //수정하기
         location.href='../customer/boardedit.do?index='+<%=request.getParameter("index")%>; 
      });
      $( "#del" ).click(function(event) { //삭제하기
         location.href='../customer/boarddel.do?index='+<%= request.getParameter("index") %>; 
      });
   });
   $(document).ready(function(){
	   <%//불러온 댓글 목록 가져다 붙임
	   	if(commList !=null){
	   		for(int i= 0;i<commList.size();i++){
	   		%>
	   		/* addComm('id','comment','댓글 pk')호출 */
	   			addComm('<%=commList.get(i).getId()%>','<%=commList.get(i).getContent()%>', <%=commList.get(i).getNum()%>);
	   		<%}
	   	}
	   %>
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
                  <th colspan="3" id="boardtitle"><%=dto.getTitle() %></th>
               </tr>
            </thead>
            <tbody>  
               <tr>
                  <td>작성일</td>
                  <td colspan="2"><%=dto.getDate() %></td>
               </tr>
               <tr>  
                  <td>글쓴이</td>
                  <td colspan="2"><%=dto.getName() %><span id="clickconents">조회 :  <%=dto.getCount() %></span></td>
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
                     <%
		            	JSONObject jsonObject = new JSONObject();
						jsonObject = (JSONObject) session.getAttribute("jsonObj");
						if (jsonObject != null) {
		                     if (jsonObject.getString("pm").equals("관리자")|jsonObject.getString("pm").equals("신청자")|jsonObject.getString("pm").equals("교육부")
		                    	|jsonObject.getString("pm").equals("영업부")|jsonObject.getString("pm").equals("행정부")|jsonObject.getString("pm").equals("학생")
		                    	|jsonObject.getString("pm").equals("일반")) {
		               %>
		           	    <button type="button" id="list" class="btn btn-default">목록</button>
                        <a href='../customer/boardedit.do?index=<%=request.getParameter("index")%>'>
                        	<button type="button" id="modify" class="btn btn-default">수정</button></a>
                        <button type="button" id="del" class="btn btn-default">삭제</button>
		               <%
		                	}
		                }
		               %>
                     </span>
                  </td>
               </tr>
            </thead>
         </table> 
         <form action="boardcoadd.do" method="post" id="coform">
         <table id="commentTable" class="table table-condensed"></table>
         <table class="table table-condensed commenttext ">
            <tr>
               <td>
                  <span class="form-inline" role="form">
                  <p>
                  <!-- hiden- id,idx_fk(글번호) -->
                  <!-- 내용 전달. id가 널(로그인x) 일때 편히 처리하려고 jstl씀 -->
                  <input type="hidden" name="id" value="<c:out value="${sessionScope.jsonObj.id}"/> "/>
                  <input type="hidden" name="idx_fk" value="${param.index }"/>
                  <textarea id="commentParentText" name="comment" placeholder="내용" class="form-control col-lg-12" rows="4"></textarea>
                  <div class="form-group">
                  <button type="submit" id="commentParentSubmit" name="commentParentSubmit" class="btn commentbtn btn-default">등록</button>
                  </div>
                  </p>
                 
                  </span>
               </td>
            </tr>
         </table>      
         </form>
      </div>
   </div>
   <!-- content end -->
   <%@ include file="../template/asideIn.jsp"%>
   <%@ include file="../template/footer.jsp"%>
</div>    
</body>
</html>