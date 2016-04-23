<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 입력</title>
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
		
		<br/><div class="grid9 content">
			<p>GRADE ADD</p>
			<hr/><br/>
			<form action="../student/GradeList.jsp">
			<div class="table" >
                <div>아이디 * : <input type="text" name="name" disabled/>(6˜12 이내의 영문/숫자 사용가능, 여백은 사용불가)</div>
                <div>비밀번호 * : <input type="password" name="pw"/>(6˜12 이내의 영문/숫자)</div>
                <div>비밀번호확인 * : <input type="password" name="pw"/>(위에 입력한 비밀번호를 다시 입력)</div>
                <div>이름 * : <input type="text" name="name" />반드시 실명으로 입력해주세요.</div>
                <div>
                    전화번호 * : 
                    <select >
                        <option value="1"> 02</option>
                        <option value="1"> 031</option>
                        <option value="1"> 032</option>
                        <option value="1"> 033</option>
                        <option value="1"> 042</option>
                        <option value="1"> 061</option>
                        <option value="1"> 062</option>
                        <option value="1"> 063</option>
                    </select>    
                    -<input type="tel" name="tel"/>-<input type="tel" name="tel"/></div>
                <div>
                    휴대폰 * : 
                    <select >
                        <option value="1"> 010</option>
                        <option value="1"> 017</option>
                        <option value="1"> 011</option>
                        <option value="1"> 016</option>
                    </select>    
                    -<input type="tel" name="tel"/>-<input type="tel" name="tel"/></div>
                <div>
                    e-mail * :<input type="email" name"email"/> 
                    @ <select >
                        <option value="1"> 직접입력</option>
                        <option value="1"> naver.com</option>
                        <option value="1"> nate.com</option>
                        <option value="1"> daum.net</option>
                    </select>    
                    <br>이메일 수신동의 : 
                    <input type="radio" value="y" checked> 예
                    <input type="radio" value="n"> 아니오<br>

                </div>
                <div>주 소 * : <input type="text" name="addr"/></div>
              
            <p id="btn">
                <input type="submit" name="ok"/>
                <input type="reset" name="re"/>
            </p>
            </div>
            </form>
        </div>
		<!-- content end -->
		
		<%@ include file="../template/asideIn.jsp" %>
		<%@ include file="../template/footer.jsp" %>
	</div>
</body>
</html>