<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
   <link rel="shortcut icon" href="resources/img/real_favi.ico">
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap" rel="stylesheet">    
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   
<style>
body {
    margin: 0;
    font-family: 'Lato', sans-serif;
    line-height: 1.4;
      background: #f5f5f5;
    color: #526587;
    font-size: 10px;
    font-weight: 400;
}

.app {
    margin: 40px auto;
    padding: 0 20px;
    
}

.card {
    display: block;
    margin: 20px 0;
    padding: 2%;
    text-decoration: none;
    transition: transform 0.2s cubic-bezier(0.42, 0, 0.33, 1.52);
    color: #557243;
    background: white;
    box-shadow: 0 2px 1px rgba(170, 170, 170, 0.25);
    font-size: 16px;
    border-radius: 2px;
    border: 0px;
}

.card:hover {
    background: white;
    transform: scale(1.04);
}



a {
    color: #557243;
    margin-right: 16px;
}

a:hover {
    text-decoration: none;
}


#myImg {
     border-radius: 5px;
     cursor: pointer;
     transition: 0.3s;
   }
   
   #myImg:hover {opacity: 0.7;}
   
   /* The Modal (background) */
   .modal {
     display: none; /* Hidden by default */
     position: fixed; /* Stay in place */
     z-index: 1; /* Sit on top */
     padding-top: 100px; /* Location of the box */
     left: 0;
     top: 0;
     width: 100%; /* Full width */
     height: 100%; /* Full height */
     overflow: auto; /* Enable scroll if needed */
     background-color: rgb(0,0,0); /* Fallback color */
     background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
   }
   
   /* Modal Content (image) */
   .modal-content {
     margin: auto;
     display: block;
     width: 80%;
     max-width: 700px;
   }
   
   /* Caption of Modal Image */
   #caption {
     margin: auto;
     display: block;
     width: 80%;
     max-width: 700px;
     text-align: center;
     color: #ccc;
     padding: 10px 0;
     height: 150px;
   }
   
   /* Add Animation */
   .modal-content, #caption {  
     -webkit-animation-name: zoom;
     -webkit-animation-duration: 0.6s;
     animation-name: zoom;
     animation-duration: 0.6s;
   }
   
   @-webkit-keyframes zoom {
     from {-webkit-transform:scale(0)} 
     to {-webkit-transform:scale(1)}
   }
   
   @keyframes zoom {
     from {transform:scale(0)} 
     to {transform:scale(1)}
   }
   
   /* The Close Button */
   .close {
     position: absolute;
     top: 15px;
     right: 35px;
     color: #f1f1f1;
     font-size: 40px;
     font-weight: bold;
     transition: 0.3s;
   }
   
   .close:hover,
   .close:focus {
     color: #bbb;
     text-decoration: none;
     cursor: pointer;
   }
   
   /* 100% Image Width on Smaller Screens */
   @media only screen and (max-width: 700px){
     .modal-content {
       width: 100%;
     }
   }
   
   .imgModal {
     object-fit: cover;
     width: 120px;
     height: 120px;
    
   }
/* 전체  */
.container-fluid {
   padding:0px;
}   
/* header */
#header_row h1 {
   font-size:5rem;
   margin-top:5%;
   margin-bottom:5%;
   color:rgb(74,188,184);
   font-family: 'Comfortaa', cursive;
}   
#header_row h1:hover {
   cursor:pointer;
}


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


/* 헤더 로그인 토글 */
#toggle {
   position:absolute;
   z-index:99;
  display: block;
  width: 28px;
  height: 30px;
  margin-top:8%;
  margin-left:24%;
}


#toggle span:after,
#toggle span:before {
  content: "";
  position: absolute;
  left: 0;
  top: -9px;

}
#toggle span:after{
  top: 9px;
}
#toggle span {
  position: relative;
  display: block;
}

#toggle span,
#toggle span:after,
#toggle span:before {
  width: 100%;
  height: 5px;
  background-color: rgb(74,188,184);
  transition: all 0.3s;
  backface-visibility: hidden;
  border-radius: 2px;
}

/* on activation */
#toggle.on span {
  background-color: transparent;
}
#toggle.on span:before {
  transform: rotate(45deg) translate(5px, 5px);
}
#toggle.on span:after {
  transform: rotate(-45deg) translate(7px, -8px);
}
#toggle.on + #menu {
  opacity: 1;
  visibility: visible;
}

/* menu appearance*/
#menu {
   z-index:99;
  position:relative;
  color: #999;
  width: 35%;
  padding: 2%;
  margin-left:13%;
  margin: auto;
  font-family: "Segoe UI", Candara, "Bitstream Vera Sans", "DejaVu Sans", "Bitstream Vera Sans", "Trebuchet MS", Verdana, "Verdana Ref", sans-serif;
  text-align: center;
  border-radius: 4px;
  background: white;
  box-shadow: 0 1px 8px rgba(0,0,0,0.05);
  opacity: 0;
  visibility: hidden;
  transition: opacity .4s;
  margin-top:14%;
}
#menu:after {
  position: absolute;
  top: -15px;
  left: 95px;
  content: "";
  display: block;
  border-left: 15px solid transparent;
  border-right: 15px solid transparent;
  border-bottom: 20px solid white;
}
ul, li, li a {
   font-size:large;
  list-style: none;
  display: block;
  margin: 0;
  padding: 0;
}
li a {
  padding: 5px;
  color: #888;
  text-decoration: none;
  transition: all .2s;
}
li a:hover,
li a:focus {
  background: #1ABC9C;
  color: #fff;
}


/* demo styles 
body { margin-top: 3em; background: #eee; color: #555; font-family: "Open Sans", "Segoe UI", Helvetica, Arial, sans-serif; }
p, p a { font-size: 12px;text-align: center; color: #888; }
*/
#logo {
   font-family: 'Courgette', cursive;   
}
@media screen and (max-width: 768px) { 
   #search_wrap {
      text-align:center;
   }
   #search_left { 
      margin-left:5%;
      display:flex;
      width:80%;
   } 
   #search_right {
      display:left;
      width:80%;
   }   
   #search_button {
      display:left;
   }   
}
.box {
    width: 70px;
    height: 70px; 
    border-radius: 70%;
    overflow: hidden;
    margin: 5% auto 5%;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
<script type="text/javascript">
$(document).ready(function(e){
   $('#logout').click(function() {
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
<body style="font-family: 'MapoPeacefull';">
<div class="container-fluid">


   <!-- header -->
   <div class="row" id="header_row" style="text-align:center;">
      <div class="col-4"></div>
      <div class="col-4">
         <h1 onclick="location.href='${pageContext.request.contextPath}/main'">hubba<br/>hubba</h1>
      </div>
      <div class="col-4">
      
      <!-- 아이디 로그인!!! -->
            <div id="menu_toggle">
               <a id="toggle"><span></span></a>
            <div id="menu" style="position:absolute; margin-top:14%; margin-left:9%; ">
              <ul>
                 <li>
                 
                 <div class="box" style="background:#bdbdbd;">
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
            <!-- 아이디 로그인 끝!!! -->
      
      </div>
   </div>

<script>
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
      location.href="login";
   }else{
      toggleClass(this, 'on');
      return false;      
   }

}
</script>   
   
   
   
   
   
<div id="app" class="row app" style="width:100%;">
   <div class="col-2"></div>
   <div class="col-8" style="padding-left:5%; padding-right:5%;">
   <hr>
   <c:forEach var="item" items="${list}" varStatus="status">
   <a v-for="card in cards" class="card"; href="${pageContext.request.contextPath}/categoryDetail?idx=${item.business_idx}" >
     <div id="${item.idx}" href="#" class="selectDiv${status.index}" style="display:flex;">
        <div style="float: left; width: 90%; ">
           <div>
              <h3 style="font-size: 18px; color: #212529;">${item.place_name}</h3>
           </div>
           <div style="color: #A1A1A4;">
           		
              <c:forEach begin="1" end="${item.rating }">
              <img style="width: 20px;" src="resources/img/oneStar.png">
              </c:forEach>
               | ${item.date}
           </div>
           <div style="color: #A1A1A4;">
              <c:choose>
                 <c:when test="${item.images eq null}">
                    ${item.content }
                 </c:when>
                 <c:otherwise>
                    <p style="font-size: 15px; margin-bottom: 15px;">${item.content }</p>
                    <c:forTokens items="${item.images }" delims="&" var="imgSrc">
                       <img src="resources/img/${imgSrc}"  id="${imgSrc}" class="imgModal"/>
                  </c:forTokens>
                 </c:otherwise>
              </c:choose>
           </div>
           <div style="margin-top: 10px;color: #A1A1A4;">
           	<img style="width: 20px;" src="resources/img/heart_mh.png"> ${item.total_likes}
           </div>
        </div>
        <div style="float: right;">
           <button type="button" class="btn btn-secondary delBtn" id="${status.index}" >삭제</button>
        </div>
     </div>
     </a>
    </c:forEach>
    
     <!-- The Modal -->
   <div id="myModal" class="modal">
   
     <!-- The Close Button -->
     <span class="close">&times;</span>
   
     <!-- Modal Content (The Image) -->
     <img class="modal-content" id="imgModal">

   </div>
    <script>
     function refresh(){  
          location.reload();
           //$("#test").load(window.location.href + "#test");
      }

     var modal = document.getElementById("myModal");
     var span = document.getElementsByClassName("close")[0];
     span.onclick = function() { 
          modal.style.display = "none";
        }
     
     $(function () {
           $(".delBtn").click(function(){
              var i = $(this).attr("id");
              $.ajax({
               type : "POST",
               url : "deleteReview",
               datatype : "json",
               data : {"review_idx" : $(".selectDiv"+i).attr("id")},
               success : function(data) { //data = checkId에서 넘겨준 결과값
                  if ($.trim(data) == "delete") {
                    alert("삭제됨");
                    refresh();
                  }
               } 
            })
            
           })
           
          $(".imgModal").click(function(e){
            e.preventDefault();
            var imgSrc = $(this).attr("id");
            var modalImg = document.getElementById("imgModal");
            modal.style.display = "block";
             modalImg.src = "resources/img/"+imgSrc;
         })
           
     });

    </script>
   </div> <!-- my review col end  -->
   <div class="col-2"></div>
</div> <!-- my review row end -->
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

</div> <!-- container fluid end -->
</body>
</html>