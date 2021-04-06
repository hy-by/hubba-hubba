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
   <link rel="stylesheet" href="<c:url value="/resources/css/registration2.css"/>" type="text/css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>   
   <script src="<c:url value="/resources/js/registration2.js"/>"></script>
   

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
      <div class="col-3"></div>
      <div class="col-6" id="regstration_wrap">
      
         <div id="registration_form">
            <form action="afterRegister" method="post">
   
               <input type="text" name="id" id="id" placeholder="input your ID" class="registration_input"/><br/>
               <div class="check_registration" id="id_check"></div>
               <input type="text" name="name" id="name" placeholder="input your name" class="registration_input"/><br/>
               <div class="check_registration"  id="name_check"></div>                        
               <input type="password" name="pw" id="pw" placeholder="input your PW" class="registration_input"/><br/>
               <div class="check_registration"  id="pw_check"></div>                     
               <input type="password" id="pw2" name="pw2" placeholder="check your PW again" class="registration_input"/><br/>
               <div class="check_registration"  id="pw2_check"></div>      
               <div id="email" name="email" readonly><p> 이메일 주소 / ${email}</p></div>   
               <!-- <input type="text" id="email" name="email" value="${email}"  readonly/><br/> -->
               <hr/><br/>
               <button type="submit" class="btn btn-outline-secondary btn-block" id="registration_button">가입하기</button>
               <div id="bottom_col">
                  <p>do you have a ID?
                  <a href="${pageContext.request.contextPath}/login">go Login</a></p>
               </div>                                          
            </form>
         </div>
      
      
      </div>
      <div class="col-3"></div>   
   </div>

</div>


<!-- 푸터 -->
<div>
   <%@include file = "footer2.jsp" %>
</div>

<script>
$(document).ready(function(){ 
   $('#registration_button').click(function() { 
      var result = alert('가입 완료! 로그인페이지로 이동합니다.'); 
      }); 
   });
</script>

</body>
</html>