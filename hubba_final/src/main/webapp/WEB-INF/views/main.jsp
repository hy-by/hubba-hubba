<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page session="false" %>
<html>
<head>
   <title>hubba hubba</title>
   
   <link rel="shortcut icon" href="resources/img/real_favi.ico">

   <link rel="stylesheet" 
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
   crossorigin="anonymous"/>
   <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" type="text/css"/>
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">   
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
   crossorigin="anonymous"></script>
   <script src="<c:url value="/resources/js/main.js"/>"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
   crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" 
   crossorigin="anonymous"></script>
   <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
  <script type="text/javascript">

	$(document).ready(function(){ 
		$('.review_wrap').click(function() { 
	
			var user_idx ="<%=request.getAttribute("idx")%>";
			
			
			if(user_idx=="notLogin"){
			   alert("리뷰보기는 로그인 후 확인 가능합니다. \n로그인 하시겠습니까?");
			   location.href="login";
			}else{
			   //alert($(this).attr("business_idx"));
			   location.href="categoryDetail?idx=" + $(this).attr("business_idx");
			}
	
	
			}); 
		});

</script> 
   
    
   
   
   
   
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
<style>
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
.snip1566 {
  position: relative;
  max-width: 190px;
  width: 100%;
  color: #white;
  font-size: 16px;
  box-shadow: none !important;
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
}

.snip1566 *,
.snip1566:before,
.snip1566:after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.3s linear;
  transition: all 0.3s linear;
}

.snip1566:before,
.snip1566:after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  border-radius: 50%;
  content: '';
  position: absolute;
  top: 0px;
  bottom: 0px;
  left: 0px;
  right: 0px;
  z-index: -1;
  border: 2px solid rgb(74,188,184);
  border-color: transparent rgb(74,188,184);
}

.snip1566 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: middle;
  border-radius: 50%;
}

.snip1566 figcaption {
  position: absolute;
  top: 5px;
  bottom: 5px;
  left: 5px;
  right: 5px;
  opacity: 0;
  background-color: rgb(74,188,184);
  border-radius: 50%;
}

.snip1566 i {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  font-size: 4em;
  z-index: 1;
}

.snip1566 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}

.snip1566:hover figcaption,
.snip1566.hover figcaption {
  opacity: 1;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}



.snip1566:hover:before,
.snip1566.hover:before {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

.snip1566:hover:after,
.snip1566.hover:after {
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}
#category_hide_h1 {
   margin-top:38%;
   color:white;
}
</style>
<script>
$(".hover").mouseleave(
        function () {
          $(this).removeClass("hover");
        }
      );
</script>
</head>

<body style="font-family: 'MapoPeacefull';">






<!-- 헤더 -->
<div>
   <%@include file = "header1.jsp" %>
</div>


<!-- 카테고리 -->
<div class="container-fluid" id="category_container">
   <div class="row category_wrap" style="margin-top:200px;">
      <div class="col-1 category_col"></div>
      <div class="col-lg-2 category_col">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_restaurant.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("음식점","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("음식점","UTF-8")%>'">restaurant</h1>
           </figcaption>
         </figure>      
      </div>
      <div class="col-lg-2 category_col">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_cafe.png"/>" 
               onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("카페","UTF-8")%>'"/>
           <figcaption>
             <h1  onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("카페","UTF-8")%>'">cafe</h1>
           </figcaption>
         </figure>
      </div>
      <div class="col-lg-2 category_col">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_hotel.png"/>" 
               onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("숙박","UTF-8")%>'" />
           <figcaption>
             <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("숙박","UTF-8")%>'">hotel</h1>
           </figcaption>
         </figure>      
      </div>
      <div class="col-lg-2 category_col">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_hospital.png"/>" 
               onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("병원","UTF-8")%>'" />
           <figcaption>
             <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("병원","UTF-8")%>'">hospital</h1>
           </figcaption>
         </figure>   
      </div>
      <div class="col-lg-2 category_col">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_drugstore.png"/>" 
               onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("약국","UTF-8")%>'" />
           <figcaption>
             <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("약국","UTF-8")%>'">drugstore</h1>
           </figcaption>
         </figure>      
      </div>
      <div class="col-1 category_col"></div>
   </div>
   <div class="row category_wrap" style="margin-bottom:20%;">
      <div class="col-1 category_col2"></div>
      <div class="col-2 category_col2">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_subway.png"/>" 
               onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("지하철","UTF-8")%>'" />
           <figcaption>
             <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("지하철","UTF-8")%>'">subway<br/>station</h1>
           </figcaption>
         </figure>         
      </div>
      <div class="col-2 category_col2">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_parking.png"/>" 
               onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("주차장","UTF-8")%>'" />
           <figcaption>
             <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("주차장","UTF-8")%>'">parking<br/>lot</h1>
           </figcaption>
         </figure>          
      </div>
      <div class="col-2 category_col2">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_gasStation.png"/>" 
               onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("주유소","UTF-8")%>'" />
           <figcaption>
             <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("주유소","UTF-8")%>'">gas<br/>station</h1>
           </figcaption>
         </figure>             
      </div>
      <div class="col-2 category_col2">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_bank.png"/>" 
               onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("은행","UTF-8")%>'" />
           <figcaption>
             <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("은행","UTF-8")%>'">bank</h1>
           </figcaption>
         </figure>         
      </div>
      <div class="col-2 category_col2">
         <figure class="snip1436">
            <img src="<c:url value="/resources/img/main/category_etc.png"/>" 
               />
           <figcaption>
             <h1 onclick="view_more_category();" style="color:black;">more category</h1>
           </figcaption>
         </figure>             
      </div>
      <div class="col-1 category_col2"></div>
      <div id="hide_line"></div>
   </div>
</div>

<!-- 카테고리 숨김(클릭시 보이기) -->
<div class="container-fluid" id="hide_container">
   <div class="row row-cols-11" style="margin-top:15%; margin-bottom:5%;">
      <div class="col categoryCOL" ></div>   
      <div class="col categoryCOL">  
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_restaurant.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("음식점","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("음식점","UTF-8")%>'">restaurant</h1>
           </figcaption>
         </figure>                  
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_cafe.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("카페","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("카페","UTF-8")%>'">cafe</h1>
           </figcaption>
         </figure>     
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_hotel.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("숙박","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("숙박","UTF-8")%>'">hotel</h1>
           </figcaption>
         </figure>         
      </div>
      <div class="col categoryCOL">
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_hospital.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("병원","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("병원","UTF-8")%>'">hospital</h1>
           </figcaption>
         </figure>   
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_drugstore.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("약국","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("약국","UTF-8")%>'">drugstore</h1>
           </figcaption>
         </figure>       
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_subway.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("지하철","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("지하철","UTF-8")%>'">subway<br/>station</figcaption>
         </figure>           
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_parking.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("주차장","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("주차장","UTF-8")%>'">parking<br/>lot</h1>
           </figcaption>
         </figure>             
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_gasStation.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("주유소","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("주유소","UTF-8")%>'">gas<br/>station</figcaption>
         </figure>                  
      </div>
      <div class="col categoryCOL">
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_bank.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("은행","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("은행","UTF-8")%>'">bank</h1>
           </figcaption>
         </figure>         
      </div>
      <div class="col categoryCOL"></div>
   </div>
   
   <!-- 두번째줄!!! -->
   <div class="row row-cols-11" style="margin-bottom:15%;">
      <div class="col categoryCOL" ></div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_convenientStore.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("편의점","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("편의점","UTF-8")%>'">convenient<br/>store</h1>
           </figcaption>
         </figure>  
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_school.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("학교","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("학교","UTF-8")%>'">school</figcaption>
         </figure>        
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_academy.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("학원","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("학원","UTF-8")%>'">academy</h1>
           </figcaption>
         </figure>    
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_kindergarten.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("유치원","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("유치원","UTF-8")%>'">kinder<br/>garten</h1>
           </figcaption>
         </figure>         
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_tourism.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("관광명소","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("관광명소","UTF-8")%>'">tourism</h1>
           </figcaption>
         </figure>     
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_culture.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("문화","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("문화","UTF-8")%>'">culture</h1>
           </figcaption>
         </figure>    
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_realEstatue.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("중개업소","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("중개업소","UTF-8")%>'">real<br/>estatue</h1>
           </figcaption>
         </figure>            
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_govermentOffice.png"/>" 
                     onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("공공기관","UTF-8")%>'" />
           <figcaption>
            <h1 onclick="location.href='${pageContext.request.contextPath}/category?category_group_name=<%=URLEncoder.encode("공공기관","UTF-8")%>'">goverment<br/>office</h1>
           </figcaption>
         </figure>        
      </div>
      <div class="col categoryCOL" >
         <figure class="snip1">
            <img src="<c:url value="/resources/img/main/category_etc.png"/>" 
                     />
           <figcaption>
            <h1>go<br/>popular<br/>category</h1>
           </figcaption>
         </figure>   
      </div>
      <div class="col categoryCOL" ></div>
   </div>
   
</div>



<!-- 회사소개 -->

<img style='width:100%' src='resources/img/intro.png'/>





<!-- 리뷰 -->
<div class="container-fluid" id="review_container">

   <div id="carouselExampleControls2" class="carousel slide" data-ride="carousel">
     <div class="carousel-inner" id="carousel_wrap">
    
       <div class="carousel-item active">
            <div class="row">
       
            <c:forEach var="review" items="${review_list }" begin="0" end="3">
             <div class="col-3 review_wrap" business_idx="${review.business_idx }" onclick="review_wrap_btn()">
                  <div class="review_profile">
                  <c:if test="${review.images ne null }">
                  	<c:forEach items="${fn: split(review.images, '&')[0] }" var="images">
                  	<img class="review_img" src="<c:url value="resources/img/${images}"/>"/>
                  	</c:forEach>
                  	</c:if>
               </div>
               <div class="review_stars">
	               	<c:forEach begin="1" end="${review.rating }">
	               		<img src="resources/img/full_star.png" class="stars" style="width:20px;"/>
	               	</c:forEach>
               </div>
               <div class="review_name">
                  <p class="review_shop">${review.place_name }</p>
                  <p class="review_id"><i>${review.id }</i></p>
               </div>               
               <div class="review_contents">
                  <p>${review.content }</p>
               </div>
             </div>
             
          </c:forEach>
       
          </div>
       </div>
       
       
      
      <div class="carousel-item">
            <div class="row">
            <c:forEach var="review" items="${review_list }" begin="4" end="7">
             <div class="col-3 review_wrap" business_idx="${review.business_idx }" onclick="review_wrap_btn()">
                  <div class="review_profile">
                  	<c:if test="${review.images ne null }">
                  	<c:forEach items="${fn: split(review.images, '&')[0] }" var="images">
                  	<img class="review_img" src="<c:url value="resources/img/${images}"/>"/>
                  	</c:forEach>
                  	</c:if>
               </div>
               <div class="review_stars">
	               	<c:forEach begin="1" end="${review.rating }">
`	               		<img src="resources/img/full_star.png" class="stars" style="width:20px;"/>
	               	</c:forEach>
               </div>
               <div class="review_name">
                  <p class="review_shop">${review.place_name }</p>
                  <p class="review_id"><i>${review.id }</i></p>
               </div>               
               <div class="review_contents">
                  <p>${review.content }</p>
               </div>
             </div>
             
          </c:forEach>
       
          </div>
       </div>
       
       
       
       <div class="carousel-item">
            <div class="row">
       
            <c:forEach var="review" items="${review_list }" begin="8" end="11">
             <div class="col-3 review_wrap" business_idx="${review.business_idx }" onclick="review_wrap_btn()">
                  <div class="review_profile">
                  	<c:if test="${review.images ne null }">
                  	<c:forEach items="${fn: split(review.images, '&')[0] }" var="images">
                  	<img class="review_img" src="<c:url value="resources/img/${images}"/>"/>
                  	</c:forEach>
                  	</c:if>
               </div>
               <div class="review_stars">
	               	<c:forEach begin="1" end="${review.rating }">
	               		<img src="resources/img/full_star.png" class="stars" style="width:20px;"/>
	               	</c:forEach>
               </div>
               <div class="review_name">
                  <p class="review_shop">${review.place_name }</p>
                  <p class="review_id"><i>${review.id }</i></p>
               </div>               
               <div class="review_contents">
                  <p>${review.content }</p>
               </div>
             </div>
             
          </c:forEach>
       
          </div>
       </div>
        
     </div>
     <a class="carousel-control-prev arrow_img" href="#carouselExampleControls2" role="button" data-slide="prev">
      <img class="reivew_img" src="<c:url value="/resources/img/main/review_left.png"/>"/>
     </a>
     <a class="carousel-control-next arrow_img" href="#carouselExampleControls2" role="button" data-slide="next">
      <img class="reivew_img" src="<c:url value="/resources/img/main/review_right.png"/>"/>
     </a>
   </div>
   
</div>

   
<img style='width:100%' src='resources/img/main.png'/>
 
<!--  위로 이동하는 버튼 -->
<div class="container-fluid">
   <div class="row">
      <div class="col-5 .d-md-none .d-lg-block"></div>
      <div class="col-2" style="text-align:center;">

      </div>
      <div class="col-3 .d-md-none .d-lg-block"></div>
      <div class="col-2 .d-md-none .d-lg-block">
             <a href="#carouselExampleControls"><img id="go_up_btn" src="<c:url value="/resources/img/crock2.png"/>"/></a><br/>
         <p style="font-size:1.5rem;"></p>
      </div>
   </div>
</div>





<!-- 푸터 -->
<div>
   <%@include file = "footer.jsp" %>
</div>




</body>
</html>
