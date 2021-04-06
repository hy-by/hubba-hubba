<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 회사소개 -->
       <meta http-equiv="x-ua-compatible" content="ie=edge">
       <title>Business HTML-5 Template </title>
       <meta name="description" content="">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="manifest" href="site.webmanifest">


<!-- CSS here -->
   <link rel="stylesheet" href="<c:url value="/resources/assets/css/bootstrap.min.css"/>" type="text/css"/>
   <link rel="stylesheet" href="<c:url value="/resources/assets/css/themify-icons.css"/>" type="text/css"/>   
   <link rel="stylesheet" href="<c:url value="/resources/assets/css/slick.css"/>" type="text/css"/>   
   <link rel="stylesheet" href="<c:url value="/resources/assets/css/style.css"/>" type="text/css"/> 
   
     
     


</head>
<body>


<!-- 회사소개 -->


<!--? Testimonial Start -->
<div class="testimonial-area testimonial-padding" >
    <div class="container ">
        <div class="row d-flex justify-content-center">
            <div class="col-xl-10 col-lg-10 col-md-9">
                <div class="h1-testimonial-active">
                    <!-- Single Testimonial -->
                    <div class="single-testimonial text-center">
                        <!-- Testimonial Content -->
                        <div class="testimonial-caption ">
                            <div class="testimonial-top-cap">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink"
                                width="67px" height="49px">
                                <path fill-rule="evenodd"  fill="rgb(74,188,184)"
                                d="M57.053,48.209 L42.790,48.209 L52.299,29.242 L38.036,29.242 L38.036,0.790 L66.562,0.790 L66.562,29.242 L57.053,48.209 ZM4.755,48.209 L14.263,29.242 L0.000,29.242 L0.000,0.790 L28.527,0.790 L28.527,29.242 L19.018,48.209 L4.755,48.209 Z"/>
                                </svg>
                                <p class='fadein'>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis por incididunt ut labore et dolore mas. </p>
                            </div>
                            <!-- founder -->
                            <div class="testimonial-founder d-flex align-items-center justify-content-center">
                                <div class="founder-img">
                                	<img src="<c:url value="/resources/assets/img/gallery/smile.png"/>" alt="" onclick=""/>
                                </div>
                                <div class="founder-text">
                                    <span>후바후바 ~ *^^* 꺄로록~ </span>
                                    <p>Chif Photographer</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Testimonial End -->
<!-- Coun Down Start -->
<div class="count-down-area pb-120">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <!-- Counter Up -->
                <div class="single-counter text-center">
                    <span class="counter">8705</span>
                    <p>Projects Completed</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <!-- Counter Up -->
                <div class="single-counter active text-center">
                    <span class="counter">480</span>
                    <p> Active Clients</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <!-- Counter Up -->
                <div class="single-counter text-center">
                    <span class="counter">626</span>
                    <p>Cups of Coffee</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <!-- Counter Up -->
                <div class="single-counter text-center">
                    <span class="counter">9774</span>
                    <p>Happy Clients</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JS here -->

		<!-- Jquery, Popper, Bootstrap -->
		<script src="<c:url value="/resources/assets/js/vendor/jquery-1.12.4.min.js"/>"></script>


		<!-- 숫자 올라감  -->
        <script src="<c:url value="/resources/assets/js/slick.min.js"/>"></script>
        
		<!-- One Page, Animated-HeadLin -->
        <script src="<c:url value="/resources/assets/js/wow.min.js"/>"></script>
		<script src="<c:url value="/resources/assets/js/animated.headline.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/jquery.magnific-popup.js"/>"></script>


        <!-- counter , waypoint -->
        <!-- 숫자 올라감 -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <script src="<c:url value="/resources/assets/js/jquery.counterup.min.js"/>"></script>
        
        <!-- contact js -->
        <script src="<c:url value="/resources/assets/js/contact.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/jquery.form.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/jquery.validate.min.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/mail-script.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/jquery.ajaxchimp.min.js"/>"></script>       
                                         
		<!-- Jquery Plugins, main Jquery -->	
        <script src="<c:url value="/resources/assets/js/plugins.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/main.js"/>"></script>
        


        
        

</body>
</html>