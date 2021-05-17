<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=구글키값"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<div id="search_wrap">
		<form action="search_storage" method="post">
			<input type="text" placeholder="검색하세요" id="search_left" name="keyword"/>
			<input type="text" placeholder="장소 검색" id="search_right" name="location" />
			<input type="hidden" name="y" id="latitude"/>
			<input type="hidden" name="x" id="longitude"/>
			<button type="submit" class="btn btn-info btn-lg">SEARCH</button>
		</form>
	</div>

	<script>
		var geocoder;
		var map;
		var marker;

		/*
		 * Google Map with marker
		 */
		function initialize() {
		    var initialLat = $('#latitude').val();
		    var initialLong = $('#longitude').val();
		
		    var latlng = new google.maps.LatLng(initialLat, initialLong);
		
		    marker = new google.maps.Marker({
		        map: map,
		        draggable: true,
		        position: latlng
		    });
		
		    geocoder = new google.maps.Geocoder();
		   
		    google.maps.event.addListener(marker, "dragend", function () {
		        var point = marker.getPosition();
		        map.panTo(point);
		        geocoder.geocode({'latLng': marker.getPosition()}, function (results, status) {
		            if (status == google.maps.GeocoderStatus.OK) {
		                map.setCenter(results[0].geometry.location);
		                marker.setPosition(results[0].geometry.location);
		                $('#latitude').val(marker.getPosition().lat());
		                $('#longitude').val(marker.getPosition().lng());
		            }
		        });
		    });
		
		}

		$(document).ready(function () {
		    //load google map
		    initialize();
		    
		    /*
		     * autocomplete location search
		     */
		    var PostCodeid = '#search_right';
		    $(function () {
		        $(PostCodeid).autocomplete({
		            source: function (request, response) {
		                geocoder.geocode({
		                    'address': request.term
		                }, function (results, status) {
		                    response($.map(results, function (item) {
		                        return {
		                            label: item.formatted_address,
		                            value: item.formatted_address,
		                            lat: item.geometry.location.lat(),
		                            lon: item.geometry.location.lng()
		                        };
		                    }));
		                });
		            },
		            select: function (event, ui) {
		                $('#latitude').val(ui.item.lat);
		                $('#longitude').val(ui.item.lon);
		                var latlng = new google.maps.LatLng(ui.item.lat, ui.item.lon);
		                marker.setPosition(latlng);
		                initialize();
		            }
		        });
		    });
		    
		   
		});
			
			
	</script>



</body>
</html>