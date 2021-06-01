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
	// 리뷰 최신순, 1페이지로 세팅
	select_order_reply("latest_likes", "1");
	
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
}
</style>
</head>
<body>
<hr>
	<div class="container-fluid" id="write_review_container" style="width: 70%; display: none;"> 
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
	        	 	$(document).on("click", "#insertBtn", function(event){
		            //$("#insertBtn").click(function(event){
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
								console.log(data.contentError);
								alert("내용을 입력하세요.");
							}
							if(data.ratingError == "-1"){
								console.log(data.ratingError);
								alert("별점을 입력하세요.");
							}
							
							if(data.rating && data.content){
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
		                    $("#allReviewNum").text(review_count);

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
		                    $("input:radio[id='latest_tab']").prop('checked', true);
		                    select_order_reply("latest_likes", 1);
		                     
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
						<input type="radio" id="latest_tab" name="radio_type" value="latest_likes" onclick="select_order_reply(this.value, 1);" />
						<label for="latest_tab">최신순</label>&nbsp;&nbsp;
						<input type="radio" id="popular_tab" name="radio_type" value="popular_likes" onclick="select_order_reply(this.value, 1);"/>
						<label for="popular_tab">좋아요순</label>
					</div>

			</div>
			<!-- 리뷰가 0개인 경우 이미지로 대체 -->
			<c:choose>
				<c:when test="${review_count eq 0 }">
					<div id="newRecordImg">
						<img src="resources/img/newRecord2.jpg" style="width: 60%; margin-left: 20%; " />
					</div>
				</c:when>
			</c:choose>
			<div class="reviewSection" id="reviewContent"></div>
			<script>
			// 라디오 버튼 check값
			$(document).on("click", "input:radio[name='radio_type']", function(e){
				if($(this).val() == "latest_likes"){
					$(":radio[name='radio_type'][value='popular_likes']").attr('checked', false);
					}
				else{
					$(":radio[name='radio_type'][value='latest_likes']").attr('checked', false);
					}
				})
			// prev 버튼 누를때
			$(document).on("click", ".prev", function(event){
				var pageNum = $(this).attr('id');
				pageNum *= 1;
				pageNum = pageNum - 1;
				var radio_val = $("input:radio[name='radio_type']:checked").val();
				select_order_reply(radio_val, pageNum);
				})
			// next 버튼 누를 때
			$(document).on("click", ".next", function(event){
				var pageNum = $(this).attr('id');
				pageNum *= 1;
				pageNum = pageNum + 1;
				var radio_val = $("input:radio[name='radio_type']:checked").val();
				select_order_reply(radio_val, pageNum);
				})
			// 페이지 num 누를때
			$(document).on("click", ".page", function(event){
				var pageNum = $(this).text();
				var radio_val = $("input:radio[name='radio_type']:checked").val();
				select_order_reply(radio_val, pageNum);

			})//페이징 function end

			///최신순, 좋아요순
			function select_order_reply(type, start){
				$(":radio[name='radio_type'][value='" + type + "']").attr('checked', true);
				
				var business_idx = $("input[name='business_idx']").val();
				var user_idx = $("input[name='user_idx']").val();
				console.log("start >> " + start);
				
				var html = '';
				
				$.ajax({
		            url:"orderReply",
		            type:"post",
		            cache:false,
		            dataType:'json',
		            data : {
		                "radio_val": type,	// 버튼의 value값에 따라 작동
		                "business_idx": business_idx,
		                "user_idx": user_idx,
		                "startNum": start
		                
		            	},
		            success:function(result){
		            	$.each(result, function(idx, review) {
		            		if(result.allReviewCount > 0){
		    		            $('#newRecordImg').hide();
		    		        }
			            	
			            	$.each(review, function(review_idx, data){
			            	
							for(var t = 0; t <= review_idx; t++){
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
				                
				                html += "<tr><td colspan='2'></td><td style='text-align: right; padding-right: 10px;'>";
				                if(data.likes == 1){
			                    	html += "<b style='margin-right:10px;' id='reviewCount[" + data.idx + "]'>" + data.total_likes + "</b>"
			                    		+ "<a href='javascript:void(0);' id=" + data.idx
										+ " style='color: #db2d21; text-align: right;' class='likesBtn done'>♥</a>"
										+ "<span style='color: gray; text-align: right; margin-left: 10px; width: 25%;'>도움이 됐어요!</span>"
										+ "<input type='hidden' name='likes[" + data.idx + "]' id='likesValue' value=" + data.likes + " />";
					                }else if(data.likes == 0){
					                	html += "<b style='margin-right:10px;' id='reviewCount[" + data.idx + "]'>" + data.total_likes + "</b>"
					                	+ "<a href='javascript:void(0);' id=" + data.idx
										+ " style='text-align: right;' class='likesBtn'>♥</a>"
										+ "<span style='color: gray; text-align: right; margin-left: 10px; width: 25%;'>도움이 됐어요!</span>"
										+ "<input type='hidden' name='likes[" + data.idx + "]' id='likesValue' value=" + data.likes + " />";
						            }
				                html += "</td></tr></table><hr></div>";

							}	// t for문 end	  						
		                    $('div .reviewSection').append(html);
			            	})	// review each
            			});	//each end
	                    // 리뷰 페이징 구간
	                    var pageBlock = '';
	                    if((result.blockStart - 1) > 0){
		                    pageBlock = "<li class='disabled' style='display: inline-block;'><a class='prev' id='"+result.blockStart+"' href='javascript:void(0);'><span>«</span></a></li>"
		                    }
	                    for(var page = result.blockStart; page <= result.blockEnd; page++){
		                    if(page <= result.lastPageNum){
			                    // 현재 페이지 (text-decoration 추가)
			                    if(page == result.startNum){
				                    pageBlock += "<li style='text-decoration:underline; display: inline-block;'><a class='page' id='"+page+"' href='javascript:void(0);'>" + page + "</a></li>"
				                    $(' .disabled').append(pageBlock);
				                    }
			                    else{
			                    // 그 외 페이지
			                    	pageBlock += "<li id='"+page+"' style='display: inline-block;'><a class='page' id='"+page+"' href='javascript:void(0);'>" + page + "</a></li>"
				                    $(' .disabled').append(pageBlock);
				                    }
		                    	}
		                    }

	                    if(result.blockEnd < result.lastPageNum){
	            			pageBlock += "<li style='display: inline-block;'><a class='next' id='"+result.blockEnd+"'href='javascript:void(0);'><span>»</span></a></li>"
		                    }
	                    $('.pagination').append(pageBlock);

		            }, error:function(e){
		            	console.log('error');
		            }//error
		        })//ajax
		        $('div .reviewSection').empty();
		        $('.pagination').empty();
			}	// select_order_reply end
			
			//좋아요
		    //session으로 받아옴(현재 사용자)
		    $(document).on("click", ".likesBtn", function(event){
		    	var review_idx = $(this).attr("id");
		    	//console.log("이거 확인 >> " + review_idx)
				var user_idx = $("input[name='user_idx']").val();
			    var business_idx = $("input[name='business_idx']").val();
				var review_user_idx = $("input[name='review_user[" + review_idx + "]']").val();
				//console.log("리뷰의 user >> " + review_user_idx);

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
							// 내가 좋아요 누른 댓글
							likesData.value *= 1;
							console.log("value >> " + likesData.value);
							if(likesData.value == 1){
								$("a[id='" + likesData.review_idx + "']").css('color', '#db2d21');
		                     	var review_rating = likesData.review_rating;
		                     	$("b[id='reviewCount["+review_idx+"]']").text(review_rating);
		                  	}else{	// 좋아요 누르지 않은 댓글
		                     	$("a[id='" + likesData.review_idx + "']").css('color', 'gray');
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
		<!-- 댓글 페이징 -->
		<div class="paginationBlock" style="text-align: center;">
			<ul class="pagination" style="margin-left: auto; margin-right: auto; display: inline-block;"></ul>
		</div>
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