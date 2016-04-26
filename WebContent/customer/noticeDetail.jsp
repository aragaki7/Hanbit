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
<script type="text/javascript">
   $(function(){
      //제일 하단에 있는 depth1의 댓글을 다는 이벤트
       $("#commentParentSubmit").click(function( event ) {
      //ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
         var pName = $("#commentParentName");
         var pPassword = $("#commentParentPassword");//패스워드를 노출 시켰는데 저장하고 나서 저장한 날짜를 보여줄 예정
         var pText = $("#commentParentText");
         
         if($.trim(pName.val())==""){
            alert("이름을 입력하세요.");
            pName.focus();
            return;
         }else if($.trim(pPassword.val())==""){
            alert("패스워드를 입력하세요.");
            pPassword.focus();
            return;
         }else if($.trim(pText.val())==""){
            alert("내용을 입력하세요.");
             pText.focus();
            return;
          }
         
         var commentParentText = '<tr id="r1" name="commentParentCode">'+'<td colspan=2>'+
                           '<strong>'+pName.val()+'</strong> '+pPassword.val()+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer; color:firebrick;" name="pDel">삭제</a><p>'
                           +pText.val().replace(/\n/g, "<br>")+'</p>'+'</td>'+'</tr>';
         
         //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
         if($('#commentTable').contents().size()==0){
            $('#commentTable').append(commentParentText);
         }else{
            $('#commentTable tr:last').after(commentParentText);
         }
         $("#commentParentName").val("");
         $("#commentParentPassword").val("");
         $("#commentParentText").val("");
      });
      
      //댓글의 댓글을 다는 이벤트
      $(document).on("click","#commentChildSubmit", function(){
         var cName = $("#commentChildName");
         var cPassword = $("#commentChildPassword");
         var cText = $("#commentChildText");
                                   
         if($.trim(cName.val())==""){
            alert("이름을 입력하세요.");
            cName.focus();
            return;
         }else if($.trim(cPassword.val())==""){
             alert("패스워드를 입력하세요.");
            cPassword.focus();
            return;
         }else if($.trim(cText.val())==""){
            alert("내용을 입력하세요.");
            cText.focus();
            return;
         }
         
         var commentChildText = '<tr name="commentChildCode">'+
                           '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                           '<td style="width:99%">'+'<strong>└ '+cName.val()+'</strong> '+cPassword.val()+
                           '<a style="cursor:pointer; " name="cAdd">답글</a> | <a style="cursor:pointer; color:firebrick" name="cDel">삭제</a>'+
                                    '<p>'+cText.val().replace(/\n/g, "<br>")+'</p>'+'</td>'+'</tr>';
                                                           
         //앞의 tr노드 찾기
         var prevTr = $(this).parent().parent().parent().parent().prev();
         //댓글 적는 에디터 삭제
         $("#commentEditor").remove();//여기에서 삭제를 해줘야 에디터tr을 안 찾는다.
                                   
         //댓글을 타고 올라가며 부모 tr을 찾음
         while(prevTr.attr("name")!="commentParentCode"){
            prevTr = prevTr.prev();
         }
         //while를 타는지 체크
         var check = false;
         //다음 노드가 댓글(depth1)의 댓글인지 찾기위해 next
         var nextTr = prevTr.next();
         //뒤에 댓글(depth1)의 댓글(depth2_1)이 없다면 바로 붙인다.
         if(nextTr.attr("name")!="commentChildCode"){
            prevTr.after(commentChildText);
         }else{
         //댓글(depth1)의 댓글(depth2_n)이 있는경우 마지막까지 찾는다.
            while(nextTr.attr("name")=="commentChildCode"){
               nextTr = nextTr.next();
               check = true;
            }
         }

         if(check){//댓글(depth1)의 댓글(depth2_n)이 있다면 그 댓글(depth2_n) 뒤에 댓글(depth2_n+1) 추가
            nextTr = nextTr.prev();//while문에서 검색하느라 next로 넘거갔던거 다시 앞으로 돌려줌
            nextTr.after(commentChildText);
         }
      });
                               
      //답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
      $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
         if($(this).attr("name")=="pDel"){
            if (confirm("답글을 삭제 하시면 밑에 답글도 모두 삭제 됩니다. 정말 삭제하시겠습니까?") == true){    //확인
                 var delComment = $(this).parent().parent();
               var nextTr = delComment.next();
               var delTr;
               //댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
               while(nextTr.attr("name")=="commentCode"){
                  nextTr = nextTr.next();
                  delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
                  delTr.remove();
               }
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
         }else{
            //자기 부모의 tr을 알아낸다.
            var parentElement = $(this).parent().parent();
            //댓글달기 창을 없앤다.
            $("#commentEditor").remove();
            //부모의 하단에 댓글달기 창을 삽입
               var commentEditor = '<tr id="commentEditor">'+'<td style="width:1%"> </td>'+'<td>'+
                           '<span class="form-inline" role="form">'+'<p>'+'<div class="form-group">'+
                           '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">'+
                           '</div>'+'<div class="form-group">'+' <input type="password" id="commentChildPassword" name="commentChildPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">'+
                                    '</div>'+'<div class="form-group">'+'<button type="button" id="commentChildSubmit" class="commentbtn btn btn-default">등록</button>'+
                                    '</div>'+'</p>'+'<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4"></textarea>'+
                                    '</span>'+'</td>'+'</tr>';
            parentElement.after(commentEditor); 
         }
      });
   
      $( "#list" ).click(function( event ) {
         location.href='../../customer/notice.do';
      });
      $( "#modify" ).click(function( event ) {
          location.href='/community/modify/notice/${community.id}';
      });
      $( "#delete" ).click(function( event ) {
         location.href='/community/delete/notice/${community.id}';
      });
      $( "#write" ).click(function( event ) {
         location.href='/community/notice/edit';
      });
   });
</script>
</head>
<body>
   <!-- 좌우측의 공간 확보 -->
   <div class="container_12">
   <%@ include file="../template/header.jsp"%>
   <%@ include file="../template/nav.jsp"%>
      
   <!-- content start -->

   <div class="row grid9 content">
      <p id="ptitle">CUSTOMER CENTER<h4>공지사항</h4></p>
      <hr/><br/>
      <div class="col-md-10">
         <table class="table table-condensed tablemain">
            <thead>
               <tr align="center">
                  <th colspan="2" id="boardtitle">공지사항 제목 입니다.</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>작성일</td>
                  <td>2014-12-15 04:45:23</td>
               </tr>
               <tr>
                  <td>글쓴이</td>
                  <td>husk<span id="clickconents">조회 : 0</span></td>
               </tr>
               <tr>
                  <td colspan="2"><p>이름, 패스워드 내용을 적으시고 확인버튼을 누르세요.</p></td>
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
                     <div class="form-group">
                        <input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10"/>
                     </div>
                     <div class="form-group">
                        <input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10"/>
                     </div>
                     <div class="form-group">
                        <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn commentbtn btn-default">등록</button>
                            </div>
                  </p>
                  <textarea id="commentParentText" placeholder="내용" class="form-control col-lg-12" rows="4"></textarea>
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