<%@ page import="com.hubba.vo.BusinessVO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>view details</title>
<link rel="shortcut icon" href="resources/img/real_favi.ico">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="<c:url value="resources/css/viewDetails.css"/>" type="text/css" />

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<script src="<c:url value="resources/js/viewDetails.js"/>"></script>

<style>


/*도연*/
.menu-items {
	display: table;
	width: 100%; /* try commenting this in/out */
}

.menu-item, .menu-delimiter, .menu-price {
	display: table-cell;
	width: 80px;
}

.menu-item, .menu-price {
	width: auto;
	/* with this and without, the width should stay set to the same value (see inspector) */
	white-space: nowrap;
	position: relative;
	top: .5em;
}

.menu-item {
	padding-right: .2em;
}

.menu-price {
	padding-left: .2em;
}

.menu-delimiter {
	width: 100%;
	/*try commenting this in/out with the table width both declared and without */
	border-bottom: dotted 2px #c1c1c1;
}

.card:hover {
	cursor: pointer;
	transform: scale(1.04);
}

/* The Modal (background) */
.modal_img {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-ImgContent {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
}

/* Add Animation */
.modal-ImgContent, #caption {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

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

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px) {
	.modal-ImgContent {
		width: 100%;
	}
}

.imgModal {
	object-fit: cover;
	width: 120px;
	height: 120px;
}
</style>

<script type="text/javascript">
function showReview(){
   var user_idx ="<%=request.getAttribute("idx")%>";
         
   if(user_idx=="notLogin"){
      alert("로그인이 필요합니다.");
      location.href="login";
   }else{
      $(".hide_contents").slideUp(1000);
      $("#write_review_container").css("display", "block");
   }
}
      
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
	<div class="container-fluid" style="background-color: #f5f5f5;">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6" id="logo_col">
				<h1 id="title"
					onclick="location.href='${pageContext.request.contextPath}/main'">
					<i>hubba<br />hubba
					</i>
				</h1>
			</div>
			<div class="col-3">
				<div id="menu_toggle">
					<a id="toggle"> <span></span>
					</a>

					<div id="menu"
						style="position: absolute; margin-top: 25%; margin-left: 5%;">
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
	</div>
	<!-- 로그인 토글  -->

	<script>
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
      if(db_name=="ssibal"){
         location.href="login";
      }else{
         toggleClass(this, 'on');
         return false;      
      }
   
   }
</script>


	<!-- 사진 캐러셀 부분 -->
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner" style="height: 800px;">

			<div class="row">
				<div class="col">

					<%
	String[] randomImages = (String[])request.getAttribute("randomImages");
	if (randomImages!=null){
		for(int i=0; i<randomImages.length; i++){
			if(i==0){ %>
					<div class="carousel-item active">
						<div id="category_img"
							style="background-image:url('resources/img/<%= randomImages[i]%>'); background-size:100% 100%; height: 800px;width: 100%;"></div>

						<%-- 		<img id="category_img" src="<c:url value="resources/img/"/><%= randomImages[i]%>" alt="" onclick=""/> --%>
					</div>
					<%		}
			else{%>
					<div class="carousel-item">
						<div id="category_img"
							style="background-image:url('resources/img/<%= randomImages[i]%>'); background-size:100% 100%; height: 800px;width: 100%;"></div>
					</div>
					<%			}
		}
	}

%>
				</div>
			</div>

		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>


	</div>

	<!-- 사진 캐러셀 부분 end -->
	<!-- 정보 -->
	<div class="container-fluid">
		<div class="row" id="information_row">
			<div class="col-2"></div>
			<div class="col-8">

				<!-- 별 -->
				<div style="height: 80px;">
					<div>
						<p class="rating"
							style="float: left; height: 60px; margin-top: 10px; margin-bottom: 0px;"></p>
						<%-- (${businessDetails.getReview_rating()}) --%>
					</div>
					<%
               int checkBookmark = Integer.parseInt(request.getAttribute("checkBookmark").toString());
               if(checkBookmark==2){%>
					<div id="bookmarkIconDiv" style="float: right;">
						<img class="bookmarkIcon"
							value="${businessDetails.getRoad_address_name()} "
							id='${businessDetails.getPhone()}'
							src="resources/img/bookmark_t_off.png"
							style="width: 70px; padding: 10px;">
					</div>
					<% }else if(checkBookmark==0){%>
					<div id="bookmarkIconDiv" style="float: right;">
						<img class="bookmarkIcon"
							value="${businessDetails.getRoad_address_name()} "
							id='${businessDetails.getPhone()}'
							src="resources/img/bookmark_t_off.png"
							style="width: 70px; padding: 10px;">
					</div>
					<%}else{%>
					<div id="bookmarkIconDiv" style="float: right;">
						<img class="bookmarkIcon"
							value="${businessDetails.getRoad_address_name()} "
							id='${businessDetails.getPhone()}'
							src="resources/img/bookmark_t_on.png"
							style="width: 70px; padding: 10px;">
					</div>

					<% }%>
				</div>

				<!-- 가게이름 -->
				<div id="view_name" style="margin-top: 0px;">

					<h1 style="float: left; margin-right: 20px;">${businessDetails.getPlace_name()}</h1>
					<h1 style="color: grey;">${businessDetails.getReview_rating()}</h1>



				</div>

				<div class="hide_contents"
					style="float: left; width: 100%; margin-top: 10px;">
					<!-- <h4 style="margin-top:20px;">상세정보</h4> -->
					<!-- 오픈시간 & 장소 -->
					<p class="view_ptag">
						<img class="view_img"
							src="<c:url value="/resources/img/marker_basic.png"/>" alt=""
							onclick="" style="height: 30px; width: 30px;" />
						${businessDetails.getRoad_address_name()}
					</p>
					<p class="view_ptag">
						<img class="view_img"
							src="<c:url value="/resources/img/phone_green.png"/>" alt=""
							onclick="" style="height: 30px; width: 30px;" />
						${businessDetails.getPhone()}
					</p>
					<img class="view_img"
						src="<c:url value="/resources/img/calendar_blue.png"/>" alt=""
						onclick="" style="height: 30px; width: 30px;" />
					${businessDetails.getCategory_group_name()}

					<!-- 	<div  id="view_information">
					<span>
						향미분석가인 바리스타가 직접 볶은 신선한 원두로 커피 판매히는곳
						스페셜티 커피의 풍미를 느낄 수 있는 곳향미분석가인 바리스타가 직접 볶은 신선한 원두로 커피 판매히는곳
						스페셜티 커피의 풍미를 느낄 수 있는 곳스페셜티 커피의 풍미를 느낄 수 있는 곳
						향미분석가인 바리스타가 직접 볶은 신선한 원두로 커피 판매히는곳
						스페셜티 커피의 풍미를 느낄 수 있는 곳스페셜티 커피의 풍미를 느낄 수 있는 곳
						향미분석가인 바리스타가 직접 볶은 신선한 원두로 커피 판매히는곳스페셜티 커피의 풍미를 느낄 수 있는 곳
						향미분석가인 바리스타가 직접 볶은 신선한 원두로 커피 판매히는곳
						향미분석가인 바리스타가 직접 볶은 신선한 원두로 커피 판매히는곳
						스페셜티 커피의 풍미를 느낄 수 있는 곳
						향미분석가인 바리스타가 직접 볶은 신선한 원두로 커피 판매히는곳
						스페셜티 커피의 풍미를 느낄 수 있는 곳
						향미분석가인 바리스타가 직접 볶은 신선한 원두로 커피 판매히는곳

					</span>
				</div>  -->

					<hr>
					<div id="icons">
						<p>기본정보</p>
					</div>


				</div>

			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<script>
<%
	BusinessVO businessDetails = new BusinessVO();
	businessDetails = (BusinessVO)request.getAttribute("businessDetails");
	
	if(businessDetails.getVegan()==1){%>
		$("#icons").append("<div style='margin-bottom: 30px;width:33%; float:left;'><img style='width:50px; float:left; ' src='resources/img/vegan.png' alt='vegetarian'/><p style=' padding-top:2%; padding-left:30px; margin-left:30px;'>VEGAN <b>YES<b/></p></div>");
<%	}
	if(businessDetails.getPet()==1){%>
		$("#icons").append("<div style='margin-bottom: 30px;width:33%; float:left;'><img style='width:50px; float:left;' src='resources/img/pet1.png'/><p style=' padding-top:2%; padding-left:30px; margin-left:30px;'>PET <b>YES<b/> </p></div>");
<%	}
	if(businessDetails.getSmoking()==1){%>
	$("#icons").append("<div style='margin-bottom: 30px;width:33%;float:left;'><img style='width:50px;float:left;' src='resources/img/smoking.png'/><p style=' padding-top:2%; padding-left:30px; margin-left:30px;'>SMOKING <b>YES<b/></p></div>");
<%	}
	if(businessDetails.getWifi()==1){%>
	$("#icons").append("<div style='margin-bottom: 30px;width:33%;float:left;'><img style='width:50px;float:left;' src='resources/img/wifi.png'/><p style=' padding-top:2%; padding-left:30px; margin-left:30px;'>WIFI <b>YES<b/> </p></div>");
<%	}
	if(businessDetails.getDelivery()==1){%>
	$("#icons").append("<div style='margin-bottom: 30px;width:33%;float:left;'><img style='width:50px;float:left;' src='resources/img/delivery.png'/><p style=' padding-top:2%; padding-left:30px; margin-left:30px;'>DELIVERY <b>YES<b/> </p></div>");
<%	}
	if(businessDetails.getMask()==1){%>
	$("#icons").append("<div style='margin-bottom: 30px;width:33%;float:left;'><img style='width:50px;float:left;'  src='resources/img/mask.png'/><p style=' padding-top:2%; padding-left:30px; margin-left:30px;'>MASK <b>YES<b/> </p></div>");
<%	}
	if(businessDetails.getParking()==1){%>
	$("#icons").append("<div style='margin-bottom: 30px;width:33%;float:left;'><img style='width:50px;float:left;'  src='resources/img/parking1.png'/><p style=' padding-top:2%; padding-left:30px; margin-left:30px;'>PARKING <b>YES<b/> </p></div>");
<%	}
	if(businessDetails.getKids()==1){%>
	$("#icons").append("<div style='margin-bottom: 30px;width:33%;float:left;'><img style='width:50px;float:left;'  src='resources/img/kids.png'/><p style=' padding-top:2%; padding-left:30px; margin-left:30px;'>KIDS <b>YES<b/> </p></div>");
<%	}
	if(businessDetails.getReservation()==1){%>
	$("#icons").append("<div style='margin-bottom: 30px;width:33%;float:left;'><img style='width:50px;float:left;'  src='resources/img/reservation.png'/><p style=' padding-top:2%; padding-left:30px; margin-left:30px;'>RESERVATION <b>YES<b/> </p></div>");
<%	}
	
	
	//mask, parking
	//rating star
	float count= 0;
	count = businessDetails.getReview_rating();
	
	while(count>0){ 
		%>
	
		<%if(count<1 && count>0){%>
			$(".rating").append("<img style='width:50px' src='resources/img/star_half.png'/>");
		<%	break;
		}else %>
		$(".rating").append("<img style='width:50px' src='resources/img/full_star.png'/>");
		<%
		count-=1;
	}
	
		
	
%>
</script>








	<!-- 메뉴 -->
	<div class="container-fluid hide_contents">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<!-- 메뉴 업데이트 버튼 -->
				<div id="update_button"></div>
				<hr>
				<!-- 메뉴 사진  -->
				<%-- <%

/* allImages=(String[])request.getAttribute("allImages"); */
if ((String[])request.getAttribute("allImages")!=null){
	String[] allImages = new String[]{};
	allImages=(String[])request.getAttribute("allImages");
	int counting = 0;
	System.out.println("size of the Images: "+allImages.length);
	
	
	}
	
%>
 --%>
				<%--  <div style="height:300px;">
   <c:forEach var="review" items="${review }" varStatus="i">
     <c:forEach items="${fn: split(review.images, '&') }" var="images1"  begin="1" end="1">
				   <div class="card" style="background-image:url('resources/img/${images1}'); width:25%; float:left; height:50%; background-size:100% 100%; border: 2px solid white;" ></div>
  
     </c:forEach>
</c:forEach>

 </div> --%>
				<%
 if ((String[])request.getAttribute("allImages")!=null){
	String[] allImages = new String[]{};
	allImages=(String[])request.getAttribute("allImages");
	int counting = 0;
	%>
				<div style="height: 300px;">

					<%


	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
	%>

					<div class="card"
						style="background-image:url('resources/img/<%= allImages[counting++]%>'); width:50%; height:100%;float:left; background-size:100% 100%; border:2px solid white;"></div>

					<%

	}
	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
		%>
					<div class="card"
						style="background-image:url('resources/img/<%= allImages[counting++]%>');width:25%; float:left; height:50%; background-size:100% 100%; border: 2px solid white;	"></div>
					<%	
	}
	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
		%>
					<div class="card"
						style="background-image:url('resources/img/<%= allImages[counting++]%>'); width:25%; float:left; height:50%;background-size:100% 100%;	 border: 2px solid white;"></div>
					<%
	}
	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
		%>
					<div class="card"
						style="background-image:url('resources/img/<%= allImages[counting++]%>'); width:25%; float:left; height:50%;background-size:100% 100%;    border: 2px solid white;	"></div>

					<%
	}
	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
		%>
					<div class="card"
						style="background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(resources/img/<%= allImages[counting++]%>); width:25%; float:left; height:50%;background-size:100% 100%;	  border: 2px solid white;">
						<p
							style="color: white; align-self: center; top: 40%; position: absolute;">+${allImagesSize}</p>
					</div>

					<%
	}
	
	if(allImages==null || counting==0){ 
		System.out.println("dd");
    %>
					<div class="card"
						style="background-image: url('resources/img/real_noimages.png'); width: 100%; float: left; height: 100%; background-size: 100% 100%; border: 2px solid white;"></div>
					<%
	}%>





				</div>
				<%
}
%>

				<hr>
				<!-- 메뉴 내용 -->
				<!-- start of the menu -->

				<section class="menu-group">
					<c:forEach var="businessMenu" items="${businessMenu}">
						<div class="menu-items">
							<span class="menu-item">${businessMenu.menu_name}</span> <span
								class="menu-delimiter"></span> <span class="menu-price">${businessMenu.menu_price}</span>
						</div>
					</c:forEach>
				</section>
				<script>
				   $(document).ready(function(){
				      $('.menu-group').simpleLoadMore({
				           item:'div',
				           count: 5,
				           btnHTML: '<div class="moreReview" style="height:28px; text-align:center;margin-top: 10px;">'
				              +'<a href="javascript:void(0);" class="load-more_btn">View More<i class="fas fa-angle-down" style="color: rgb(74,188,184);"></i></a></div>',
				           cssClass: 'load-more',
				           itemsToLoad: 5
				         });
				
				
				      });
				   
   
  				</script>

				<hr>

				<div class="container-fluid" style="max-width: 100%;">
					<p style="font-size: 25px;">Location &amp; Hours</p>
					<div class="row">

						<div class="" style="width: 60%;">

							<div class="hide_contents" id="map"
								style="width: 100%; height: 300px; margin: auto; border-radius: 10px;"></div>
							<div style="font-size: 12px; margin-top: 10px;">${businessDetails.getRoad_address_name()}
								<button type="button" class="btn-sm btn-secondary"
									style="background-color: grey; border: none;"
									onclick="location.href='https://map.kakao.com/link/to/${businessDetails.getPlace_name()},${businessDetails.getY()}, ${businessDetails.getX()}'">

									길찾기</button>
							</div>
						</div>
						<div class="" style="width: 40%;">
							<!— 영업시간 —>

							<div class="schedule"
								style="font-size: 20px; padding-left: 30px;">
								<c:forEach var="businessMenu" items="${BusinessHours}">
									<c:choose>

										<c:when test="${businessMenu.days eq dayOfWeek}">
											<p
												style="float: left; margin-bottom: 0px; font-weight: bold; margin-right: 15px; color: rgb(74, 188, 184);">${businessMenu.day_kr}</p>
											<p style="margin-bottom: 0px; color: rgb(74, 188, 184);">
												${businessMenu.open} - ${businessMenu.close} TODAY</p>

										</c:when>

										<c:otherwise>
											<p
												style="float: left; margin-bottom: 0px; font-weight: bold; margin-right: 15px; color: grey;">${businessMenu.day_kr}</p>
											<p style="margin-bottom: 0px; color: grey;">
												${businessMenu.open} - ${businessMenu.close}</p>

										</c:otherwise>

									</c:choose>

								</c:forEach>
							</div>
						</div>

					</div>
				</div>
				<!-- 메뉴 업데이트 버튼 -->
				<div class="row" id="update_row">
					<div class="col-10"></div>
					<div class="col-2">
						<div id="update_button"">
							<button type="button" class="btn btn-secondary"
								data-toggle="modal" data-target=".bd-example-modal-lg"
								style="background-color: rgb(74, 188, 184); border: none;">
								업데이트</button>
						</div>
					</div>
				</div>


			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@config.getProperty('KAKAO_API_KEY')"></spring:eval>"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(${businessDetails.getY()}, ${businessDetails.getX()}), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${businessDetails.getY()}, ${businessDetails.getX()}); 

		 var imageSrc = 'resources/img/markerwithcrown.png', // 마커이미지의 주소입니다    
         imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
         imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.


       
           
     	 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
   		 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
         markerPosition = new kakao.maps.LatLng(${businessDetails.getY()}, ${businessDetails.getX()}); // 마커가 표시될 위치입니다
     

		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		    
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
</script>
	<!-- end of display the map -->




	<!-- 리뷰보기 -->
	<div class="container-fluid hide_contents">
		<div class="row" id="review_row">
			<div class="col col11"></div>
			<div class="col col12"></div>
			<div class="col col13" id="review_button">
				<div id="review_button">
					<!-- <p id="review_ptag">리뷰보기</p> -->
					<a id="review_ptag" class="btn btn-secondary btn-lg active"
						role="button" aria-pressed="true" onclick="showReview();"
						style="background-color: rgb(74, 188, 184); border: none;">리뷰보기</a>
				</div>
			</div>
			<div class="col col14"></div>
			<div class="col col15"></div>
		</div>
	</div>

	<!-- Large modal -->
	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width: 600px;">
			<div class="modal-content" style="width: 600px;">




				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수정하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<button type="button" onclick="modifysched()"
						style="background-color: rgb(74, 188, 184); color: white; width: 116px; height: 35px; border-right-width: 0px;">
						영업시간 수정</button>
					<button type="button" onclick="editmenu()"
						style="background-color: rgb(99, 156, 154); color: white; width: 116px; height: 35px; padding-left: 7px; border-left-width: 0px;">
						메뉴 수정</button>

					<form action="${pageContext.request.contextPath}/workingdays"
						method="POST">
						<div id="modifysched"
							style="display: none; margin-top: 0px; border: 1px solid #e0e0e0; padding-top: 30px; padding-left: 10%; margin-right: 1px; padding-right: 10px;">

							<c:forEach var="businessMenu" items="${BusinessHours}"> 
      
        		${businessMenu.day_kr}요일	 <input type="text" name="open"
									style="border: none; background-color: #f5f5f5; margin-left: 10px; text-align: center; margin-top: 5px; color: #717070;"
									value="  ${businessMenu.open}">   - <input type="text"
									name="close"
									style="border: none; background-color: #f5f5f5; margin-left: 10px; margin-top: 5px; text-align: center; color: #717070;"
									value="${businessMenu.close}">
								<br />
							</c:forEach>

							<input type="hidden" value="${businessDetails.getIdx()}"
								name="business_idx" style="display: none">
							<button type="submit"
								style="margin-top: 20px; margin-bottom: 20px; background-color: rgb(74, 188, 184); color: white; width: 116px;
	/* height: 35px; */ padding-left: 2px; width: 85%; padding-top: 10px; border-bottom-width: 1px; padding-bottom: 10px;">SUBMIT</button>
						</div>
					</form>
					<div id="menueditstyle"
						style="display: none; margin-top: 0px; border: 1px solid rgb(224, 224, 224); padding-top: 30px; padding-left: 14%; margin-right: 1px; padding-right: 20px;">
						<button id="menuadd" onclick="addrow()"
							style="display: block; border: none; color: red; font-weight: 700; margin-left: 68%; margin-bottom: 2%;">ADD</button>

						<form action="${pageContext.request.contextPath}/editmenu"
							method="POST">
							<div id="editmenu" style="display: none;">
								<div>
									<c:forEach var="businessMenu" items="${businessMenu}">
										<div class="happy">
											<input name="menu" type="text"
												value="${businessMenu.menu_name}"
												style="background-color: #f5f5f5; margin-left: 10px; text-align: center; margin-top: 5px; color: #717070; border: none;">
											<input type="text" name="price"
												value="${businessMenu.menu_price}"
												style="background-color: #f5f5f5; margin-left: 10px; text-align: center; margin-top: 5px; color: #717070; border: none;" />
											<img style='width: 15px' src='resources/img/delete.png'
												class="delete" title="delete" /> <br />
										</div>
									</c:forEach>
									<input type="hidden" value="${businessDetails.getIdx()}"
										name="business_idx" style="display: none" />
								</div>
							</div>
							<button type="submit" id=submitmenu
								style="display: block; margin-top: 20px; margin-bottom: 20px; background-color: rgb(74, 188, 184); color: white; width: 75%; padding-top: 10px; border-bottom-width: 1px; padding-bottom: 10px; margin-left: 10px;">제출하기</button>
						</form>
					</div>
				</div>
			</div>

			<!-- 모달 푸터 -->
			<div class="modal-footer"></div>




		</div>
	</div>



	<script>
/* $(document).ready(function(){
	$("delete").click(function{
		$(this).parents("div").remove();
		})
}) */
$(document).on("click",".delete", function(){
		$(this).parents(".happy").remove();
		
		});

	
function addrow(){
	$("#editmenu").append("<div class= 'happy'><input type='text'name='menu'  style='background-color: #f5f5f5; margin-left:10px; text-align:center; margin-top:5px; color: #717070; border:none;'>  <input type='text' name='price'  style='background-color: #f5f5f5; margin-left:10px; text-align:center; margin-top:5px; color: #717070; border:none;'>   <img style='width:15px' src='resources/img/delete.png' class='delete' title='delete'></div>");
	$("#editmenu .delete").click(function() {
		
	});

}

function modifysched(){
	var sched = document.getElementById('modifysched');
	sched.style.display='block'; 
	var menu = document.getElementById('editmenu');
	menu.style.display='none';
	var menuadd = document.getElementById('menuadd');
	menuadd.style.display='none';
	var submitmenu = document.getElementById('submitmenu');
	submitmenu.style.display='none';
	var menueditstyle = document.getElementById('menueditstyle');
	menueditstyle.style.display='none';
}
function editmenu(){
	var menu = document.getElementById('editmenu');
	menu.style.display='block'; 
	var sched = document.getElementById('modifysched');
	sched.style.display='none'; 
	var menuadd = document.getElementById('menuadd');
	menuadd.style.display='block';
	var submitmenu = document.getElementById('submitmenu');
	submitmenu.style.display='block';
	var menueditstyle = document.getElementById('menueditstyle');
	menueditstyle.style.display='block';
}

function showmenu(){
	var show = document.getElementById('hide-me');
	show.style.display='block';
	var img = document.getElementById('showimg');
	img.style.display='none';
}

function showsched(){
	var show = document.getElementById('schedule');
	var img = document.getElementById('showschedule');
	show.style.display='block';
	img.style.display='none';
}
</script>

	<!-- 리뷰내용(숨김) -->
	<jsp:include page="reviewDetails.jsp" flush="false"></jsp:include>
	
	<script>
	// 북마크
	$(function () {
		$(".bookmarkIcon").click(function(){
			//alert($(this).attr("id"));


		var user_idx ="<%=request.getAttribute("idx")%>";
			
		if(user_idx=="notLogin"){
			alert("로그인이 필요합니다.");
			location.href="login";
		}else{
			if($(this).attr("src")=="resources/img/bookmark_t_on.png"){
	  			$(this).attr("src","resources/img/bookmark_t_off.png");
	  			$.ajax({
		  			//alert("뭐죠");
					type : "POST",
					url : "deleteBookmark",
					datatype : "json",
					data : {"user_idx" : <%=request.getAttribute("idx").toString()%>, "business_phone" :$(this).attr("id"),"business_road_address_name" :$(this).attr("value") },
					success : function(data) { //data = checkId에서 넘겨준 결과값
						if ($.trim(data) == "delete") {
							alert("북마크 삭제됨");
						}
					} 
				})
			}else{
		  		$(this).attr("src","resources/img/bookmark_t_on.png");
		  		$.ajax({
					type : "POST",
					url : "insertBookmark",
					datatype : "json",
					data : {"user_idx" : <%=request.getAttribute("idx").toString()%>, "business_phone" : $(this).attr("id"),"business_road_address_name" :$(this).attr("value") },
					success : function(data) { //data = checkId에서 넘겨준 결과값
						if ($.trim(data) == "insert") {
							alert("북마크 추가됨");
						}
					} 
				})
			}
		}

	})
});
	</script>








	<!-- container-fluid -->


	<!-- 푸터 -->

	<script>

function add_menu() {
	$('#update_menu').append('<div class="update_menu_row"><input type="text"><input type="number"><button class="delete_btn">x</button></div>');
};

function delete_menu_button(){
	$('#update_menu').remove('#menu_wrap');
};

$(function(){
	$(document).on("click", ".delete_btn", function() {
		$(this).parent(".update_menu_row").remove();
	});
});
</script>
</body>
</html>