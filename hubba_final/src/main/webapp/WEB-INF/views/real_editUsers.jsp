<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
  <title>Edit User</title>
     <link rel="shortcut icon" href="resources/img/real_favi.ico">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value="/resources/css/real_editUsers.css"/>" type="text/css"/>  
  <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap" rel="stylesheet">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
   <div class="row row-cols-5" id="update_row">
      <div class="col"></div>
      <div class="col"></div>
      <div class="col" id="update_col">
         <h3>정보 수정</h3>
         <form action="checkUserPw" method="post">
            <div class="form-group">
               <input type="text" class="form-control" id="id" name="id" value="${id }" placeholder="id" readonly>
               <input type="password" class="form-control" id="pw" name="pw" placeholder="password">
            </div>
            <button type="submit" class="btn btn-secondary btn-block">확인</button>
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