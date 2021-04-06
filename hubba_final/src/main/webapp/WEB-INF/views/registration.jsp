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
   <link rel="stylesheet" href="<c:url value="/resources/css/registration.css"/>" type="text/css"/>
   <script>
   function go_register(){
      location.href="real_register";
      }
   </script>
</head>
<body style="font-family: 'MapoPeacefull';">

<div class="container-fluid" id="registration_container">
   <div class="row">
      <div class="col-3"></div>
      <div class="col-6" id="logo_col">
         <h1 id="title" onclick="location.href='${pageContext.request.contextPath}/main'"><i>hubba<br/>hubba</i></h1>
      </div>
      <div class="col-3"></div>
   </div>
   
   
   
   <div class="row" id="registration_row">
      <div class="col-4"></div>
      <div class="col-4">
         <div id="registration_form">
            <div id="googlelogo_wrap" onclick="location.href='${google_url}'">
               <img class="logo_icon" src="<c:url value="/resources/img/registration/google_logo.png"/>" alt="" onclick=""/>
               <p id="google_ptag">continue with Google</p>
            </div>
            <div id="kakaologo_wrap" onclick="location.href='${kakao_url}'">
               <img class="logo_icon" src="<c:url value="/resources/img/registration/kakao_logo.png"/>" alt="" onclick=""/>
               <p id="kakao_ptag">continue with Kakao</p>
            </div>
            <div id="naverlogo_wrap" onclick="location.href='${naver_url}'">
               <img class="logo_icon" src="<c:url value="/resources/img/registration/naver_logo.png"/>" alt="" onclick=""/>
               <p id="naver_ptag">continue with Naver</p>
            </div>      
            <div id="normallogo_wrap" onclick="go_register();" >
               <img class="logo_icon" src="<c:url value="/resources/img/registration/hubba_logo.png"/>" 
                  alt="" />
               <p id="hubba_ptag">normal registration</p>
            </div>               
         </div>
      </div>
      <div class="col-4"></div>
   </div>
   <div class="row">
      <div class="col">
         <div id="bottom_col">
            <p>do you have a ID?
            <a href="${pageContext.request.contextPath}/login">go Login</a></p>
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