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
				"dataType":"json",
				"success":function(data){
					if(data.result=='success'){
						alert('로그인 성공');
						var st = "<div>"+data.name+"님 환영합니다.</div>";
						st+= "<div><a href=\"/Hanbit/logout.do\"><span>logout</span></a></div>";
						$(".login").html(st);
					}else if(data.result=='fail'){
						alert('아이디 비번 확인');
					}
				},
				"error":function(){
					alert("error");					
				}
			});
		});
	});