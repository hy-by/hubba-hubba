<%@ page import="com.hubba.vo.BusinessVO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>
$(document).ready(function() {
	select_order_reply("latest_likes");
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
<style type="text/css">
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

.likesBtn {
	font-size: 20px;
	text-decoration: none;
	color: gray;
}

.likesBtn.done {
	font-size: 20px;
	text-decoration: none;
	color: #db2d21;
}

a.likesBtn:hover {
	text-decoration: none !important;
	color: #db2d21 !important;
}
</style>
</head>
<body>
<hr>

	<!-- display: none; 추가 해야함 -->
	<div class="container-fluid" id="write_review_container" style="width: 70%;"> 
		<!-- 리뷰쓰기 -->
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4" id="view_img_wrap">
				<img class="view_img"
					src="<c:url value="/resources/img/viewDetails/close_review.png"/>"
					alt="" onclick="closeReview();" />
			</div>
			<div class="col-4"></div>
		</div>

		<div class="col" style="padding-left: 15px; padding-right: 15px;">
			<div style="padding-left: 15px; padding-right: 15px; border-bottom: 1px solid gray; margin-bottom: 20px; font-size: 30px;">평가하기</div>
			<div class="inputAllBox" style="padding-left: 15px; padding-right: 15px;">
				<div class="row" id="write_review_row" style="width: 100%; padding-left: 15px; padding-right: 15px;">
					<div class="col-2"></div>
					<form method="post" id="insertReviewForm" enctype="multipart/form-data">
						<input type="hidden" name="user_idx" id="u_idx" value="${user_idx }" />
						<input type="hidden" name="business_idx" id="b_idx" value="${business_idx }" />
						<!-- grade -->
						<div class="grade" style="margin-bottom: 10px;">
							<p class="starGrade" style="margin: 0px; width: 100%;">
								<a href="javascript:void(0);">★</a>
								<a href="javascript:void(0);">★</a>
								<a href="javascript:void(0);">★</a>
								<a href="javascript:void(0);">★</a>
								<a href="javascript:void(0);">★</a>
								<input type="hidden" name="rating" id="rating" value="0" />
							</p>
						</div>
						<!-- 후기 작성란 -->
						<div class="insertReview">
							<textarea name="content" id="content" placeholder=" 후기를 입력해주세요!"></textarea>
						</div>
						
						<!-- insertImages -->
						<script>			
						$(document).ready(function(){
							$('.inputAllBox').css('height','200px;');
							$('.imgs_wrap').hide();
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
						          return;
						       }
							filesArr.forEach(function(f) {
										if (!f.type.match("image.*")) {
											alert("이미지 파일을 선택해주세요!");
											$("input[type='file']").val("");
											return;
										}
										
										sel_files.push(f);
										
										var reader = new FileReader();
										reader.onload = function(e) {
											$('.inputAllBox').css('height','500px;');
											$('.imgs_wrap').show();
											$('.imgs_wrap').css('height','300px;');
											var html = "<img src=\""+e.target.result+"\" style='width:175px; height:175px; margin:5px; float: left;'/>";
											$('.imgs_wrap').append(html);
										}
										reader.readAsDataURL(f);
									});
						}
						</script>
						<!-- 이미지 업로드 및 submit -->
						<div class="insertImages">
							<div class="input_wrap" style="float:left;">
								<label for="multiparts">업로드</label>
								<input type="file" name="multiparts" id="multiparts" multiple="multiple" />
							</div>
							<div style="text-align: end;">
								<input type="submit" id="insertBtn" value="작성" />
							</div>
						</div>
							<div class="imgs_wrap" style="overflow:hidden; height: auto; width: 100%;"></div>
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
		                  async: false,
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
								// 변수명 변경하기
								if(nameCompare!="loginType"){
									if(nameCompare=="sns_login"){
		
										 html = "<table style='width:100%; margin-bottom:30px;'>"
					                          + "<tr><td rowspan='2' style='width:8%'><img src='" + data.profile_img + "'"
					                          + "style='width:60px; height:60px; border-radius: 50px; margin:0 10% 0 10%;'/></td>"
					                          + "<td style='font-size: 18px; padding-left: 5px; width: 70%;'><p style='margin-bottom: -19px; padding-left: 2px;'><b>" + data.id + "</b></p></td>"
					                          + "<td style='text-align: right; width: 25%; padding-right: 10px;'>" + data.date + "</td></tr>"
					                          + "<tr><td id='ratings' colspan='2' style='padding-left:5px;'><span style='margin-bottom: 14px;margin-top: 8px;'>";
					                  }else{
					
					                	  html = "<table style='width:100%; margin-bottom:30px;'>"
					                          + "<tr><td rowspan='2' style='width:8%'><img src='resources/img/" + data.profile_img + "'"
					                          + "style='width:60px; height:60px; border-radius: 50px; margin:0 10% 0 10%;'/></td>"
					                          + "<td style='font-size: 18px; padding-left: 5px; width: 70%;'><p style='margin-bottom: -19px; padding-left: 2px;'><b>" + data.id + "</b></p></td>"
					                          + "<td style='text-align: right; width: 25%; padding-right: 10px;'>" + data.date + "</td></tr>"
					                          + "<tr><td id='ratings' colspan='2' style='padding-left:5px;'><span style='margin-bottom: 14px;margin-top: 8px;'>";
					                  }
									}
		                       
		                       for(var r = 1; r <= data.rating; r++){
			                       html += "<img src='resources/img/oneStar.png' style='width:20px;'/>";
			                       }
							html += "</span></td></tr>"
		                    + "<tr><td></td><td colspan='2' style='padding-left: 5px; padding-right: 10px; text-align: justify; word-break: break-all;'>"
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

		                    // 댓글이 1개 이상이면 이미지 지우기
		                    if(review_count > 0){
								$("#newRecordImg").empty();
		                        }

		                    $("input[type='file']").val("");
		                    $("#rating").val("");
		                    $("#content").val("");
		                    $(".imgs_wrap").empty();
		                    $(".starGrade a").parent().children("a").removeClass("on");
		                    $("#review_register").prop("disabled", false);
		                    // 새 후기 입력시 라디오 버튼 최신순으로 세팅
		                    //$("input:radio[id='latest_tab']").prop('checked', true);
		                     
		                  },   //data-success
		                  error: function(e){
		                     console.log("에러 발생", e);
		                     $("#insertBtn").prop("disabled", false);
		                     }
		                  });      //data-ajax               
		               });   //click-event
		
		            });   //function
				</script>
				</div> <!-- row end -->
			</div> <!-- inputAllBox end-->
		</div> <!-- col end -->
		<div class="reviewContainer">
			<div class="review_header" style="margin: 20px 0px; border-bottom: 1px solid gray; padding-bottom: 7px;">
				<div class="allCount" style="float:left;"><b id="allReviewNum">${review_count }</b> Reviews</div>
					<div class="radioBtn" style="text-align: end;">
						<input type="radio" id="latest_tab" name="radio_type" value="latest_likes" onclick="select_order_reply(this.value);" checked/>
						<label for="latest_tab">최신순</label>
						<input type="radio" id="popular_tab" name="radio_type" value="popular_likes" onclick="select_order_reply(this.value);"/>
						<label for="popular_tab">좋아요순</label>
					</div>

			</div>
			<div class="reviewSection" id="reviewContent"></div><!-- reviewSection end -->
			<script>
			///최신순, 좋아요순
			function select_order_reply(type){				
				console.log(type);
				var radio_val = type;
				var allReviewCount = $("#allReviewNum").text();
				allReviewCount *= 1;
				
				var business_idx = $("input[name='business_idx']").val();
				var user_idx = $("input[name='user_idx']").val();

				var html = '';
				
	            if(allReviewCount == 0){
		            html = "<div id='newRecordImg'><img src='resources/img/newRecord2.jpg' style='width: 60%; margin-left: 20%; /></div>"
					$('div .reviewSection').append(html);
		        }	// review가 0일 경우
				

				$.ajax({
		            url:"orderReply",
		            type:"post",
		            cache:false,
		            dataType:'json',
		            data : {
		                "radio_val":radio_val,	// 버튼의 value값에 따라 작동
		                "business_idx": business_idx,
		                "user_idx": user_idx,
		            	},
		            success:function(result){
		            	$.each(result, function(idx, data) {
							for(var t = 0; t <= idx; t++){
								html = "<input type='hidden' name='idx' value='" + data.idx +"' />"
									+ "<input type='hidden' name='review_user[" + data.idx + "]' value='" + data.user_idx + "' />"							
									+ "<div class='tableDiv' id='" + t + "'>"
			                    var imageStr = data.images;
			                    if(imageStr != null){
				                    var imageArray = imageStr.split('&');
				                    }
								var nameCompare = "<%=request.getAttribute("nameCompare").toString()%>";
								// 변수명 변경하기
								if(nameCompare!="loginType"){
									if(nameCompare=="sns_login"){

										 html += "<table style='width:100%; margin-bottom:30px;'>"
					                          + "<tr><td rowspan='2' style='width:8%'><img src='" + data.profile_img + "'"
					                          + "style='width:60px; height:60px; border-radius: 50px; margin:0 10% 0 10%;'/></td>"
					                          + "<td style='font-size: 18px; padding-left: 5px; width: 70%;'><p style='margin-bottom: -19px; padding-left: 2px;'><b>" + data.id + "</b></p></td>"
					                          + "<td style='text-align: right; width: 25%; padding-right: 10px;'>" + data.date + "</td></tr>"
					                          + "<tr><td id='ratings' colspan='2' style='padding-left:5px;'><span style='margin-bottom: 14px;margin-top: 8px;'>";
					                  }else{
					
					                	  html += "<table style='width:100%; margin-bottom:30px;'>"
					                          + "<tr><td rowspan='2' style='width:8%'><img src='resources/img/" + data.profile_img + "'"
					                          + "style='width:60px; height:60px; border-radius: 50px; margin:0 10% 0 10%;'/></td>"
					                          + "<td style='font-size: 18px; padding-left: 5px; width: 70%;'><p style='margin-bottom: -19px; padding-left: 2px;'><b>" + data.id + "</b></p></td>"
					                          + "<td style='text-align: right; width: 25%; padding-right: 10px;'>" + data.date + "</td></tr>"
					                          + "<tr><td id='ratings' colspan='2' style='padding-left:5px;'><span style='margin-bottom: 14px;margin-top: 8px;'>";
					                  }
									}	//if end
		                       
		                       for(var r = 1; r <= data.rating; r++){
			                       html += "<img src='resources/img/oneStar.png' style='width:20px;'/>";
			                       }
								html += "</span></td></tr>"
			                    + "<tr><td></td><td colspan='2' style='padding-left: 5px; padding-right: 10px; text-align: justify; word-break: break-all;'>"
			                    + data.content + "</td></tr>"
			                    + "<tr><td></td><td colspan='2'><span style='margin-left: 10px;'>";
								if(imageArray != null){
				                    for(var i = 0; i < imageArray.length; i++){
					                    if(imageArray[i] != ""){
						                    html += "<img class='reviewImg' style='width:100px; height:100px; margin-right: 10px;' src='resources/img/"+ imageArray[i] + "'/>";
						                    }
					                    }
									}
			                    html += "</span></td></tr>"
				                
				                html += "<tr><td colspan='2'></td><td style='text-align: center;'>";
				                if(data.likes == 1){
			                    	html += "<b style='margin-right:10px;' id='reviewCount[" + data.idx + "]'>" + data.total_likes + "</b>"
			                    		+ "<a href='javascript:void(0);' id=" + data.idx
										+ " style='color: #db2d21; text-align: left;' class='likesBtn done'>♥</a>"
										+ "<span style='color: gray; margin-left: 10px; width: 25%;'>도움이 됐어요!</span>"
										+ "<input type='hidden' name='likes[" + data.idx + "]' id='likesValue' value=" + data.likes + " />";
					                }else if(data.likes == 0){
					                	html += "<b style='margin-right:10px;' id='reviewCount[" + data.idx + "]'>" + data.total_likes + "</b>"
					                	+ "<a href='javascript:void(0);' id=" + data.idx
										+ " style='text-align: left;' class='likesBtn'>♥</a>"
										+ "<span style='color: gray; margin-left: 10px; width: 25%;'>도움이 됐어요!</span>"
										+ "<input type='hidden' name='likes[" + data.idx + "]' id='likesValue' value=" + data.likes + " />";
						            }
				                html += "</td></tr></table><hr></div>";
							}	// t for문 end	  						
		                    $('div .reviewSection').append(html);
            			});	//each end
		            
		            }, error:function(e){
		            	console.log('error');
		            }//error
		        })//ajax
		        $('div .reviewSection').empty();
			}	// select_order_reply end
			
			//좋아요
		    //session으로 받아옴(현재 사용자)
		    $(document).on("click", ".likesBtn", function(event){
		    	var review_idx = $(this).attr("id");
		    	console.log("이거 확인 >> " + review_idx)
				var user_idx = $("input[name='user_idx']").val();
			    var business_idx = $("input[name='business_idx']").val();
				var review_user_idx = $("input[name='review_user[" + review_idx + "]']").val();
				console.log("리뷰의 user >> " + review_user_idx);

			    // 타인의 댓글에만 좋아요 클릭 가능
				if(user_idx != review_user_idx){
			        $(this).toggleClass("done");
			      
			        if($(this).hasClass("done")){
				        // 좋아요 누름
			           	$("input[name='likes[" + review_idx + "]']").val(1);
			           	console.log("좋아요!")
			        }else{
				        // 좋아요 취소함
				        $("input[name='likes[" + review_idx + "]']").val(0);
				        console.log("좋아요 취소!");
			        }
			        var value = $("input[name='likes[" + review_idx + "]']").val();
			        var likesData = {"user_idx": user_idx, "business_idx": business_idx, "review_idx":review_idx, "value":value};
	
					$.ajax({
			            url: "likes",
			            type: "POST",
			            data: likesData,
			            async: false,
			            success: function(likesData){
				            console.log(likesData);
				            console.log(likesData.value);
				            console.log(likesData.review_rating);          
							// 내가 좋아요 누른 댓글
							if(likesData.value == 1){
								$("a[id='likes[" + likesData.review_idx + "]']").css('color', '#db2d21');
		                     	var review_rating = likesData.review_rating;
		                     	$("b[id='reviewCount["+review_idx+"]']").text(review_rating);
		                  	}else if(likesData.value == 0){	// 좋아요 누르지 않은 댓글
		                     	$("a[id='likes[" + likesData.review_idx + "]']").css('color', 'gray');
		                     	var review_rating = likesData.review_rating;
		                     	$("b[id='reviewCount["+review_idx+"]']").text(review_rating);
		                  	}
			               },
			               error:function(e){
			                  console.log("에러 발생", e);
			               }
			            }); // ajax end   
				}else{
						alert("내가 작성한 댓글입니다.");
					}
	         });	// likesBtn click function end


			 //이미지 modal
			 $(document).on("click", ".reviewImg", function(event){
	         	var modal = document.getElementById("myModal");
		   		var closeBtn = document.getElementsByClassName("close")[0];
		   		closeBtn.onclick = function() { 
		        	modal.style.display = "none";
		   		}
			      var imgSrc = $(this).attr("src");
			      var modalImg = $("#imgModal").attr("src", imgSrc);
			      modal.style.display = "block";
			      })
			   $(document).on("click", ".close", function(){
			      $("#myModal").hide();
			      })
				
		</script>
		</div><!-- reviewContainer end -->
   		<!-- The Modal -->
		<div id="myModal" class="modal_img">
			<!-- The Close Button -->
			<span class="close">&times;</span>
			<!-- Modal Content (The Image) -->
			<img class="modal-ImgContent " id="imgModal">
		</div>
	</div> <!-- container fluid end -->

</body>
</html>