<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value="/resources/css/header1.css"/>" type="text/css"/>
	<link href="https://fonts.googleapis.com/css2?family=Courgette&family=Nanum+Gothic&display=swap" rel="stylesheet">
	<script src="<c:url value="/resources/js/header1.js"/>"></script>

<script type="text/javascript">
$(document).ready(function(e){
   $('#logout').click(function() {
	   alert("로그아웃 되었습니다");
      location.href="logout";
   });
   $('#editUser').click(function(e){
      var db_name = "<%=request.getAttribute("nameCompare")%>";
      if(db_name=="sns_login"){
         alert("소셜 로그인 회원은 정보 수정이 불가합니다");
      }else{
         location.href="editUser";
      }
      
   });
   $('#myReview').click(function(e){
      location.href="myReview";
   });
   $('#myBookmark').click(function(e){
      location.href="myBookmark";
   });
   $('#addPlace').click(function(e){
	      location.href="addPlace";
	});
});
</script>
</head>
<body>


<!-- 메인사진, 로그인, 검색 -->
<div class="container-fluid" id="first_container">
   <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner row" >
         <div class="carousel-item active">
            <img id="main_img" src="<c:url value="/resources/img/header1/mainImg3.jpg"/>"/>
         </div>
         <div class="carousel-item">
            <img id="main_img" src="<c:url value="/resources/img/header1/mainImg5.jpg"/>"/>
         </div>
         <div class="carousel-item">
            <img id="main_img" src="<c:url value="/resources/img/header1/mainImg1.jpg"/>"/>
         </div>
         
         <div class="col-2"></div>
         <div class="col-8" id="header_col_center" >
            <!-- title test -->
            <div class="row">
               <div class="col-3"></div>
               <div class="col-6" style="margin-top:17%;">
                    <div class="menu__item">
                        <a href="#" class="menu__link">
                            <div class="menu__title" style="text-align:center;" onclick="location.href='${pageContext.request.contextPath}/main';">
                                <span class="menu__first-word" data-hover="hubba" style="font-size:10vh;">
                                    <b>hubba</b>
                                </span><br/>
                                <span class="menu__second-word" data-hover="hubba" style="font-size:10vh; color:rgb(74,188,184);">
                                    <b>hubba</b>
                                </span>
                            </div>
                        </a>
                    </div>
               </div>
               <div class="col-3"></div>
            </div> <!-- row end -->        
	<!-- title test end -->
<!-- 
<h1 style="border:2px solid skyblue;" id="logo" onclick="location.href='${pageContext.request.contextPath}/main'"><b>hubba<br/>hubba</b></h1>
 -->
		<!-- searchBar -->
		<jsp:include page="searchbarInMain.jsp" flush="false"></jsp:include>


 
         </div>
         <div class="col-2">

            <div id="menu_toggle">
               <a id="toggle"><span></span></a>
            
            <div id="menu" style="position:absolute; margin-top:33%;">
              <ul>
                 <li>
                 
                 <div class="box" style="background: #BDBDBD;">
                  <c:choose>
                     <c:when test="${nameCompare eq 'sns_login'}">
                        <img class="profile" src="${profile_img}">
                     </c:when>
                     <c:otherwise>
                        <img class="profile" src="resources/img/${profile_img }">
                     </c:otherwise>
                  </c:choose>
               </div>
                 
                 </li>
                <li><a id="editUser">${name} 님</a></li>
                <li><a id="myReview">Review</a></li>
                <li><a id="myBookmark">Bookmark</a></li>
                <li><a id="addPlace">add Place</a>
                <li><a id="logout">Logout</a></li>
              </ul>
            </div>
            </div> 
               
         </div>



      
      </div>
   
      
      <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
         <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span>
         <span class="sr-only">Next</span>
      </a>
      

   </div>
</div>   
<script>
$('#search_left').focus(function(){
   $('#search_left').css('border-bottom','5px solid rgb(74,188,184)');
   $('#search_left').css('color','rgb(74,188,184)');
   $('#search_left').css('font-weight','bold');
});

$('#search_left').blur(function(){
      $('#search_left').css('border-bottom','5px solid white');
      $('#search_left').css('color','white');
      $('#search_left').css('font-weight','bold');
});

$('#search_right').focus(function(){
   $('#search_right').css('border-bottom','5px solid rgb(74,188,184)');
   $('#search_right').css('color','rgb(74,188,184)');
   $('#search_right').css('font-weight','bold');
});

$('#search_right').blur(function(){
      $('#search_right').css('border-bottom','5px solid white');
      $('#search_right').css('color','white');
      $('#search_right').css('font-weight','bold');
});
   
//토글!!!!
   var theToggle = document.getElementById('toggle');
   
   //based on Todd Motto functions
   //https://toddmotto.com/labs/reusable-js/
   
   //hasClass
   function hasClass(elem, className) {
      return new RegExp(' ' + className + ' ').test(' ' + elem.className + ' ');
   }
   //addClass
   function addClass(elem, className) {
    if (!hasClass(elem, className)) {
       elem.className += ' ' + className;
    }
   }
   //removeClass
   function removeClass(elem, className) {
      var newClass = ' ' + elem.className.replace( /[\t\r\n]/g, ' ') + ' ';
      if (hasClass(elem, className)) {
        while (newClass.indexOf(' ' + className + ' ') >= 0 ) {
            newClass = newClass.replace(' ' + className + ' ', ' ');
        }
        elem.className = newClass.replace(/^\s+|\s+$/g, '');
    }
   }
   //toggleClass
   function toggleClass(elem, className) {
      var newClass = ' ' + elem.className.replace( /[\t\r\n]/g, " " ) + ' ';
    if (hasClass(elem, className)) {
        while (newClass.indexOf(" " + className + " ") >= 0 ) {
            newClass = newClass.replace( " " + className + " " , " " );
        }
        elem.className = newClass.replace(/^\s+|\s+$/g, '');
    } else {
        elem.className += ' ' + className;
    }
   }
   
   theToggle.onclick = function() {

      var db_name = "<%=request.getAttribute("nameCompare")%>";
      //alert(db_name);
      if(db_name=="null"){
         location.href="login?";
      }else{
         toggleClass(this, 'on');
         return false;      
      }
   
   }
   </script>
</body>
</html>