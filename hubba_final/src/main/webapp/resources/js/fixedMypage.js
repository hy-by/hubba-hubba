


$(document).ready(function(e){
	$('#logout').click(function() {
		location.href="logout";
	});
	$('#my_information').click(function(e){
		location.href="editUser";
	});
});

history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
};





// 오른쪽 상단 클릭시 mypage 보이기

$(function() {
//	$("#after_login_img").click(function() {
//		alert("clicked");
//	});
	init();
});	
	
function doShow() { 
	
    if ($('#my_information').is(":visible")) { 
        $('#my_information').slideUp(1000);
        $('#my_review').slideUp(1000);
        $('#my_bookmark').slideUp(1000);
        $('#logout').slideUp(1000);
        $('#button1').text('보이기'); 
    } else { 
        $('#my_information').slideDown(1000); 
        $('#my_review').slideDown(1000); 
        $('#my_bookmark').slideDown(1000); 
        $('#logout').slideDown(1000); 
        $('#button1').text('숨기기'); 
    } 
}			

function init() {
    $('#my_information').hide(); 
    $('#my_review').hide(); 
    $('#my_bookmark').hide();  
    $('#logout').hide(); 
    $('#button1').text('보이기'); 
	
}