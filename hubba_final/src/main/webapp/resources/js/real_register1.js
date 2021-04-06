	function check_blank() {
		theForm = document.emailForm;
		var re ="";
		if (theForm.email.value == ""){
			alert("이메일을 입력하세요")
			return false;
		} else {
			
			var regularEmail = /^[0-9a-zA-Z]([-_\.0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			//aa_aa_@naver.com
			var email = document.getElementById("email");
			if(regularEmail.test(email.value)){
				$.ajax({
					type : "POST",
					url : "checkEmail",
					datatype : "json",
					data : {"email" : $('#email').val()},
					async: false,
					success : function(data) { //data = checkId에서 넘겨준 결과값
						if ($.trim(data) == "YES") {
							re = true;
						} else {
							alert("이미 사용중인 이메일 입니다");
							$('#email').val('');
							re = false;
						}
					}
				})
			}else{
				alert("이메일 형식을 지켜주세요");
				$('#email').val('');
				return false;
			}	
		}
		return re;
	}
	

