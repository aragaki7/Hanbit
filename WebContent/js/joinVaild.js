	var flag=false;//최종 회원가입 승인때 쓸꺼. false면 회원가입 안됨
	function login_ck(uid) {
		if (uid.val().length == 0) {
			$('.chkid').css('color','red');
			$('.chkid').text('아이디를 입력하세요');
			flag=false;
			return;
		}
		if (uid.val().length < 6 || uid.val().length > 12) {

			$('.chkid').css('color','red');
			$('.chkid').text('띄어쓰기 없는 영문 숫자조합, 6~12글자');
			flag=false;
			return;
		}
		var NO_SPECIAL = /[^a-zA-Z0-9_]/i;
		if (NO_SPECIAL.test(uid.val())) {
			$('.chkid').css('color','red');
			$('.chkid').text("ID에 특수문자 및 공백,한글사용이 불가합니다.");
			flag=false;
			return;
		}
		$('.chkid').css('color','blue');
		$('.chkid').text("사용 가능합니다.");
		flag = true;
		return;
	};
	$(document).ready(function() {
		$('#id').on('keyup', function(e) {
			var uid = $('#id');
			login_ck(uid);

			if(flag){
	 			$.ajax({
	 				"url":"/Hanbit/chkid.do",
					"data":{"id":uid.val()},
					"method":"POST",
				//	"datatype":"json",
					"success":function(data){
						var result = data;
						if(result=='true'){
							flag=true;
							$('.chkid').css('color','blue');
							$('.chkid').text("사용 가능합니다.");
						}else{
							flag=false;
							$('.chkid').css('color','red');
							$('.chkid').text("아이디가 이미 존재합니다.");
						}
					},
					"error":function(){
						alert('통신 장애');
					}
				});
			}
		});
	});