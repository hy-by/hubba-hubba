<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* footer */
#footer_container {
	background-color:rgb(74,188,184);
	height:20%;
	margin-top:10%;
}
.icons {
	width:15%;
	margin-top:25%;
	margin-right:3%;
}
.icons:hover {
	transform: scale(1.3);
	-webkit-transform: scale(1.3);
	-moz-transform: scale(1.3);
	-ms-transform: scale(1.3);
	-o-transform: scale(1.3);	
	cursor:pointer;	
}
#bottom_title {
	font-size:2rem;
	font-weight:bold;
	color:white;
	text-shadow: 4px 4px 2px #089ba8;
}
#bottom_title:hover {
	text-shadow: 4px 4px 2px #30807d;
	cursor:pointer;
}

#introduce_hubba {
	margin-top:10%;
	margin-bottom:10%;
}


</style>
</head>
<body>
	<!-- footer -->
	<div class="container-fluid navbar-fixed-bottom" id="footer_container">
		<div class="row" id="footer_row">
			<div class="col-2" id="box1"></div>
			<div class="col-3" id="box2">
				<div id="introduce_hubba">
					<h3 id="bottom_title" onclick="location.href='${pageContext.request.contextPath}/main'"><i>hubba-hubba</i></h3>
					<p style="color:white; font-size:medium; margin-top:4%;"><i>식당, 카페, 서점, 백화점등 <br/>일상에 필요한 모든 정보를 검색하세요. </i></p>
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