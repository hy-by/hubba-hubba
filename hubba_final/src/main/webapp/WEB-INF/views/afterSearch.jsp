<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hubba hubba | search</title>
   <link rel="shortcut icon" href="resources/img/real_favi.ico">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/category.css"/>" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<style type="text/css">
	.list_body_mh{
	padding: 2% 15%;
	}
	.img-list {
          margin:0 auto;
        }

        .img-list ol,
        .img-list ul {
          list-style:none;
        }

        .img-list-gutter {
          padding:0;
        }

        .img-list-item {
          border-bottom:1px solid #c2c2c2;
          padding-bottom:2em;
          margin-bottom:2em;
        }

        .img-list-text {
          padding: 1em 0;
        }

        @media (min-width:600px) {

          .image-list-gutter {
            display:table;
          }

          .img-list-image,
          .img-list-text {
            display:table-cell;
            vertical-align:top;
          }

          .img-list-text {
            padding: 0 0 0 38px;
          }

          .img-list-image {
            min-width:280px;
          }

          .img-list-src {
            width:100%;
            max-width:356px;
          }

        }

        @media (min-width:764px) {

          .img-list-text {
            padding: 0 0 0 48px;
          }

          .img-list-image {
            min-width:356px;
            max-width:356px;
          }

        }
        
		:root{
		
		  --btn: #3eb0ef;
		}
#view_info img {
   margin-right:7px;
}
#view_btn {
   width: 100px;
    font-size: 16px;
    background-color: #969696;
    border: #969696;
    height: 36px;
}
#view_btn:hover {
   background-color:#565555;
   border: #565555;
   cursor:pointer;
}
.img-list-src {
   height:250px;
}

		
#test-btn{
   border: 0;
    border-radius: 3px;
    background-color: #969696;
    padding: 7px 10px;
    width: 100px;
    color: white;
    cursor: pointer;
    font-size: 16px;
}

#test-btn:hover{
  opacity: 0.7;
}
#contents_wrap {
   padding:15px;
}
#contents_wrap:hover {
   color:rgb(74,188,184);
   cursor:pointer;
   box-shadow: 0px 0px 10px #e7e7e7;   
}		

.review_imgs{
	width: 351px;
	height:250px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	type="text/javascript"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7d066210e1cf222ef85fb9ea1746bba"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
</head>
<%@include file="header2.jsp"%>
<body style="font-family: 'MapoPeacefull';">
	<!-- start of map display -->
<div id="map" style="width:75%;height:500px;margin-bottom:3%; margin-top:3%; float:left; margin-left:15%;"></div>
<script>

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng('${latitude}', '${longitude}'), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [
			<c:forEach var="list" items="${list}">
			    {
					title: '${list.place_name}',
			        latlng: new kakao.maps.LatLng('${list.y}', '${list.x}')
			    },
			</c:forEach>
			];
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		//var imageSrc = "resources/img/markeStar.png";
		for (var i = 0; i < positions.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		   	var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		
	//alert("!!");
	</script>

	<!-- end of map display -->
	<!-- start of list(places) display -->
	<div style=" width: 73%;margin: 4% auto;">
		<section class="img-list">
			<ol class='img-list-parent'>
				<c:forEach var="list" items="${list }">
					<input type="hidden" id="x" value="${list.x }" />
					<input type="hidden" id="y" value="${list.y }" />
					<li class='img-list-item'>
						<div class='img-list-gutter'>
							<div class='img-list-image'>
								<c:choose>
								<c:when test="${list.images ne null }">
									<c:forEach items="${fn: split(list.images, '&')[0] }" var="images">
	                  				<img  class="review_imgs" src="<c:url value="resources/img/${images}"/>"/>
	                  				</c:forEach>
                  				</c:when>
                  				<c:otherwise>
                  					<img class="review_imgs" src="<c:url value="resources/img/huba.png"/>"/>
                  				</c:otherwise>
                  				</c:choose>
                  				
							</div>
							<div class='img-list-text' style="width: 100%;">
								<div style='height: 40px;'>
									<div style='float: left;'>
										<h2 style='margin-bottom: 10px;'>${list.place_name }</h2>
									</div>
									<div style='float: right;'>
										<button style=" font-size:15px;   height: 36px; width: 101px" type="button" class="btn btn-secondary"
										onclick="location.href='${pageContext.request.contextPath }/categoryDetail?idx=${list.idx }'">Read More</button>
									</div>
									
								</div>
								

						<div id="view_info">
                           <p><img style='width: 26px;'
                                 src='resources/img/full_star.png'>${list.review_rating }</p>
                           <p>
                              <img style='width: 26px;'
                                 src='resources/img/calendar_blue.png'>TODAY | ${list.today }</p>
                           <p>
                              <img style='width: 26px' src='resources/img/marker_basic.png'>${list.road_address_name }</p>
                           <p>
                              <img style='width: 26px' src='resources/img/phone_green.png'>${list.phone }</p>
                        </div>
								
							</div>
						</div>
					</li>
				</c:forEach>
			</ol>
		</section>
	</div>
	<script src="resources/js/jquery.simpleLoadMore.min.js"></script>
	<script>
	$(document).ready(function(){
		$('.img-list-parent').simpleLoadMore({
			  item:'li',
			  count: 10,
			  btnHTML: '<div class="moreReview" style="margin: 50px auto; text-align:center;">'
				  +'<button class="btn btn-success" style="width: 30%; height:50px; font-size:20px; color:rgb(74, 188, 184); background-color:white; border-color:rgb(74, 188, 184);">'
				  +'VIEW MORE</button></div>',
			  cssClass: 'load-more',
			  itemsToLoad: 5
			});
		});
	</script>



	<!-- end of list(places) display -->
</body>
<%@include file="footer.jsp"%>
</html>
