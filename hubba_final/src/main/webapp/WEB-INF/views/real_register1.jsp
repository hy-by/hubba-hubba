<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
   <link rel="shortcut icon" href="resources/img/real_favi.ico">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/real_register1.css"/>" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/real_register1.js"/>"></script>

</head>
<body style="font-family: 'MapoPeacefull';">

 
 
 <div class="container-fluid" id="login_container">
   <div class="row">
      <div class="col-3"></div>
      <div class="col-6" id="logo_col">
         <h1 id="title" onclick="location.href='${pageContext.request.contextPath}/main'"><i>hubba<br/>hubba</i></h1>
      </div>
      <div class="col-3"></div>
   </div>

   <div class="row row-cols-5">
      <div class="col"></div>
      <div class="col"></div>
      <div class="col" id="email_wrap" > 
         <form action="email_certify" method="post" name="emailForm">
            <div class="form-group">
            <input type="email" class="form-control" id="email" name="email" placeholder="Email 입력">
            <div id="email_check"></div>
            </div>
            <button type="submit" class="btn btn-outline-secondary" onclick ="return check_blank();">이메일 인증하기</button>
         </form>
      </div>
      <div class="col"></div>
      <div class="col"></div>
   </div>


</div>
 
 
  <!-- 푸터 -->
<div>
   <%@include file = "footer2.jsp" %>
</div>
</body>
</html>






















