<%@page import="data.Dday"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style type="text/css">
   	button{
   		margin-top: -35px;
   		height: 80px;
   		width:93px;
   		background-color: white;
   		color:black;
   		border: 1px solid black;
   		position: absolute;
   	}
   	input{
   		margin-top: 10px;
   		width:50%;
   		height:31px;
   		position: relative;
   	}
   	#log{
   		font-size: 10pt; 		
   	}
   	#form{
   		width:400px;
   		background-color: #F6F6F6;
   	}
   	#dday{
   		border: 1px solid black;
   		width:100%;
   		font-size: 20px;
   		font-family: "a피오피동글";
   		text-align: center;
   	}
   </style>
<div class="grid3 aside">
	<%
			Boolean re = (Boolean)session.getAttribute("login");	
			if(re != null){
				if(re){
			%>
				<div class="out"><%= session.getAttribute("id")%><span>님 환영합니다.</span></div>		
				<div><a href="/mvc04/login/logout.naver"><span>logout</span></a></div>		
			<%	} else{%>
					<div><a href="/mvc04/login/login.naver"><span>login</span>페이지</a></div>	
					<div id="form">
					<div class="login">
					<input type="text" id="id" name="id" maxlength="41" title="아이디" accesskey="L" placeholder="아이디" >
                    <input type="password" id="pw" name="pw" maxlength="16" title="비밀번호" placeholder="비밀번호">
					<button>로그인</button>
				</div>	
					<a href="/mvc04/login/login.naver"  id="log"><span>회원가입</span></a>
					</div>
			<%	   }
			}else{
			%>
			<div id="form">
				<div class="login">
					<input type="text" id="id" name="id" maxlength="41" title="아이디" accesskey="L" placeholder="아이디" >
                    <input type="password" id="pw" name="pw" maxlength="16" title="비밀번호" placeholder="비밀번호" >
					<button>로그인</button>
				</div>
					<a href="/mvc04/login/login.naver"  id="log"><span>회원가입</span></a>
					</div>
			<%  } %>
			
			<!-- d-day값 불러오기 -->
			<div id="dday">
			<%
				Dday day = new Dday();
				out.print("D-DAY " + day.getDays());
			%>
			</div>
</div>
<div class="clear"></div>