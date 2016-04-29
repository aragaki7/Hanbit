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
					st+= "<div style=\"margin-left:10px;\" id=\"form\"><div class=\"login\"><div style=\"font-size: 15px;\"><h3>"+obj.name+"님 환영합니다.</h3></div>"
						+"</div></div>";
					$(".login").html(st);
					$('#log').remove();
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