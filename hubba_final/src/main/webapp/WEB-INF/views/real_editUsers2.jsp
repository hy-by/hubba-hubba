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
  <link rel="stylesheet" href="<c:url value="/resources/css/real_editUsers2.css"/>" type="text/css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script>
//password 정규화
   $(function() {
      $("#pw").blur(function() {
         var regularPw =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$/;
         var pw = document.getElementById("pw");
         if(regularPw.test(pw.value)){
            $("#pw_check").text("비밀번호가 안전합니다");
            $("#pw_check").css("color","blue");
         }else{
            $("#pw_check").text("6~20자의 영문 대소문자와 숫자, 하나 이상의 특수문자로 입력");
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
/*
   function check_login() {

      var update_id = document.getElementById("id");
      var update_pw = document.getElementById("pw");
      var update_name = document.getElementById("name");
      var update_email = document.getElementById("email");


      document.loginform.id.value = document.loginform.id.value.trim();
      if (document.loginform.pw.value == '') {
         alert("비밀번호를 입력하세요");
         return false;
      }
      if (document.loginform.pw2.value == '') {
         alert("비밀번호를 확인하세요");
         return false;
      }
      if (document.loginform.name.value == '') {
         alert("이름을 입력하세요");
         return false;
      }

      alert(
            "수정한 정보입니다.\n"
            + "\n 아이디 : " + document.getElementById("id").value 
            + "\n 비밀번호 : " + document.getElementById("pw").value 
            + "\n 이름 : " + document.getElementById("name").value 
            + "\n 이메일 : " + document.getElementById("email").value
            );
      //alert("1:"+document.getElementById("id").value); 직접불러옴
      //alert("2:"+document.loginform.id.value);  name- loginform에 있는 name-id값을 불러옴 

      return true;
   }

   */

function check_login(){
   alert("정보가 수정되었습니다.");
   }
         
   
  </script>
  <style>
   .box {
       width: 130px;
       height: 130px; 
       border-radius: 70%;
       overflow: hidden;
   }
   .profile {
       width: 100%;
       height: 100%;
       object-fit: cover;
   }
   .profile:hover {
       opacity:0.6;
    }
}
   </style>
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
   <<div class="row row-cols-5">
      <div class="col"></div>
      <div class="col"></div>
      <div class="col">
         <form action="fileupload" method="post" enctype="multipart/form-data" accept-charset="UTF-8" id="form_wrap" name="loginform">
            <div class="form-group">
               <input type="file" name="upload" id="upload" style="display: none;"/>
               <div class="box" style="background: #BDBDBD; margin:0 auto 0 auto;">
                  <img id="profile" class="profile" src="resources/img/${profile_img}" border="0" onclick='document.all.upload.click();'>
               </div>
            </div>
                     
            <!--  Id -->
            <div class="form-group">
               <input type="text" class="form-control" id="id" name="id" value="${id }" placeholder="id" readonly>
            </div>
            <!-- Password -->
            <div class="form-group">
               <input type="password" class="form-control" id="pw" name="pw" placeholder="password">
               <div id="pw_check" style="font-size: 11px; margin-top: 4px;"></div>
            </div>
            <div class="form-group">
            <input type="password" class="form-control" id="pw2" name="pw2" placeholder="password-check">
            <div id="pw2_check" style="font-size: 11px; margin-top: 4px;"></div>
            </div>
            
            <!-- Name -->
            <div class="form-group">
            <input type="text" class="form-control" id="name" name="name" placeholder="name">
            <div id="name_check" style="font-size: 11px; margin-top: 4px;"></div>
            </div>
            
            <!-- Email -->
            <div class="form-group">
            <input type="email" class="form-control" id="email" name="email" value="${email }" placeholder="email" readonly>
            </div>
            
            <button type="submit" class="btn btn-outline-secondary btn-block" 
               onclick = "return check_login();">수정하기</button>      
         </form>
      
      </div>
      <div class="col"></div>
      <div class="col"></div>
   </div>

</div>




<div class="container" style="margin-top: 65px; width: 35%">

</div>

<!-- 푸터 -->
<div>
   <%@include file = "footer2.jsp" %>
</div>
</body>

<script>
    var upload = document.querySelector('#upload');
 
     /* FileReader 객체 생성 */
    var reader = new FileReader();
 
        /* reader 시작시 함수 구현 */
    reader.onload = (function () {
 
        this.image = document.createElement('img');
        this.image.className ='profile';


        var vm = this;
        
        return function (e) {
            /* base64 인코딩 된 스트링 데이터 */
            vm.image.src = e.target.result
            $("#profile").attr("src", e.target.result);
        }
    })()
 
    upload.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        if(get_file){
            reader.readAsDataURL(get_file[0]);
        }
       
    })
    
</script>

</html>