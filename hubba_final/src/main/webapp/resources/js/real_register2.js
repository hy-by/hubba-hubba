	function check_blank() {
		theForm = document.emailCode;
		if (theForm.email_certify.value == "") {
			alert("인증번호를 입력하세요")
			return false;
		}
		return true;
	}