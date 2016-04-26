	$(document).ready(function(){
		$(".login>button").click(function(){
			var arr =[];
			$(".login>input").each(function(idx, item){
				arr[idx]=$(item).val();
			});
			$.ajax({
				"url":"/Hanbit/login.do",
				"data":{"id":arr[0],"pw":arr[1]},
				"method":"POST",
//				"datatype":"json",
				"success":function(data){
					var obj = JSON.parse(data);
					if(obj.result=='success'){
						alert(obj.result);
						var st = "";
						st+= "<div style=\"margin-left:10px;\" id=\"form\"><div class=\"login\"><div style=\"font-size: 15px;\"><h3>"+obj.id+"님 환영합니다.</h3></div>"
							+"<div><a href=\"/Hanbit/logout.do\"><span>logout</span></a><a href=\"/Hanbit/login/edituser.jsp\"><span>회원정보수정</span></a>"
							+"</div></div></div>";
						$(".login").html(st);
						$('#log').remove()
					}else{
						alert(obj.result);
						alert('아이디 비번 확인');
					}
				},
				"error":function(){
					alert("error");					
				}
			});
		});
	});