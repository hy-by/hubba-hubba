<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sign In</title>
   <link rel="shortcut icon" href="resources/img/real_favi.ico">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script>

	//id 정규화 / 중복체크
	$(function() {
		$('#id').blur(function() {

			var regularId = /^[a-zA-Z0-9]{5,12}$/;
			var id = document.getElementById("id");
			
			if(regularId.test(id.value)){//정규화 체크
				$.ajax({
					type : "POST",
					url : "checkId",
					datatype : "json",
					data : {"id" : $('#id').val()},
					success : function(data) { //data = checkId에서 넘겨준 결과값
						if ($.trim(data) == "YES") {
							if ($('#id').val() != '') {
								$("#id_check").text("사용가능한 아이디입니다.");
								$("#id_check").css("color","blue");
							}
						} else {
							if ($('#id').val() != '') {
								$("#id_check").text("중복된 아이디입니다.");
								$("#id_check").css("color","red");
								$('#id').val('');
								//$('#id').focus();
							}
						}
					}
				})
			}else{
				$("#id_check").text("아이디는 5~12자의 영문 대소문자와 숫자로만 입력");
				$("#id_check").css("color","red");
				$('#id').val('');
				//$('#id').focus();
			}
			
		})
	});

	//password 정규화
	$(function() {
		$("#pw").blur(function() {
			var regularPw =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$/;
			var pw = document.getElementById("pw");
			if(regularPw.test(pw.value)){
				$("#pw_check").text("비밀번호가 안전합니다");
				$("#pw_check").css("color","blue");
			}else{
				$("#pw_check").text("비밀번호는 6~20자의 영문 대소문자와 숫자, 하나 이상의 특수문자로 입력");
				$("#pw_check").css("color","red");
				$('#pw').val('');
				//$('#pw').focus();
			}	
		})
	});

	//password 확인
	$(function() {
		$('#pw2').blur(function() {
			if($('#pw').val() != ''){
				if ($('#pw').val() == $('#pw2').val()) {
					$("#pw2_check").text("비밀번호 확인");
					$("#pw2_check").css("color","blue");
				}else{
					$("#pw2_check").text("비밀번호가 일치하지 않습니다");
					$("#pw2_check").css("color","red");
					$('#pw2').val('');
				}
			}
		})
	});
	
	//Name 정규화
	$(function() {
		$("#name").blur(function() {
			var regularName = /^[가-힣]{2,4}$/;
			var name = document.getElementById("name");
			if(regularName.test(name.value)){
				$("#name_check").text("이름 확인");
				$("#name_check").css("color","blue");
			}else{
				$("#name_check").text("이름을 제대로 입력하세요");
				$("#name_check").css("color","red");
				$('#name').val('');
				//$('#name').focus();
			}
		})
	});	
</script>

</head>

<!-- 회원가입 페이지 test -->
<!-- id, pw, name, email -->
<body style="font-family: 'MapoPeacefull';">
<div class="container" style="width:60%; margin-top:40px;">
  <form action="afterRegister" method="post">
  
  	<!-- Id -->
    <div class="form-group">
      <label for="id">Id:</label>
      <input type="text" class="form-control" id="id" name="id">
      <div id="id_check" style="font-size: 11px; margin-top: 4px;"></div>
    </div>
    
    <!-- Password -->
    <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password" class="form-control" id="pw" name="pw">
      <div id="pw_check" style="font-size: 11px; margin-top: 4px;"></div>
    </div>
    <div class="form-group">
      <label for="pw2">Check:</label>
      <input type="password" class="form-control" id="pw2" name="pw2">
      <div id="pw2_check" style="font-size: 11px; margin-top: 4px;"></div>
    </div>
    
    <!-- Name -->
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" name="name">
      <div id="name_check" style="font-size: 11px; margin-top: 4px;"></div>
    </div>
    
    <!-- Email -->
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="email" value="${email }" readonly>
    </div>

    <button type="submit" class="btn btn-outline-secondary">확인</button>

  </form>
</div>
</body>
</html>