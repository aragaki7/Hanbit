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
	Object.prototype.isNumeric = function(){
	      var value = String(this);
	      if(value.indexOf(" ") != -1 || value == "") return false;
	      else if(isNaN(value)) return false;
	      else return true;
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
		
		$('input[type="password"]:eq(0)').on('keyup',function(){
			var pw1 = $('input[type="password"]:eq(0)');
			
			
			//조건1. 6~12 영문 대소문자
			//조건2. 최소 1개의 숫자 혹은 특수 문자를 포함해야 함
			var re_pw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,12}$/;
			
			if(!(pw1.val().length>5 && pw1.val().length<13)){
				$('.chkpw1').css('color','red');
				$('.chkpw1').text("6˜12 이내의 영문/숫자조합");
				flag=false;
				return;
			}
			
			if(re_pw.test(pw1.val())){
				$('.chkpw1').css('color','blue');
				$('.chkpw1').text("사용 가능합니다.");
				flag=true;
				return;
			}else{
				$('.chkpw1').css('color','red');
				$('.chkpw1').text("6˜12 이내의 영문/숫자조합");
				flag=false;
				return;
			}
		});//비밀번호 정규식1 검사 끝
		$('#pwcheck').on('keyup',function(){
			var pw1 = $('input[type="password"]:eq(0)');
			var pw2 = $('input[type="password"]:eq(1)');
			
			
			
			if(!(pw1.val()==pw2.val())){
				$('.chkpw2').css('color','red');
				$('.chkpw2').text("비밀번호가 같지 않습니다.");
				flag=false;
				return;
			}else{
				$('.chkpw2').css('color','blue');
				$('.chkpw2').text("사용 가능합니다.");
				flag=true;
				return;
			}
			
		});//비밀번호 유효성검사 2 끝
		
		
		
	});//ready 끝