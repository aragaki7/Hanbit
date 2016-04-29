var loginfuc=function(){
	var arr =[];
	$(".login>input").each(function(idx, item){
		arr[idx]=$(item).val();
		});
		$.ajax({
			"url":"/Hanbit/login.do",
			"data":{"id":arr[0],"pw":arr[1]},
			"method":"POST",
//			"datatype":"json",
			"success":function(data){
				var obj = JSON.parse(data);
				if(obj.result=='success'){
					var st = "";
					st+= "<div style=\"margin-left:10px;\" id=\"form\"><div class=\"login\"><div style=\"font-size: 15px;\"><h3>"+obj.id+"님 환영합니다.</h3></div>"
						+"<div><a href=\"/Hanbit/logout.do\"><span>logout</span></a><a href=\"/Hanbit/useredit.do\"><span>회원정보수정</span></a>"
						+"</div></div></div>";
					$(".login").html(st);
					$('#log').remove();
					$('#hh').html("<a href=\"/Hanbit/useredit.do\" >개인정보</a><a href=\"/Hanbit/logout.do\" >/ 로그아웃</a></div>");
				}else{
					alert('아이디 비번 확인');
				}
			},
			"error":function(){
				alert("error");					
			}
		});
		};

$(document).ready(function(){
		$(".login>button").click(function(){
			loginfuc();
		});
		
		$('input[type=password]').keydown(function(e){
			if (e.keyCode == 13) {
				loginfuc();
			}
		});
	});