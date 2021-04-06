<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Find Id/Pw</title>
     <link rel="shortcut icon" href="resources/img/real_favi.ico">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value="/resources/css/real_afterFindIdPw.css"/>" type="text/css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="<c:url value="/resources/js/real_afterFindIdPw.js"/>"></script>

</head>
<body style="font-family: 'MapoPeacefull';">



<div class="container-fluid" id="login_container">
   <!-- hubba hubba 로고 -->
   <div class="row">
      <div class="col-3"></div>
      <div class="col-6" id="logo_col">
         <h1 id="title" onclick="location.href='${pageContext.request.contextPath}/main'" ><i>hubba<br/>hubba</i></h1>
      </div>
      <div class="col-3"></div>
   </div>
   
   <!-- id/pw 찾기 -->
   <div class="row">
      <div class="col-3"></div>
      <div class="col-6" id="idpw_wrap">
         <h3>Id/Password 찾기</h3>
         <hr class="line">
         <div id="my_id">
         <h5>${str}</h5>
         <div class="btn-group">
              <button id="login" type="button" class="btn btn-outline-secondary">로그인</button>
              <button id="register" type="button" class="btn btn-outline-secondary">회원가입</button>
              <button type="button" id="main" class="btn btn-outline-secondary">메인으로</button>
         </div>
         <hr class="line">
         </div>
      </div>
      <div class="col-3"></div>
   </div>
</div>

<!-- 푸터 -->
<div>
   <%@include file = "footer2.jsp" %>
</div>

</body>
</html>