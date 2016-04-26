<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">

.out {
	font-size: 12px;
	color: red;
}

.login {
	font-size: 12px;
}

.header {
	height: 100px;
}

.log {
	margin-right: 0px;
}
.img{
	margin-left: 480px;
}
#hh{
	font-size:12pt;
	margin-left:140px;
	margin-top:65px;
}
#hh a{
	text-decoration: none;
	color:gray;
}
</style>

<div class="grid9 header">
	<a href="<%=request.getContextPath()%>/main.do" class="img"><img
		src="<%=request.getContextPath()%>/imgs/logo.jpg" alt="logo" /></a>
</div>
	<div class="grid3 header"><div id="hh">
    <a href="#" >개인정보</a>
	<a href="#" >/ 로그아웃</a></div>
	</div>

