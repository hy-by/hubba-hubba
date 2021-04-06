<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="shortcut icon" href="resources/img/real_favi.ico">

	<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
	crossorigin="anonymous"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/login.css"/>" type="text/css"/>
	<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap" rel="stylesheet">	
	<script src="<c:url value="/resources/js/login.js"/>"></script>
	   <script type="text/javascript">
	   window.history.forward();

	</script>
</head>
<body style="font-family: 'MapoPeacefull';">

<div class="container-fluid" id="login_container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6" id="logo_col">
			<h1 id="title" onclick="location.href='${pageContext.request.contextPath}/main'" ><i>hubba<br/>hubba</i></h1>
		</div>
		<div class="col-3"></div>
	</div>
	<div class="row" id="login_row">
		<div class="col-3"></div>
		<div class="col-3">
			<div id="login_form">
				<form action="login_Storage" method="post" name="loginform" id="loginform">
					<input type="text" name="id" placeholder="input your ID" class="login_input" id="id" /><br/>
					<input type="password" name="pw" placeholder="input your PW" class="login_input" id="pw"/><br/>
					<a onclick="go_findIdPw();" id="find_id"><i>ID or PW 찾기</i></a>
					<hr/>
					<input type="submit" value="Login" id="login_button" onclick = "return check_login();"/>
				</form>
				
			</div>
		</div>
		<div id="vertical_linetop"></div>
		<div class="col-3">
			<div id="login_rightform">
				<div id="googlelogo_wrap" onclick="location.href='${google_url}'">
					<img class="logo_icon" src="<c:url value="/resources/img/login/google_logo.png"/>" alt="" onclick=""/>
					<p id="google_ptag">continue with Google</p>
				</div>
				<div id="kakaologo_wrap" onclick="location.href='${kakao_url}'">
					<img class="logo_icon" src="<c:url value="/resources/img/login/kakao_logo.png"/>" alt="" onclick=""/>
					<p id="kakao_ptag">continue with Kakao</p>
				</div>
				<div id="naverlogo_wrap" onclick="location.href='${naver_url}'">
					<img class="logo_icon" src="<c:url value="/resources/img/login/naver_logo.png"/>" alt="" onclick=""/>
					<p id="naver_ptag">continue with Naver</p>
				</div>								
			</div>
		</div>
		<div class="col-3"></div>
	</div>
	<div class="row">
		<div class="col">
			<div id="bottom_col">
				<p>don't you have a ID?
				<a id="register" onclick="go_register();">create your account.</a></p>
			</div>
		</div>
	</div>
</div>


<!-- 푸터 -->
<div>
	<%@include file = "footer2.jsp" %>
</div>

</body>
</html>