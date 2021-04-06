<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hubba hubba :: footer</title>
	<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
	crossorigin="anonymous"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/footer.css"/>" type="text/css"/>
	


</head>
<body>

<div class="container-fluid" id="footer_container">
	<div class="row" id="footer_row">
		<div class="col-2" id="box1"></div>
		<div class="col-3" id="box2">
			<div id="introduce_hubba">
				<h3  id="bottom_title" onclick="location.href='${pageContext.request.contextPath}/main'"><i>hubba-hubba</i></h3>
				<p>-</p>
				<p><i>식당, 카페, 서점, 백화점등 <br/>일상에 필요한 모든 정보를 검색하세요. </i></p>
			</div>
		</div>
		<div class="col-3" id="box3"></div>
		<div class="col-2" id="box4">
			<div id="icons_wrap">
				<img class="icons" src="<c:url value="/resources/img/footer/icons_facebook.png"/>" alt="" onclick=""/>
				<img class="icons" src="<c:url value="/resources/img/footer/icons_instagram.png"/>" alt="" onclick=""/>
				<img class="icons" src="<c:url value="/resources/img/footer/icons_youtube.png"/>" alt="" onclick=""/>
				<img class="icons" src="<c:url value="/resources/img/footer/icons_twitter.png"/>" alt="" onclick=""/>
			</div>
		</div>
		<div class="col-2" id="box5"></div>
	</div>
</div>

</body>
</html>