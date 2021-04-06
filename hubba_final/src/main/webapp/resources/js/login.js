
	/*
$(document).ready(function(e){

	$("#register").click(function(){
		location.href="register";
	});

	$("#findIdPw").click(function(){
		location.href="findIdPw";
	});
	
});	
	*/
function go_findIdPw(){
	location.href="findIdPw";
	}
function go_register(){
	location.href="register";
	}

function check_login() {
	document.loginform.id.value = document.loginform.id.value.trim();
	if (document.loginform.id.value == '') {
		alert("id를 입력하세요");
		return false;
	}
	if (document.loginform.pw.value == '') {
		alert("비밀번호를 입력하세요");
		return false;
	}
	
	location.href="afterLogin";
	return true;
}


