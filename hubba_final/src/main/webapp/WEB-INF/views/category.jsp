<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@page import="com.hubba.vo.BusinessVO"%>
<%@page import="java.util.List"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clicked category</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/category.css"/>" type="text/css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
.list_body_mh{
   margin:2% 5% 0 5%;
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
#test-btn{
   border: 0;
    border-radius: 3px;
    background-color: #969696;
    padding: 7px 10px;
    width: 120px;
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
</style>



</head>
<body style="font-family: 'MapoPeacefull';">

<!-- 헤더 -->
<div>
   <%@include file = "header2.jsp" %>
</div>

<div class="container-fluid" style="padding:0px;">
   <div class="row">
      <div class="col" style="padding:0px;">
         
         <div id="map" style="width:75%;height:500px; float:left; margin-left:15%;"></div>
         &nbsp;
         <!-- 지도 -->
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=카카오키값"></script>
         
         <script>
            <%
            List<BusinessVO> list = (List<BusinessVO>)request.getAttribute("category_list");
            
            %>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = { 
                    center: new kakao.maps.LatLng(<%=list.get(0).getY()%>,<%=list.get(0).getX()%>), // 지도의 중심좌표
                    level: 4 // 지도의 확대 레벨
                };
            
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            var iwContent = '<div style="padding:5px;"><p style="font-size:18px;margin-bottom: 0;"><%=list.get(0).getPlace_name()%></p><br><a href="https://map.kakao.com/link/map/<%=list.get(0).getPlace_name()%>,<%=list.get(0).getY()%>,<%=list.get(0).getX()%>" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/<%=list.get(0).getPlace_name()%>,<%=list.get(0).getY()%>,<%=list.get(0).getX()%>" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            iwPosition = new kakao.maps.LatLng(<%=list.get(0).getY()%>,<%=list.get(0).getX()%>); //인포윈도우 표시 위치입니다

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            position : iwPosition, 
            content : iwContent 
        });
        
            
            var imageSrc = 'resources/img/markerwithcrown.png', // 마커이미지의 주소입니다    
                imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
                imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.


              
                  
            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                markerPosition = new kakao.maps.LatLng(<%=list.get(0).getY()%>,<%=list.get(0).getX()%>); // 마커가 표시될 위치입니다
            
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition, 
                image: markerImage // 마커이미지 설정 
            });
            
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
            infowindow.open(map, marker);   
         </script>

      </div> <!-- map col end -->
   </div> <!-- map row end -->
</div> <!-- map container end -->

<!-- 카테고리 목록 -->
<div class="container-fluid">
   <div class="row">
      <div class="col-1"></div>
      <div class="col-10">
         <div class='list_body_mh'>
            <section class="img-list">
               <ol class='img-list-parent results'></ol>   
            </section>
         </div>                  
      </div> <!-- category col end -->
      <div class="col-1"></div>
   </div> <!--  category row end -->
</div> <!-- category container end -->
    








<script type="text/javascript">
   var start = 0;
   var limit = 10; 
   var reachedMax=false;

   $(window).scroll(function(){
         if($(window).scrollTop()==$(document).height() - $(window).height())
         getData(); 
      });
   
   $(document).ready(function(){
          //alert('callgetData');
         getData();
   });
   
    
   function getData(){
      //alert("${category_group_name}");
      if(reachedMax)
         return; 

      
      
      $.ajax({
         url:'${pageContext.request.contextPath}/json?start='+start,
         method:'GET',
         dataType: 'json',
         cache: false,
         data:{
            getData:1,
/*                 start:start,
*/                limit: limit,
                category_group_name:"${category_group_name}"
         },

         success:function(response){
            if(response==null){
               reachedMax=true;
               }
            else{
                start+=limit;
                var url = "${pageContext.request.contextPath}/admin";
                $.each(response, function(idx,val){
                var info = "location.href='${pageContext.request.contextPath}/categoryDetail?idx="+val.idx+"'";
                var str=val.today;
				
				if(str==null){
					str="";
					}

                   //console.log(idx + " " + val.place_name);
                   $(".results").append("<li class='img-list-item'><div class='img-list-gutter' id='contents_wrap'><div class='img-list-image'><img class='img-list-src' src='resources/img/"+val.images+"' style='height:250px;'></div>"
                       
                         +"<div class='img-list-text' style='width:100%; padding:1%; padding-left:3%;'><div style='height:40px;'><div style='float: left;'><h1 style='margin-bottom: 10px;'>"+val.place_name+"</h1></div>"
                         +"<div style='height:40px; float:right; margin-bottom:3px;'><button id='test-btn' onclick="+info+">Read more</button></div></div><div style='width:100%;'><h4>"
                         +"<div style='height:28px; margin-bottom:5px; margin-top:5px;'><img style=' width: 26px; float:left; margin-right:5px;' src='resources/img/full_star.png'><p style='font-size:21px; color:#5f5f5f;'>"+val.review_rating+"</p></div>"
                         +"<div style='height:28px; margin-bottom:5px;'><img style=' width: 26px; float:left; margin-right:5px;' src='resources/img/calendar_blue.png'><p style='font-size:21px; color:#5f5f5f;'>"+str+"</p></div>"
                         +"<div style='height:28px; margin-bottom:5px;'><img style=' width: 26px; float:left; margin-right:5px;' src='resources/img/marker_basic.png'><p style='font-size:21px; color:#5f5f5f;'>"+val.road_address_name+"</p></div>"
                         +"<div style='height:28px; margin-bottom:5px;'><img style=' width: 26px; float:left; margin-right:5px;' src='resources/img/phone_green.png'><p style='font-size:21px; color:#5f5f5f;'>"+val.phone+"</p></div>"
                        
                         +"</div></div></div></li>");
                      });

                //alert(start)
                
                //console.log(JSON.stringify(response));
                
                
                //$(".results").append(response);
                
                }
             
          
          },
         error:function(request,status,error){
            
         }
      });
   }
</script>


 
<!-- 푸터-->
<div>
   <%@include file = "footer.jsp" %>
</div>

</body>
</html>