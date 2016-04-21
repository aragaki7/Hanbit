	$(document).ready(function(){
		$(".login>button").click(function(){
			var arr =[];
			$(".login>input").each(function(idx, item){
				arr[idx]=$(item).val();
			});
			$.ajax({
				"url":"/mvc04/login/ajaxlogin.naver",
				"data":{"num":arr[0],"name":arr[1]},
				"method":"POST",
				"dataType":"json", //json
				"success":function(data){
					/*$(".grid4").html(data); //html*/
					/*
					var name =$(data).find("name").text();//xml
					var result = $(data).find("result").text();
					var st = "<div>"+name+"님 환영합니다.</div>";
					st+= "<div><a href=\"/mvc04/login/logout.naver\"><span>logout</span></a></div>";
					$(".grid4").html(st);
					*/
					var obj = JSON.parse(data);
					if(obj.result){
						var st = "<div>"+obj.name+"님 환영합니다.</div>";
						st+= "<div><a href=\"/mvc04/login/logout.naver\"><span>logout</span></a></div>";
						$(".grid4").html(st);
					}
				},
				"error":function(){
					alert("error");					
				}
			});
		});
	});