<%@page import="com.hubba.vo.BusinessVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view details</title>
   <link rel="shortcut icon" href="resources/img/real_favi.ico">

   <link rel="stylesheet" 
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
   crossorigin="anonymous"/>
   <link rel="stylesheet" href="<c:url value="resources/css/viewDetails.css"/>" type="text/css"/>
   
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
   crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" 
   crossorigin="anonymous"></script>
   
   <script src="<c:url value="resources/js/viewDetails.js"/>"></script>
   
<script>
$(document).ready(function() {

   //별점
   $(".starGrade a").click(function() {
      $(this).parent().children("a").removeClass("on");
      $(this).addClass("on").prevAll("a").addClass("on");

      return false;
   });

   $(".starGrade a").click(function() {
      var count = $(this).addClass("on").prevAll("a").length;
      count++;

      $("#rating").val(count);
      //alert(count);
   });
   

});
</script>
<style>
p .starGrade {
   height: 50px;
}

.starGrade a {
   font-size: 40px;
   text-decoration: none;
   color: gray;
}

.starGrade a.on {
   font-size: 40px;
   text-decoration: none;
   color: #ffe959;
}

.starGrade a:hover {
   text-decoration: none;
   color: #ffe959;
}
.likesBtn{
   font-size: 20px;
   text-decoration: none;
   color: gray;
}
.likesBtn.done{
   font-size: 20px;
   text-decoration: none;
   color: #db2d21;
}
.likesBtn a:hover {
   text-decoration: none;
   color: #db2d21;
}





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
width: auto; /* with this and without, the width should stay set to the same value (see inspector) */
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
    width: 100%;  /*try commenting this in/out with the table width both declared and without */
    border-bottom: dotted 2px #c1c1c1;
}

.card:hover{
   cursor:pointer;
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
     background-color: rgb(0,0,0); /* Fallback color */
     background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
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
<div class="container-fluid" style="background-color:#f5f5f5;">
   <div class="row">
      <div class="col-3"></div>
      <div class="col-6" id="logo_col">
         <h1 id="title" onclick="location.href='${pageContext.request.contextPath}/main'" ><i>hubba<br/>hubba</i></h1>
      </div>
      <div class="col-3">
         <div id="menu_toggle">
         <a id="toggle">
            <span></span>
         </a>
         
         <div id="menu" style="position:absolute; margin-top:25%; margin-left:5%;">
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
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner" style="height: 800px;">
	
<div class="row">
	<div class="col">

<%
	String[] randomImages = (String[])request.getAttribute("randomImages");
	if (randomImages!=null){
		for(int i=0; i<randomImages.length; i++){
			if(i==0){ %>
				<div class="carousel-item active">
				<div id="category_img"style="background-image:url('resources/img/<%= randomImages[i]%>'); background-size:100% 100%; height: 800px;width: 100%;" ></div>
	
			<%-- 		<img id="category_img" src="<c:url value="resources/img/"/><%= randomImages[i]%>" alt="" onclick=""/> --%>
				</div>
	<%		}
			else{%>
				<div class="carousel-item">
							<div id="category_img"style="background-image:url('resources/img/<%= randomImages[i]%>'); background-size:100% 100%; height: 800px;width: 100%;" ></div>
				</div>
<%			}
		}
	}

%>	 
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

<!-- 사진 캐러셀 부분 end -->
<!-- 정보 -->
<div class="container-fluid">
	<div class="row" id="information_row">
		<div class="col-2"></div>
		<div class="col-8">
		
		<!-- 별 -->
         <div style="height:80px;">
            <div><p class="rating" style="float: left;height: 60px;margin-top: 10px;margin-bottom: 0px;"></p><%-- (${businessDetails.getReview_rating()}) --%>
            </div>
            <%
               int checkBookmark = Integer.parseInt(request.getAttribute("checkBookmark").toString());
               if(checkBookmark==2){%>
               <div id="bookmarkIconDiv" style="float:right;">
                  <img class="bookmarkIcon" value="${businessDetails.getRoad_address_name()} " id='${businessDetails.getPhone()}' src="resources/img/bookmark_t_off.png" style="width: 70px; padding: 10px;">
               </div>
               <% }else if(checkBookmark==0){%>
               <div id="bookmarkIconDiv" style="float:right;">
                  <img class="bookmarkIcon" value="${businessDetails.getRoad_address_name()} " id='${businessDetails.getPhone()}' src="resources/img/bookmark_t_off.png" style="width: 70px; padding: 10px;">
               </div>
               <%}else{%>
               <div id="bookmarkIconDiv" style="float:right;">
                  <img class="bookmarkIcon" value="${businessDetails.getRoad_address_name()} " id='${businessDetails.getPhone()}' src="resources/img/bookmark_t_on.png" style="width: 70px; padding: 10px;">
               </div>
                  
               <% }%>
         </div>

			<!-- 가게이름 -->
			<div id="view_name" style="margin-top: 0px; ">
				
				<h1 style="float:left; margin-right: 20px;">${businessDetails.getPlace_name()}</h1>
				<h1 style="color:grey;">${businessDetails.getReview_rating()}</h1>
				
				
				 
			</div>
			
			<div class="hide_contents" style="float:left; width:100%; margin-top:10px;">
				<!-- <h4 style="margin-top:20px;">상세정보</h4> -->
				<!-- 오픈시간 & 장소 -->	
				<p class="view_ptag" ><img class="view_img" src="<c:url value="/resources/img/marker_basic.png"/>" alt="" onclick=""style="height: 30px;width: 30px;"/>
					${businessDetails.getRoad_address_name()} 
				</p>
				<p class="view_ptag" >
				<img class="view_img" src="<c:url value="/resources/img/phone_green.png"/>" alt="" onclick=""style="height: 30px;width: 30px;"/> ${businessDetails.getPhone()}</p>
				<img class="view_img" src="<c:url value="/resources/img/calendar_blue.png"/>" alt="" onclick=""style="height: 30px;width: 30px;"/> ${businessDetails.getCategory_group_name()}
			
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
				<div id="icons" >
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
				<div id="update_button">

				</div>
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

 </div> --%><%
 if ((String[])request.getAttribute("allImages")!=null){
	String[] allImages = new String[]{};
	allImages=(String[])request.getAttribute("allImages");
	int counting = 0;
	%>
	<div style="height:300px;">
	
	<%


	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
	%>	

	<div  class="card" style="background-image:url('resources/img/<%= allImages[counting++]%>'); width:50%; height:100%;float:left; background-size:100% 100%; border:2px solid white;" ></div>
		
	<%

	}
	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
		%>	
		<div class="card" style="background-image:url('resources/img/<%= allImages[counting++]%>');width:25%; float:left; height:50%; background-size:100% 100%; border: 2px solid white;	" ></div>
		<%	
	}
	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
		%>	
		<div class="card"  style="background-image:url('resources/img/<%= allImages[counting++]%>'); width:25%; float:left; height:50%;background-size:100% 100%;	 border: 2px solid white;" ></div>
		<%
	}
	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
		%>	
		<div class="card" style="background-image:url('resources/img/<%= allImages[counting++]%>'); width:25%; float:left; height:50%;background-size:100% 100%;    border: 2px solid white;	" ></div>
		
		<%
	}
	if(allImages.length>counting&&allImages[counting]!=null && counting<5){
		%>	
		<div class="card" style="background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url(resources/img/<%= allImages[counting++]%>); width:25%; float:left; height:50%;background-size:100% 100%;	  border: 2px solid white;"><p style="color:white; align-self: center; top:40%; position:absolute;">+${allImagesSize}</p></div>
		
		<%
	}
	
	if(allImages==null || counting==0){ 
		System.out.println("dd");
    %>
    	<div class="card" style="background-image:url('resources/img/real_noimages.png'); width:100%; float:left; height:100%;    background-size: 100% 100%;    border: 2px solid white;	" ></div>
    <%
	}%>

	
	
	
	
	</div>	<%
}
%>
 
			<hr>
			
			
			
		
		
		
			
			
			
			
		
		

			<!-- 메뉴 내용 -->
		<!-- start of the menu -->
		
		<section class="menu-group">
			<c:forEach var="businessMenu" items="${businessMenu}">
   				 <div class="menu-items">		
		            <span class="menu-item">${businessMenu.menu_name}</span>
		            <span class="menu-delimiter"></span>
		            <span class="menu-price">${businessMenu.menu_price}</span>
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






<div class="container-fluid" style="max-width:100%;">
<p style="font-size: 25px;">Location &amp; Hours</p>
	<div class="row">
		
		<div class="" style="width:60%;">
		
			<div class="hide_contents" id="map" style="width:100%;height:300px; margin: auto; border-radius: 10px;"></div>
			<div style="font-size:12px; margin-top:10px;">${businessDetails.getRoad_address_name()}
					<button type="button" class="btn-sm btn-secondary" style="
   			 background-color: grey; border:none;"
   			 onclick="location.href='https://map.kakao.com/link/to/${businessDetails.getPlace_name()},${businessDetails.getY()}, ${businessDetails.getX()}'">
   	   		
						길찾기
						</button>
			</div>
		</div>
		<div class="" style="width:40%;">
			<!— 영업시간 —>
	
		<div class="schedule" style="font-size: 20px; padding-left: 30px;">
				<c:forEach var="businessMenu" items="${BusinessHours}"> 
					<c:choose>
					
					<c:when test="${businessMenu.days eq dayOfWeek}">
						<p style="float:left; margin-bottom: 0px; font-weight: bold;margin-right: 15px; color:rgb(74,188,184);">${businessMenu.day_kr}</p><p style="margin-bottom: 0px; color:rgb(74,188,184);">   ${businessMenu.open} - ${businessMenu.close} TODAY</p>
					
					</c:when>
						
					<c:otherwise>
							<p style="float:left; margin-bottom: 0px; font-weight: bold;margin-right: 15px; color:grey;">${businessMenu.day_kr}</p><p style="margin-bottom: 0px;color:grey;">   ${businessMenu.open} - ${businessMenu.close}</p>
				
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
					<div id="update_button" ">
						<button type="button" class="btn btn-secondary" data-toggle="modal" data-target=".bd-example-modal-lg" style="
    background-color: rgb(74,188,184); border:none;">
							업데이트
						</button>
					</div>
				</div>
			</div>
		
		
		</div>
		<div class="col-2"></div>		
	</div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e33a2e114db527d4f3ddac5248bd0330"></script>

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
				<a id="review_ptag" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true" onclick="showReview();" style="background-color: rgb(74,188,184); border:none;">리뷰보기</a>
			</div>
		</div>
		<div class="col col14"></div>
		<div class="col col15"></div>		
	</div>
</div>

<!-- Large modal -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="width:600px;">
		<div class="modal-content" style="width:600px;">
		
		
		
    
    		<div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">수정하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <button type="button" onclick="modifysched()" style="
   		 background-color: rgb(74,188,184);	
   		 color: white;
  		 width: 116px;
  		 height: 35px;
   		 border-right-width: 0px;
		 "> 영업시간 수정</button>	
        <button type="button" onclick="editmenu()" style="
    background-color: rgb(99, 156, 154);
    color: white;
    width: 116px;
    height: 35px;
    padding-left: 7px;
    border-left-width: 0px;
"> 메뉴 수정</button>
      
        <form action="${pageContext.request.contextPath}/workingdays" method="POST" >
        	<div id="modifysched" style="
    display:none;
    margin-top: 0px;
    border: 1px solid #e0e0e0;
    padding-top: 30px;
    padding-left: 10%;
    margin-right: 1px;
    
    padding-right: 10px;
">
        	
        		<c:forEach var="businessMenu" items="${BusinessHours}"> 
      
        		${businessMenu.day_kr}요일	 <input type="text" name="open" style="
    border: none;
    background-color: #f5f5f5;
    margin-left: 10px;
    text-align: center;
    margin-top: 5px;
    color: #717070;
" value="  ${businessMenu.open}">   - <input type="text" name ="close" style="
    border: none;
    background-color: #f5f5f5;
    margin-left: 10px;
    margin-top: 5px;
    text-align: center;
    color: #717070;
" value="${businessMenu.close}"> <br/>
				</c:forEach>	
				
        		<input type="hidden" value="${businessDetails.getIdx()}" name ="business_idx" style="display:none">
        		<button type="submit" style="
    margin-top: 20px;
    margin-bottom: 20px;
    background-color: rgb(74,188,184);
    color: white;
    width: 116px;
    /* height: 35px; */
    padding-left: 2px;
    width: 85%;
    padding-top: 10px;
    border-bottom-width: 1px;
    padding-bottom: 10px;
">SUBMIT</button>
        	</div>
        </form>	
        <div id="menueditstyle" style="
    display:none;
    margin-top: 0px;
    border: 1px solid rgb(224, 224, 224);
    padding-top: 30px;
    padding-left: 14%;
    margin-right: 1px;
    padding-right: 20px;
">
          <button id="menuadd" onclick="addrow()" style="display: block;border: none;color: red;font-weight: 700;margin-left: 68%;margin-bottom: 2%;">ADD</button>
       		
         <form action="${pageContext.request.contextPath}/editmenu" method="POST">
        	<div id="editmenu" style="display:none;">
        		 <div >
        			<c:forEach var="businessMenu" items="${businessMenu}">
	        			<div class= "happy"><input name="menu" type="text" value="${businessMenu.menu_name}" style="background-color: #f5f5f5; margin-left:10px; text-align:center; margin-top:5px; color: #717070; border:none;"> 
	        				<input type="text" name="price" value="${businessMenu.menu_price}" style="background-color: #f5f5f5; margin-left:10px; text-align:center; margin-top:5px; color: #717070; border:none;"/> 
	        				<img style='width:15px' src='resources/img/delete.png'  class="delete" title="delete"/>  <br/>
	        			</div>
					</c:forEach>
					<input type="hidden" value="${businessDetails.getIdx()}" name ="business_idx" style="display:none"/>
				</div>
        	</div>
        		<button type="submit" id=submitmenu style="display: block;margin-top: 20px;margin-bottom: 20px;background-color: rgb(74, 188, 184);color: white;width: 75%;padding-top: 10px;border-bottom-width: 1px;padding-bottom: 10px;margin-left: 10px;">제출하기</button>
        </form>
        	 </div>
      </div></div>
      	
      		<!-- 모달 푸터 -->
			<div class="modal-footer">
				
			</div>     	
      	
      	
      	
      	
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

<hr>
<div class="container-fluid" id="write_review_container" style="display:none; width:70%;">
	<!-- 리뷰쓰기 -->
	<div class="row">
		<div class="col-4"></div>
		<div class="col-4" id="view_img_wrap">
			<img class="view_img" src="<c:url value="/resources/img/viewDetails/close_review.png"/>" 
				alt="" onclick="closeReview();" />
		</div>
		<div class="col-4"></div>
	</div>
	
	<div class="col" style="padding-left:15px; padding-right:15px;">
	<div style="padding-left:15px;padding-right:15px; border-bottom:1px solid gray; margin-bottom: 20px; font-size:30px;">평가하기</div>
	<div class="inputAllBox" style="padding-left:15px; padding-right:15px;">
	<div class="row" style="width:100%; padding-left:15px;padding-right:15px;" id="write_review_row">
		<div class="col-2"></div>
			<form method="post" id="insertReviewForm" enctype="multipart/form-data">
			<input type="hidden" name="user_idx" id="u_idx" value="${user_idx }"/>
			<input type="hidden" name="business_idx" id="b_idx" value="${business_idx }"/>
				<div class="grade" style="margin-bottom:10px;">
				<p class="starGrade" style="margin:0px; width:100%;">
					<a href="javascript:void(0);">★</a>
					<a href="javascript:void(0);">★</a>
					<a href="javascript:void(0);">★</a>
					<a href="javascript:void(0);">★</a>
					<a href="javascript:void(0);">★</a>
					<input type="hidden" name="rating" id="rating" value="0" />
				</p>
			</div><!-- grade -->
			<div class="insertImages">
				<div class="input_wrap">
				<label for="multiparts">업로드</label>
					<input type="file" name="multiparts" id="multiparts" multiple="multiple"/>
				</div>
				<div class="imgs_wrap"></div>
			</div><!-- insertImages -->
			<script>
			$(document).ready(function(){
				//input images
				$("#multiparts").on("change", handleImgFileSelect);
				});
			function fileimgAction(){
					$("#multiparts").trigger('click');
				}

			function handleImgFileSelect(e) {
				//이미지 정보 초기화
				var sel_files = [];
				$(".imgs_wrap").empty();

				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);

				if(files.length > 5){
			          alert("이미지는 최대 5개까지 업로드 가능");
			          $("input[type='file']").val("");
			          return false;
			       }
				var index = 0;
				filesArr.forEach(function(f) {
							if (!f.type.match("image.*")) {
								alert("이미지 파일을 선택해주세요!");
								$("input[type='file']").val("");
								return;
							}

							sel_files.push(f);
							
							var reader = new FileReader();
							reader.onload = function(e) {
								var html = "<img src=\""+e.target.result+"\" style='width:190px; height:190px; margin:10px;'/>";
								$('.imgs_wrap').append(html);
							}
							reader.readAsDataURL(f);
						});
				
			}
			</script>
				<div class="insertReview">
				<textarea name="content" id="content" placeholder=" 후기를 입력해주세요!"></textarea>
			<div style="text-align: end;"><input type="submit" id="insertBtn" value="작성" /></div>
				</div>
			</form>
					
			<script>
         $(function(){
            $("#insertBtn").click(function(event){
               event.preventDefault();

               var form = $('#insertReviewForm')[0];
               var data = new FormData(form);
               
               $("#insertBtn").prop("disabled", false);

               $.ajax({
                  type:"POST",
                  enctype: 'multipart/form-data',
                  url: "insertReview",
                  data: data,
                  dataType: 'json',
                  processData: false,
                  contentType: false,
                  //async: false,
                  success: function(data){
                    console.log("댓글 작성 완료");
                    console.log(data);

                    var html = '';
                    var imageStr = data.images;
                    var imageArray = imageStr.split('&');
                    
					if(data.contentError == "empty"){
						alert("내용을 입력하세요.");
					}else if(data.ratingError == -1){
						alert("별점을 입력하세요.");
					}else{

						var nameCompare = "<%=request.getAttribute("nameCompare").toString()%>";
						if(nameCompare!="ssibal"){
							if(nameCompare=="sns_login"){

								 html = "<table style='width:100%; margin-bottom:30px;'>"
			                          + "<tr><td rowspan='2' style='width:10%'><img src='" + data.profile_img + "'"
			                          + "style='width:60px; height:60px;  border-radius: 50px; margin:0 20% 0 20%;'/></td>"
			                          + "<td style='font-size:18px; padding-left:10px;width:70%;'><p style='margin-bottom: -19px;'><b>" + data.id + "</b></p></td>"
			                          + "<td style='text-align: center; width:25%;'>" + data.date + "</td></tr>"
			                          + "<tr><td id='ratings' colspan='2' style='padding-left:8px;'><span style='margin-bottom: 14px;margin-top: 8px;'>";
			                  }else{
			
			                	  html = "<table style='width:100%; margin-bottom:30px;'>"
			                          + "<tr><td rowspan='2' style='width:10%'><img src='resources/img/" + data.profile_img + "'"
			                          + "style='width:60px; height:60px;  border-radius: 50px; margin:0 20% 0 20%;'/></td>"
			                          + "<td style='font-size:18px; padding-left:10px;width:70%;'><p style='margin-bottom: -19px;'><b>" + data.id + "</b></p></td>"
			                          + "<td style='text-align: center; width:25%;'>" + data.date + "</td></tr>"
			                          + "<tr><td id='ratings' colspan='2' style='padding-left:8px;'><span style='margin-bottom: 14px;margin-top: 8px;'>";
			                  }
							}


                       
                       for(var r = 1; r <= data.rating; r++){
	                       html += "<img src='resources/img/oneStar.png' style='width:20px;'/>";
                       }
					html += "</span></td></tr>"
                    + "<tr><td></td><td colspan='2' style='padding-left:5px;'>"
                    + data.content + "</td></tr>"
                    + "<tr><td></td><td colspan='2'><span style='margin-left: 10px;'>";
                    for(var i = 0; i < imageArray.length; i++){
                        if(imageArray[i] != ""){
	                       html += "<img style='width:100px; height:100px; margin-right: 10px;' src='resources/img/"+ imageArray[i] + "'/>";
                        }
                    }
                    html += "</span></td></tr></table><hr>";
                    $('div .reviewSection').prepend(html);
					} /*else end*/
                    var review_count = data.review_count;
                    $(".allCount").text(review_count + " Reviews");
                    
                    if(review_count > 0){
						$("#newRecordImg").empty();
                        }
                    $("input[type='file']").val("");
                    $("#rating").val("");
                    $("#content").val("");
                    $(".imgs_wrap").empty();
                    $(".starGrade a").parent().children("a").removeClass("on");
                    $("#review_register").prop("disabled", false);
                     
                  },   //data-success
                  error: function(e){
                     console.log("에러 발생", e);
                     $("#insertBtn").prop("disabled", false);
                     }
                  });      //data-ajax

               
               
               });   //click-event

            });   //function
      </script>
		<div class="col-2"></div>
	</div><!-- row end -->
	</div> <!-- inputAllBox -->
	</div><!-- col8 end -->
	
	<div class="reviewContainer" >
		<div class="allCount" style="margin:20px 0px; border-bottom:1px solid gray">${review_count } Reviews</div>
	<div class="reviewSection" id="reviewContent">
      <c:choose>
      	<c:when test="${review_count eq 0 }">
      		<div id="newRecordImg"><img src="resources/img/newRecord2.jpg" style="width:60%; margin-left: 20%;"/></div>
      	</c:when>
      	<c:otherwise>
   		<c:forEach var="review" items="${review }" varStatus="i">
      <input type="hidden" name="idx" value="${review.idx }"/>
      <input type="hidden" name="review_uidx" value="${review.user_idx }"/>
      <div class="tableDiv" id="${i.index }">
         <table class="reviewTable" id="example" style="width:100%; margin-bottom:30px;">
            <tr>
               <td rowspan="2" style="width:10%">
               
               
               <c:choose>
                     <c:when test="${review.name eq 'sns_login'}">
                        <img  style="width:60px; height:60px;  border-radius: 50px; margin:0 20% 0 20%;" src="${review.profile_img }">
                     </c:when>
                     <c:otherwise>
                        <img  style="width:60px; height:60px; border-radius: 50px; margin:0 20% 0 20%;" src="resources/img/${review.profile_img }">
                     </c:otherwise>
                </c:choose>
               </td>
               
               <td style="font-size:18px;  padding-left:10px; width:70%"><p style="margin-bottom: -19px;"><b>${review.id }</b></p></td>
               <td style="text-align: center; width:25%;">${review.date }</td>
            </tr>
            <tr>
               
               <td colspan="2" style="padding-left:8px;"><span style="margin-bottom: 14px;margin-top: 8px;"><c:forEach begin="1" end="${review.rating }">
 
               <img src="resources/img/oneStar.png" style="width:20px;"/></c:forEach></span></td>
               
            </tr>
            <tr>
               <td></td>
               <td colspan="2" style="padding-left:10px;">${review.content }</td>
            </tr>
            <tr>
               <td></td>
               <td colspan="2">
               <c:if test="${review.images ne null }">
               <span style="margin-left: 10px;">
                  <c:forEach items="${fn: split(review.images, '&') }" var="images">
                  <img style="width:100px; height:100px; margin-right: 5px;" src="resources/img/${images }" id="${images }" class="imgModal"/>
                  
                  </c:forEach>
                 </span>
               </c:if>
               </td>
            </tr>
         <c:if test="${user_idx ne review.user_idx }">
               <tr>
                  <td colspan="2" style="text-align: end;" id="reviewCount[${review.idx }]">${review.total_likes }</td>
                  <td style="text-align: center;">
                     <c:if test="${review.likes eq 1 }">
                     <a href="javascript:void(0);" id="${review.idx }" style="text-align: left;" class="likesBtn done">♥</a>
                     <span style="color:gray; margin-left:10px; width:25%;">도움이 됐어요!</span>
                     <input type="hidden" name="likes[${review.idx}]" id="likesValue" value="${review.likes }"/>
                     </c:if>
                     <c:if test="${review.likes eq 0 }">
                     <a href="javascript:void(0);" id="${review.idx }" style="text-align: left;" class="likesBtn">♥</a>
                     <span style="color:gray; margin-left:10px; width:25%;">도움이 됐어요!</span>
                     <input type="hidden" name="likes[${review.idx}]" id="likesValue" value="${review.likes }"/>
                     </c:if>
                  </td>
               </tr>
         </c:if>
         </table>
         <hr>
         </div>
         </c:forEach>

         </c:otherwise>
         </c:choose>

      </div>
</div>
<!-- The Modal -->
   <div id="myModal" class="modal_img">
   
     <!-- The Close Button -->
     <span class="close">&times;</span> 

     <!-- Modal Content (The Image) -->
     <img class="modal-ImgContent " id="imgModal">

   </div>  
      
   <script>
   var modal = document.getElementById("myModal");
   var span = document.getElementsByClassName("close")[0];
   span.onclick = function() { 
        modal.style.display = "none";
      }
   
   $(function(){
	 //이미지 modal
	   $(".imgModal").click(function(e){
	      e.preventDefault();
	      var imgSrc = $(this).attr("id");
	      var modalImg = document.getElementById("imgModal");
	      modal.style.display = "block";
	      modalImg.src = "resources/img/" + imgSrc;
	      })
	   $(".close").click(function(){
	      $("#myModal").hide();

	      })
	   
      //좋아요
      //session으로 받아옴(현재 사용자)
      var user_idx = $("input[name='user_idx']").val();
      var business_idx = $("input[name='business_idx']").val();
      
      $(".likesBtn").click(function(){
         var review_idx = $(this).attr("id");
         var reviewCount = $("td[id='reviewCount["+review_idx+"]']").text();
         
         $(this).toggleClass("done");
      
         if($(this).hasClass("done")){
            $("input[name='likes[" + review_idx + "]']").val(1);
            }else{
            $("input[name='likes[" + review_idx + "]']").val(0);
            }
         var value = $("input[name='likes[" + review_idx + "]']").val();
         var likesData = {"user_idx": user_idx, "business_idx": business_idx, "review_idx":review_idx, "value":value, "review_rating":reviewCount};

         $.ajax({
            url: "likes",
            type: "POST",
            data: likesData,
            success: function(likesData){
                  console.log("좋아요!");
                  //alert(review_rating);
                  if(likesData.value == 1){
                     $("a[id='likes[" + likesData.review_idx + "]']").css('color', '#db2d21');
                     var review_rating = likesData.review_rating;
                     //alert("플러스 "+review_rating);
                     $("td[id='reviewCount["+review_idx+"]']").text(review_rating);
                  }else if(likesData.value == 0){
                     $("a[id='likes[" + likesData.review_idx + "]']").css('color', 'gray');
                     var review_rating = likesData.review_rating;
                     //alert("마이너스 " + review_rating);
                     $("td[id='reviewCount["+review_idx+"]']").text(review_rating);
                  }
               },
               error:function(e){
                  console.log("에러 발생", e);
                  }
            });
               
            });
         
         
      });
   
   </script>
	<script src="resources/js/jquery.simpleLoadMore.min.js"></script>
	<script>
	$(document).ready(function(){
		$('.reviewSection').simpleLoadMore({
			  item:'div',
			  count: 5,
			  btnHTML: '<div class="moreReview" style="margin: 50px auto; text-align:center;">'
				  +'<button class="btn btn-success" style="width: 30%; height:50px; font-size:20px; color:rgb(74, 188, 184); background-color:white; border-color:rgb(74, 188, 184);">'
				  +'VIEW MORE</button></div>',
			  cssClass: 'load-more',
			  itemsToLoad: 5
			});
		});
	
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
	</div>
	
	
	
	
	
	
</div><!-- container-fluid -->


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