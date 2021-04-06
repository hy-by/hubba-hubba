<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookmark</title>
   <link rel="shortcut icon" href="resources/img/real_favi.ico">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
/* entypo */
[class*="entypo-"]:before {
    font-family: 'entypo', sans-serif;
}

* {
    box-sizing: border-box;
}

body {
    background: #f5f5f5;
    /* max-width: 1200px; */
    margin: 0 auto;
    font-family: 'Lato', sans-serif;
    text-shadow: 0 0 1px rgba(255, 255, 255, 0.004);
    font-size: 100%;
    font-weight: 400;
}

.toggler {
    color: #A1A1A4;
    font-size: 1.25em;
    margin-left: 8px;
    text-align: center;
    cursor: pointer;
}

.toggler.active {
    color: #000;
}

.surveys {
    list-style: none;
    margin: 0;
    padding: 0;
    margin-left:7%;
}

.survey-item {
    display: block;
    margin-top: 10px;
    padding: 20px;
    border-radius: 2px;
    background: white;
    box-shadow: 0 2px 1px rgba(170, 170, 170, 0.25);
}

.survey-name {
    font-weight: 400;
}

.list .survey-item {
    position: relative;
    padding: 0;
    font-size: 14px;
    line-height: 40px;
}

.list .survey-item .pull-right {
    position: absolute;
    right: 0;
    top: 0;
}

@media screen and (max-width: 800px) {
    .list .survey-item .stage:not(.active) {
        display: none;
    }
}

@media screen and (max-width: 700px) {
    .list .survey-item .survey-progress-bg {
        display: none;
    }
}

@media screen and (max-width: 600px) {
    .list .survey-item .pull-right {
        position: static;
        line-height: 20px;
        padding-bottom: 10px;
    }
}

.list .survey-country,
.list .survey-progress,
.list .survey-completes,
.list .survey-end-date {
    color: #A1A1A4;
}

.list .survey-country,
.list .survey-completes,
.list .survey-end-date,
.list .survey-name,
.list .survey-stage {
    margin: 0 10px;
}

.list .survey-country {
    margin-right: 0;
}

.list .survey-end-date,
.list .survey-completes,
.list .survey-country,
.list .survey-name {
    vertical-align: middle;
}

.list .survey-end-date {
    display: inline-block;
    width: 100px;
    white-space: nowrap;
    overflow: hidden;
}

.survey-stage .stage {
    display: inline-block;
    vertical-align: middle;
    width: 16px;
    height: 16px;
    overflow: hidden;
    border-radius: 50%;
    padding: 0;
    margin: 0 2px;
    background: #f2f2f2;
    text-indent: -9999px;
    color: transparent;
    line-height: 16px;
}

.survey-stage .stage.active {
    background: #A1A1A4;
}

.list .list-only {
    display: auto;
}

.list .grid-only {
    display: none !important;
}

.grid .grid-only {
    display: auto;
}

.grid .list-only {
    display: none !important;
}

.grid .survey-item {
    position: relative;
    display: inline-block;
    vertical-align: top;
    height: 200px;
    width: 22%;
    margin: 10px;
}

@media screen and (max-width: 600px) {
    .grid .survey-item {
        display: block;
        width: auto;
        height: 150px;
        margin: 10px auto;
    }
}

.grid .survey-name {
    display: block;
    max-width: 80%;
    font-size: 16px;
    line-height: 20px;
}

.grid .survey-country {
    font-size: 11px;
    line-height: 16px;
    text-transform: uppercase;
}

.grid .survey-country,
.grid .survey-end-date {
    color: #A1A1A4;
}

.grid .survey-end-date:before {
    content: 'tel\00a0';
}

.grid .survey-end-date.ended:before {
    content: 'tel\00a0';
}

.grid .survey-progress {
    display: block;
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    width: 100%;
    padding: 4%;
    font-size: 13px;
}

.grid .survey-progress-bg {
    width: 40%;
    display: block;
}

@media screen and (max-width: 200px) {
    .grid .survey-progress-bg {
        display: none;
    }
}

.grid .survey-progress-labels {
    position: absolute;
    right: 20px;
    top: 0;
    line-height: 40px;
}

@media screen and (max-width: 200px) {
    .grid .survey-progress-labels {
        right: auto;
        left: 10px;
    }
}

.grid .survey-progress-label {
    line-height: 21px;
    font-size: 13px;
    font-weight: 400;
}

.grid .survey-completes {
    line-height: 21px;
    font-size: 13px;
    vertical-align: middle;
}

.grid .survey-stage {
    position: absolute;
    top: 20px;
    right: 20px;
}

.grid .survey-stage .stage {
    display: none;
}

.grid .survey-stage .active {
    display: block;
}

.grid .survey-end-date {
    font-size: 12px;
    line-height: 20px;
}

.survey-progress-label {
    vertical-align: middle;
    margin: 0 10px;
    color: #8DC63F;
}

.survey-progress-bg {
    display: inline-block;
    vertical-align: middle;
    position: relative;
    width: 100px;
    height: 4px;
    border-radius: 2px;
    overflow: hidden;
    background: #eee;
}

.survey-progress-fg {
    position: absolute;
    top: 0;
    bottom: 0;
    height: 100%;
    left: 0;
    margin: 0;
    background: #8DC63F;
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
  margin-left:26%;
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
  margin-left:26%;
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
  left: 42%;
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

<!-- header -->
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
            <div id="menu" style="position:absolute; margin-top:14%; margin-left:11%; ">
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



<div class="container-fluid">
   <div class="row">
   <div class="col-2"></div>
   <div class="col-8">
   <hr>
   <span class="toggler active" data-toggle="grid"><span class="entypo-layout"></span></span>
   <span class="toggler" data-toggle="list"><span class="entypo-list"></span></span>

   <ul class="surveys grid">
      
      <c:forEach var="item" items="${list}" varStatus="status">
			<li class="survey-item">
				<span class="survey-progress">
		        	<button class="btn btn-light btn-block" onclick="location.href='${pageContext.request.contextPath}/categoryDetail?idx=${item.business_idx}'">더 보기</button>
		      	</span>
			
				<span class="survey-name">
					${item.place_name} 
				</span> 
				<span class="survey-country grid-only">
					${item.road_address_name} 
				</span>

				<div class="pull-right">
					<span class="survey-end-date"> ${item.phone} </span> 
					<span class="survey-stage"> 
						<div id="bookmarkIconDiv" style="width: 16px; height: 16px;"><img class="bookmarkIcon" value="${item.road_address_name}" id='${item.phone}' src="resources/img/bookmark_t_on.png" style="width: 30px;height: 30px;"></div>
					</span>
				</div>
			</li>
		</c:forEach>
      <script>
		$(function () {
	  		$(".bookmarkIcon").click(function(){
		  		
		  		if($(this).attr("src")=="resources/img/bookmark_t_on.png"){
		  			$(this).attr("src","resources/img/bookmark_t_off.png");
		  			$.ajax({
    					type : "POST",
    					url : "deleteBookmark",
    					datatype : "json",
    					data : {"user_idx" : <%=request.getAttribute("idx")%>, "business_phone" : $(this).attr("id"),"business_road_address_name" :$(this).attr("value") },
    					success : function(data) { //data = checkId에서 넘겨준 결과값
    						if ($.trim(data) == "delete") {
        						alert("삭제됨");
    						}
    					} 
    				})
	    		}else{
			  		$(this).attr("src","resources/img/bookmark_t_on.png");
			  		$.ajax({
    					type : "POST",
    					url : "insertBookmark",
    					datatype : "json",
    					data : {"user_idx" : <%=request.getAttribute("idx")%>, "business_phone" : $(this).attr("id"),"business_road_address_name" :$(this).attr("value")},
    					success : function(data) { //data = checkId에서 넘겨준 결과값
    						if ($.trim(data) == "insert") {
        						alert("추가됨");
    						}
    					} 
    				})
				}
	    	})
		});  	  	
		 </script>


   </ul>
   </div>
   <div class="col-2"></div>
</div> <!-- bookmark row end -->
   <!-- footer -->
   <div class="container-fluid navbar-fixed-bottom" id="footer_container">
      <div class="row" id="footer_row">
         <div class="col-2" id="box1"></div>
         <div class="col-3" id="box2">
            <div id="introduce_hubba">
               <h3 id="bottom_title" onclick="location.href='${pageContext.request.contextPath}/main'"><i>hubba-hubba</i></h3>
               <p style="color:white; font-size:large; margin-top:4%;"><i>식당, 카페, 서점, 백화점등 <br/>일상에 필요한 모든 정보를 검색하세요. </i></p>
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
   </div> <!-- footer container fluid end -->   
</div> <!-- container fluid end -->      
</body>
</html>