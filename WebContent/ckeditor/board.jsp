<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 등록</title>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#btnBack').click(function(){
                window.location.href = "/board/boardList.html";
            });
        });
    </script>
<script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../js/menuLoad.js"></script>
<link rel="stylesheet" type="text/css" href="../css/grid_design12.css"/>
<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
</head>
<body>
	<div class="container_12">
		<%@ include file="../template/header.jsp" %>
		<%@ include file="../template/nav.jsp" %>
		
		<!-- content start -->
		
		<div class="grid9">
		<form action="/board/boardAddProc.html" method="post" id="doardAddForm" name="doardAddForm">
    <ul>
        <li>제    목 : <input type="text" id="title" name="title" /></li>
        <li>이    름 : <input type="text" id="name" name="name" /></li>
        <li>비밀번호 : <input type="password" id="password" name="password" /></li>
        <li style="width: 900px;">내    용 :
            <textarea cols="80" id="contents" name="contents" rows="10"></textarea>
            <script type="text/javascript">
                CKEDITOR.replace( 'contents' );
            </script>
        
        </li>
    </ul>
    <ul>
        <li>
            <input type="reset" name="reset" id="resetbtn" value="Reset">
            <input type="submit" name="submit" id="submitbtn" value="Submit this!">
            <input type="button" name="btnBack" id="btnBack" value="back">
        </li>
    </ul>
    </form>
		</div>
		
		<!-- content end -->
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>