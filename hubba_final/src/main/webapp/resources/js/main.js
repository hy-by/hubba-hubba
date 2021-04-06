//카테고리 큰아이콘 더보기 클릭스 -> 작은아이콘으로 보여주기 
$(function() {
//	$("#category_etc").click(function() {
//		alert("clicked");
//	});
	init();
});	

function view_more_category() { 
    if ($('#hide_container').is(":visible")) { 
        $('#hide_container').hide(); // id값을 받아서 숨기기 
        $('#category_container').show();
        $('#button1').text('보이기'); 
    } else { 
        $('#hide_container').show(); // id값을 받아서 보이기 
        $('#category_container').hide();
        $('#button1').text('숨기기'); 
    } 
}

function init() {
    $('#hide_container').hide(); // id값을 받아서 숨기기 
    $('#button1').text('보이기'); 
	
}

//작은 아이콘 마우스 오버시 타이틀 보여주기
//$(function() {
//	init();
//});
//function over1(){
//    $('.hide_icon_name1').show();
//}
//function out1(){
//	$('.hide_icon_name1').is(":visible");
//	$('.hide_icon_name1').hide();
//}
//function init() {
//    $('#hide_icon_name1').hide(); // id값을 받아서 숨기기 
//    $('#button1').text('보이기'); 
//	
//}




function out1(){
	$(".hide_icon_name1").slideUp(1000);
	//$("#write_review_container").css("display", "none");
//	//document.getElementById("write_review_container").style.display = "block";
//	//document.getElementById("hide_contents").style.display = "none";
	}
////
//	function closeReview(){
//		$(".hide_contents").slideDown(1000);
//		$("#write_review_container").css("display", "none");
//		//document.getElementById("write_review_container").style.display = "none";
//		}

function over1(){
	$(".hide_icon_name1").slideUp(1000);
	$("#write_review_container").css("display", "visible");
}



function over2(){
    $('.hide_icon_name1').show();
}
function out2(){
	$('.hide_icon_name1').is(":visible");
	$('.hide_icon_name1').hide();
}







