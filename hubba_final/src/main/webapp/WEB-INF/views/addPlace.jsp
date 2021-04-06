<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/img/real_favi.ico">
<title>addPlace</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap" rel="stylesheet">   
	<script type="text/javascript"
	   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e33a2e114db527d4f3ddac5248bd0330
	&libraries=services"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 500px;
}

#menu_wrap {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   width: 250px;
   margin: 10px 0 30px 10px;
   padding: 5px;
   overflow-y: auto;
   background: rgba(255, 255, 255, 0.7);
   z-index: 1;
   font-size: 12px;
   border-radius: 10px;
}

.bg_white {
   background: #fff;
}

#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

#menu_wrap .option {
   text-align: center;
}

#menu_wrap .option p {
   margin: 10px 0;
}

#menu_wrap .option button {
   margin-left: 5px;
}

#placesList li {
   list-style: none;
}

#placesList .item {
   position: relative;
   border-bottom: 1px solid #888;
   overflow: hidden;
   cursor: pointer;
   min-height: 65px;
}

#placesList .item span {
   display: block;
   margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

#placesList .item .info {
   padding: 10px 0 10px 55px;
}

#placesList .info .gray {
   color: #8a8a8a;
}

#placesList .info .jibun {
   padding-left: 26px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
      no-repeat;
}

#placesList .info .tel {
   color: #009900;
}

#placesList .item .markerbg {
   float: left;
   position: absolute;
   width: 36px;
   height: 37px;
   margin: 10px 0 0 10px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
      no-repeat;
}

#placesList .item .marker_1 {
   background-position: 0 -10px;
}

#placesList .item .marker_2 {
   background-position: 0 -56px;
}

#placesList .item .marker_3 {
   background-position: 0 -102px
}

#placesList .item .marker_4 {
   background-position: 0 -148px;
}

#placesList .item .marker_5 {
   background-position: 0 -194px;
}

#placesList .item .marker_6 {
   background-position: 0 -240px;
}

#placesList .item .marker_7 {
   background-position: 0 -286px;
}

#placesList .item .marker_8 {
   background-position: 0 -332px;
}

#placesList .item .marker_9 {
   background-position: 0 -378px;
}

#placesList .item .marker_10 {
   background-position: 0 -423px;
}

#placesList .item .marker_11 {
   background-position: 0 -470px;
}

#placesList .item .marker_12 {
   background-position: 0 -516px;
}

#placesList .item .marker_13 {
   background-position: 0 -562px;
}

#placesList .item .marker_14 {
   background-position: 0 -608px;
}

#placesList .item .marker_15 {
   background-position: 0 -654px;
}

#pagination {
   margin: 10px auto;
   text-align: center;
}

#pagination a {
   display: inline-block;
   margin-right: 10px;
}

#pagination .on {
   font-weight: bold;
   cursor: default;
   color: #777;
}






/****/
body{
  color: #444;
  font-family: 'Roboto';
  margin: 0;
  background: #f5f5f5;
}








/*****************/






* {
  margin: 0;
  box-sizing: border-box;

}

h2{
  text-transform: uppercase;
  font-size: 1em;
  margin-bottom: 10px;
}

#formunderlay{
  height: 100%;
  width: 100%;
  z-index: -10;
}
#activityform{
  width: 50%;
  min-width: 500px;
  height:74%;
  background: #EDEDED;
  margin: 10% auto;
  padding: 20px;
  box-shadow: 0px 3px 10px rgba(0,0,0,0.4);
}

#formHolder{
  height: 100%;
  width: 100%;
  background: #FFF;
  padding: 20px;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.2);
}
#spacer, #spacertwo{
  float: left;
  width: 2.5%;
  height: 100%; 
}
#register{
  float: left;
  background: #FFF;
  padding: 20px;
  height: 100%;
  width: 47.5%;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.2);
  
}
.desc{
  margin-bottom: 100px;
}
textarea, input{
  width: 100%;
  resize: none;
  margin-bottom: 10px;
  margin-top: 5px;
}

input[type="text"], input[type="password"], textarea{
  padding: 10px;
  border: solid 1px #dcdcdc;
  transition: box-shadow 0.3s, border 0.3s;
  outline: none;
} 
input[type="text"]:focus, input[type="text"].focus,
input[type="password"]:focus, input[type="password"].focus,
textarea.focus, textarea: focus {
  border: solid 1px #707070;
  box-shadow: 0 0 5px 1px #969696;
}

/*submit button*/
.insertDB{
  border: none;
  -webkit-border-radius: 3;
  -moz-border-radius: 3;
  border-radius: 3px;
  font-family: Arial;
  color: #ffffff;
  font-size: 11px;
  background: rgb(153, 153, 153);
  padding: 8px 10px 8px 10px;
  text-decoration: none;
}

.insertDB:hover {
  background: rgb(74,188,184);;
  text-decoration: none;
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

	$(function() {
		$(".insertDB").click(function() {

			//if (document.addPlace_check.p_category.value == 'default') {
			//	alert("카테고리를 선택하세요");
			//} else {
				$.ajax({
					type : "POST",
					url : "insertPlace",
					datatype : "json",
					data : {
						"p_name" : $(".test_name").attr("value"),
						"p_address" : $(".test_road_address").attr("value"),
						"p_phone" : $(".test_phone").attr("value"),
						"p_category" : "코노",
						"p_x" : $(".test_x").attr("value"),
						"p_y" : $(".test_y").attr("value")
					},
					success : function(data) { //data = checkId에서 넘겨준 결과값
						if ($.trim(data) == "insert") {
							alert("도움을 주셔서 감사합니다");
							$(".test_name").val('');
							$(".test_road_address").val('');
							$(".test_phone").val('');
						}
					}
				})
			//}
		})
	});


	//로그인~
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




<hr style="width:69.8%; margin:2% 0% 3% 17.5%;">
<div class="container-fluid">
	<div class="row" style="width:80%; margin:0 auto;">
		<div class="col-1"></div>
		<div class="col-6">  
		   <div class="map_wrap" style="width: 100%;height: 700px;" >
		      <div id="map"
		         style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		
		      <div id="menu_wrap" class="bg_white">
		         <div class="option">
		            <div>
		               <form onsubmit="searchPlaces(); return false;">
		                  키워드 : <input type="text" value="음식점" id="keyword" size="45">
		                  <button type="submit">검색하기</button>
		               </form>
		            </div>
		         </div>
		         <hr>
		         <ul id="placesList"></ul>
		         <div id="pagination"></div>
		      </div>
		   </div>
   		</div><!-- map left col end -->

   
		<div class="col-5">   
		  <div id="formunderlay" style="width: 50%;"> 
		   <div id="activityform">
			   <div id="formHolder">  
			    <form name="addPlace_check">
			      <header><h2>add place</h2></header>
				    <div class="form-group p_name">
					  <label for="p_name">place name: </label>
					  <input type="text" class="form-control" id="p_name" name="p_name" readonly>
					</div>
					<div class="form-group p_address">
					  <label for="p_address">Road Adress Name :</label>
					  <input type="text" class="form-control" id="p_address" name="p_address" readonly>
					</div>
					<div class="form-group p_phone">
					  <label for="p_phone">Phone :</label>
					  <input type="text" class="form-control" id="p_phone" name="p_phone" readonly>
					</div>
					<div class="form-group">
					  <label for="p_category">Category:</label>
					  <select class="form-control test_category" id="p_category" name="p_category">
					  	<option value="default">Select Category</option>
					    <option value="음식점">음식점</option>
					    <option value="카페">카페</option>
					    <option value="숙박">숙박</option>
					    <option value="병원">병원</option>
					    <option value="약국">약국</option>
					    <option value="지하철">지하철</option>
					    <option value="주차장">주차장</option>
					    <option value="주유소">주유소</option>
					    <option value="편의점">편의점</option>
					    <option value="학교">학교</option>
					    <option value="학원">학원</option>
					    <option value="유치원">유치원</option>
					    <option value="관광명소">관광명소</option>
					    <option value="문화">문화</option>
					    <option value="중개업소">중개업소</option>
					    <option value="공공기관">공공기관</option>
					    
					  </select>
					</div>
			      	<div style="height: 43px; margin-top: 20px">
			      	<input class="insertDB" type="button" value="Submit" style="height: 100%;">
			      	<!-- <img src="resources/img/full_star.png" class="insertDB"> -->
			      </div>
			      	<div class="form-group p_x" style="display:none;">
					  <label for="p_x">X :</label>
					  <input type="text" class="form-control" id="p_x" name="p_x" readonly>
					</div>
					<div class="form-group p_y"style="display:none;" >
					  <label for="p_y">Y :</label>
					  <input type="text" class="form-control" id="p_y" name="p_y" readonly>
					</div>
			    </form>  
			   </div>
		    </div>
		   </div>
		</div> <!-- map right col end -->
   

   <script>
      

      //마커를 담을 배열입니다
      var markers = [];

      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(37.523176, 126.905018), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 장소 검색 객체를 생성합니다
      var ps = new kakao.maps.services.Places();

      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({
         zIndex : 1
      });

      // 키워드로 장소를 검색합니다
      searchPlaces();



      

      // 키워드 검색을 요청하는 함수입니다
      function searchPlaces() {

         var keyword = document.getElementById('keyword').value;
         
         if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
         }

            
         // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
         ps.keywordSearch(keyword, placesSearchCB,{
            // 검색된 주소 값의 위도, 경도 값을 받아와야함
            location : new kakao.maps.LatLng(37.5540971, 126.9357111)
            });
      }

      // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
      function placesSearchCB(data, status, pagination) {
         if (status === kakao.maps.services.Status.OK) {
            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);
            console.log(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

         } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

         } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

         }
      }

      // 검색 결과 목록과 마커를 표출하는 함수입니다
      function displayPlaces(places) {

         var listEl = document.getElementById('placesList'), menuEl = document
               .getElementById('menu_wrap'), fragment = document
               .createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

         // 검색 결과 목록에 추가된 항목들을 제거합니다
         removeAllChildNods(listEl);

         // 지도에 표시되고 있는 마커를 제거합니다
         removeMarker();

         for (var i = 0; i < places.length; i++) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y,
                  places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
                  i, places[i]); // 검색 결과 항목 Element를 생성합니다

             

            
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
               kakao.maps.event.addListener(marker, 'mouseover',
                     function() {
                        displayInfowindow(marker, title);
                     });

               kakao.maps.event.addListener(marker, 'mouseout',
                     function() {
                        infowindow.close();
                     });

               itemEl.onmouseover = function() {
                  displayInfowindow(marker, title);
               };

               itemEl.onmouseout = function() {
                  infowindow.close();
               };
           		itemEl.onclick = function() {
             	   	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
                    var str = title;
                    var str2 = str.replace(regExp, "");
                    var str3 = str2.replace(/\s/gi, "");
             	   $(".p_name").html(" <label for='usr'>place name: </label><input type='text' class='form-control test_name' id='p_name' name='p_name' value='"+title+"' readonly>");
             	   $(".p_address").html(" <label for='usr'>Road Adress Name: </label><input type='text' class='form-control test_road_address' id='p_address' name='p_address' value='"+$("."+str3).attr("road_address_name")+"'readonly>");
                    $(".p_phone").html(" <label for='usr'>Phone: </label><input type='text' class='form-control test_phone' id='p_phone' name='p_phone' value='"+$("."+str3).attr("phone")+"'readonly>");
 					$(".p_x").html(" <label for='usr'>X: </label><input type='text' class='form-control test_x' id='p_x' name='p_x' value='"+$("."+str3).attr("x")+"'readonly>");
                    $(".p_y").html(" <label for='usr'>Y: </label><input type='text' class='form-control test_y' id='p_y' name='p_y' value='"+$("."+str3).attr("y")+"'readonly>");
            		};
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
            
         }

         // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
         listEl.appendChild(fragment);
         menuEl.scrollTop = 0;

         // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
         map.setBounds(bounds);
      }



      // 검색결과 항목을 Element로 반환하는 함수입니다
      function getListItem(index, places) {
    	  var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
          var str = places.place_name;
          var str2 = str.replace(regExp, "");
          var str3 = str2.replace(/\s/gi, "");
         var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
               + (index + 1)
               + '"></span>'
               + '<div class="info '+str3+'" road_address_name="'+places.road_address_name+'" phone="'+places.phone+'" x="'+places.x+'" y="'+places.y+'">'
               + '   <h5>' + places.place_name + '</h5>';

         if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>'
                  + '   <span class="jibun gray" >' + places.address_name
                  + '</span>';
         } else {
            itemStr += '    <span>' + places.address_name + '</span>';
         }

         itemStr += '  <span class="tel">' + places.phone + '</span>'
               + '</div>';

         el.innerHTML = itemStr;
         el.className = 'item';

         return el;
      }

      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
      function addMarker(position, idx) {
         var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
         imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
         imgOptions = {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset : new kakao.maps.Point(13, 37)
         // 마커 좌표에 일치시킬 이미지 내에서의 좌표
         }, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
               imgOptions), marker = new kakao.maps.Marker({
            position : position, // 마커의 위치
            image : markerImage
         });

         marker.setMap(map); // 지도 위에 마커를 표출합니다
         markers.push(marker); // 배열에 생성된 마커를 추가합니다

         return marker;
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
         for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
         }
         markers = [];
      }

      // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
      function displayPagination(pagination) {
         var paginationEl = document.getElementById('pagination'), fragment = document
               .createDocumentFragment(), i;

         // 기존에 추가된 페이지번호를 삭제합니다
         while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild(paginationEl.lastChild);
         }

         for (i = 1; i <= pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i === pagination.current) {
               el.className = 'on';
            } else {
               el.onclick = (function(i) {
                  return function() {
                     pagination.gotoPage(i);
                  }
               })(i);
            }

            fragment.appendChild(el);
         }
         paginationEl.appendChild(fragment);
      }

      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, title) {
         var content = '<div style="padding:5px;z-index:1;">' + title
               + '</div>';

         
         infowindow.setContent(content);
         infowindow.open(map, marker);
      }

      // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {
         while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
         }
      }



      
   </script>
   
	</div> <!-- map row end -->   
 </div> <!-- map container end -->  
   
   
   
   
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
               <img class="icons" src="<c:url value="/resources/img/footer/icons_facebook.png"/>"/>
               <img class="icons" src="<c:url value="/resources/img/footer/icons_instagram.png"/>"/>
               <img class="icons" src="<c:url value="/resources/img/footer/icons_youtube.png"/>"/>
               <img class="icons" src="<c:url value="/resources/img/footer/icons_twitter.png"/>"/>
            </div>
         </div>
         <div class="col-2" id="box5"></div>
      </div>
   </div>  
   
   
   
</body>
</html>