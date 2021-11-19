<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<!-- 헤드 -->
<head>
<link rel="stylesheet" href="css/map/map.css">
<jsp:include page="/head.wd" />
</head>
<!-- /헤드 -->

<body class="nav-fixed">
	<!-- 헤더 -->
	<jsp:include page="/header.wd" />


	<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="/sidebar.wd" />

		<!-- 콘텐츠 -->
		<div id="layoutSidenav_content">

			<!-- ** 주요 내용 **  -->
			<main>
				<div id="map" class="map"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f59b335fdce7811c29ddb73572e2a37b"></script>
				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
								
				<script>
				<!--MAP API SET-->
				const container = document.getElementById('map');
				const options = {
					center: new kakao.maps.LatLng(37.3971709, 126.8007997)
					,level: 3
					,disableDoubleClick : true
				};
				const	map = new kakao.maps.Map(container, options);
//-----------------------------------------------------------------------------------				
// Set Value 기본적인 벨류 세팅
	const	imageSrc = "image/map/marker.png", // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
			imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	const	gifSrc = "image/map/marker.gif", // 마커이미지의 주소입니다    
			gifSize = new kakao.maps.Size(80, 80), // 마커이미지의 크기입니다
			gifOption = {offset: new kakao.maps.Point(35, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.    	
				
	
	let		pop = false;
	let		moveable = false;

	let		latlng;
	let		markers = [];
	let		wmark;
	let 	jsonData;
	//구글 키
	const API_KEY = "AIzaSyAFETg9_IkmdP19ZbH4jCFyK1Ms-I4KoXE";
				
//-------------------------------------------------------------------------------------
// Set Popup Overlay

//지도 중심 좌표 얻어오기
let center = map.getCenter();

// 커스텀 오버레이에 표시할 HTML 태그
var content = '<form id="popup" name="popup"><div class="overlaybox" id="overlaybox">' +
'    <div class="title">돌봄 구인 글 작성</div>' +
'    <div class="first">' +
'    <ul>' +
'        <li class="up">' +
'            <span class="title">제목</span><br>' +
'            <span class="number"><input type="text" id="title" name="title" class="inputtext" placeholder="제목을 입력 하세요."></input></span>' +
'        </li>' +
'        <li>' +
'            <span class="title">돌봄이 에게 바라는 사항</span><br>' +
'            <span class="number"><textarea class="text" id="content" name="content" cols="40" rows="10" placeholder="돌봄이에게 바라는 사항을 입력해주세요."></textarea></span>' +
'        </li>' +
'		<li>' +
'            <span class="title">강아지 사진을 올려주세요!</span><br>' +
'            <span class="imgfile"><input type="file" name="photo" id="photo"></span>' +
'        </li>' +
'		<li>' +
'            <span class="title">돌봄 비용</span><br>' +
'            <span class="number"><input type="text" id="price" name="price" class="inputtext" placeholder="돌봄이에게 지급 할 금액 입니다."></span>' +
'        </li>' +
'		<li>' +
'            <span class="title">돌봄 기간</span><br>' +
'            <span class="number"><input type="text" name="when" id="when" class="inputtext" placeholder="기간을 입력해주세요."></span>' +
'        </li>' +
'            <span class="cancle"><input class="butt" id="cancle" type="button" value="취소"></span>' +
'            <span class="submit"><input class="butt" id="submit" type="button" value="확인"></span>' +
'    </ul>' +
'			<input type="hidden" id="lat" name="lat" value=""></input>	' +
'			<input type="hidden" id="lng" name="lng" value=""></input>'	
'</div></form>';


const customOverlay = new kakao.maps.CustomOverlay({
    position: center,
    content: content   
});

// 커스텀 오버레이를 생성 한다.
customOverlay.setMap(map);


//OverlayBox - 생성시 classList hidden을 줘서 display : none 시킨다.
const overlaybox = document.getElementById("overlaybox");
overlaybox.classList.add("hidden");

//----------------------------------------------------------------------------------
$(document).ready(function(){
	
	// json 최신화
	markersjson(1);
	// 위치 불러오기
	getlocation();
	
	$('#submit').click(function(){
	
	// Create an FormData object 
    const form = $('#popup')[0];  	    
             
   

    let Lat = latlng.getLat();
    let Lng = latlng.getLng();
    
	document.getElementById("lat").value = Lat;
	document.getElementById("lng").value = Lng;
	let formdata = new FormData(form);
    
	console.log(Lat);
	console.log(Lng);

		$.ajax({			
			url : 'mapTradeInsert.wd',		
			type : 'post',
			enctype : "multipart/form-data",
			processData: false,    
	        contentType: false,
			data : formdata,
		    success: function (data){
		        alert("데이터전송 성공");
		        submitPopup();
		    },
		    error: function (error){
		        alert("에러");
		        hidePopup();
		    }
		}); // end of ajax()
	});
});


function markersjson (x) {
	//MARKER DB -> JSON 최신화
	// x = 1 처음 실행
	// x = 2 인서트 후 실행
	$.ajax({			
				url : 'setmarkers.wd',		
				type : 'get',			
				data : {},
				success: function (data){
					console.log("json data 동기화 ");
					setTimeout(function() {markersLoad(x);}, 500); // 0.5초 뒤에 함수를 실행 시킴
				}
				,error: function (error){ alert("에러"); }
			}); // end of ajax()	
}


function getlocation () {
//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	        map.panTo(locPosition);
	 
	            
	      });
	}else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    alert("브라우저가 최신 버전이 아닙니다!");
	}
}

function get() {
    
    const url = "https://www.googleapis.com/geolocation/v1/geolocate?key=" + API_KEY;
	$.ajax({			
		url : url,		
		type : 'post',
	    success: function (data){
	        alert(data);
	        
	    },
	    error: function (error){
	        alert("에러");
	    }
	}); // end of ajax()
 
}
//취소 시 팝업을 하이드 시킴
function hidePopup() {
overlaybox.classList.add("hidden");

moveable = true;
map.setDraggable(moveable);
map.setZoomable(moveable);

let markcount =  markers.length - 1;

setpopMarkers(map);
wmark.setMap(null);

$('#popup')[0].reset();
pop = false;
}

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function sethideMarkers(map) {
	for (var i = 0; i < markers.length; i++) {
	    markers[i].setMap(null);
	}            
}

function setpopMarkers(map) {
	for (var i = 0; i < markers.length; i++) {
	    markers[i].setMap(map);
	}            
}


function submitPopup() {

overlaybox.classList.add("hidden");

moveable = true;
map.setDraggable(moveable);
map.setZoomable(moveable);
pop = false;

setpopMarkers(map);

let markcount =  markers.length - 1;
wmark.setMap(null);

markersjson(2);

	$('#popup')[0].reset();

}

//오버레이 박스 이벤트 세팅
const pbutt_cancel = document.getElementById("cancle");

// Set Event
pbutt_cancel.addEventListener("click" ,hidePopup);

				
//------------------------------------------------------------------------------------		
function markersLoad(x) {
	const url = "mapdata.json";
		$.ajax({			
					url : url		
					,type : 'get'
					,contentType: "application/x-www-form-urlencoded; charset=UTF-8"		
					,success: function (data){
					    	
					   	const jsonData = data;
					   	let i;
					    let size = jsonData.length;
					    if (x == 1){
					    	i = 0;
					    } else {
					    	i = size-1;
					    }
					    
					    console.log(jsonData);
   
					    for (i; size > i; i++ ){
					    	const tno = jsonData[i].tno;
					    	const title = jsonData[i].title;
					    	const photo = jsonData[i].photo;
					    	const price = jsonData[i].price;
					    	const writer = jsonData[i].writer;
							const markLocation = new kakao.maps.LatLng(jsonData[i].lat, jsonData[i].lng);
							// Set Marker
							const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
							    
							 // 지도를 클릭한 위치에 표출할 마커입니다
						 	let marker = new kakao.maps.Marker({ 
							    	position : markLocation,
							    	image : markerImage
							    }); 
							 
							//Map에 Marker를  세팅함
							marker.setMap(map);
							// Marker를 배열에 추가
							markers.push(marker);
							//
							markerInfoSet(title,marker,photo,markLocation,price,tno,writer);
					        }
					

					    },
					    error: function (error){
					        alert("에러");
					    }
				});
	}

function markerInfoSet (title,marker,photo,markLocation,price,tno,writer) {
	
	let makerInfo;
	
	// 마커에 마우스 오버 이벤트 추가
	kakao.maps.event.addListener(marker, 'mouseover', function() {
		var iwContent = '<div class="tradeinfo" style="padding:5px;">'
						+ '<img class="dogimg" src=/img/map/' + photo +'>'
						+ '<div class="tradeinfo_2">'
						+ '<ul><li>'+ title + '</li>'
						+ '<li>작성자 : '+ writer + '</li>'
						+'<li>' + price + '</li></ul></div>'
						+'</div>'; 

	
	makerInfo = new kakao.maps.CustomOverlay({
		    position: markLocation,
		    content: iwContent,
		    xAnchor: 0.45,
		    yAnchor : 1.35
	});	// end of event : mouseover

	makerInfo.setMap(map);	
	//makerInfo.open(map, marker);
				    
	});
	
	// 마커에 마우스아웃 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'mouseout', function() {
		// 마커에 마우스아웃 이벤트가 발생하면 커스텀 오버레이 제거
		console.log("out");
		makerInfo.setMap(null);
		}); // end of event : mouseout
		
	
	// 마커에 클릭 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		console.log(tno);
		location.href="/selectmarker.wd?tno=" + tno;
	}); // end of event : click
		
	
}

// ------------------------------------------------------------------------------------


				//click Event
				kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

				    if (pop == false) {
				    	
				        // 클릭한 위도, 경도 정보를 가져옵니다 
				        sethideMarkers(map);
				        latlng = mouseEvent.latLng;
				        const moveLatLon = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
				        const popLocation = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
				        
				        let message = '위도  : ' + latlng.getLat();
				        message += '\n경도 : ' + latlng.getLng();
				        
				        console.log(message);
				    	
						 // 지도 이동 및 축소 제한
				    	 moveable = false;
						 map.setDraggable(moveable);
						 map.setZoomable(moveable);
				    	
				    	// Set Overlay
						// 커스텀 오버레이의 좌표를 설정합니다 
						customOverlay.setPosition(popLocation);
						overlaybox.classList.remove("hidden");
						//----------------------------------------------
						 
						 // 지도의 높낮이를 조정 합니다.
						 // defalt value == 3
						 let level = map.getLevel();
						 
						 if (level != 3) {
							 map.setLevel(3); 
						 }
						
						
						 // MoveToMap
						 // 지도 중심을 부드럽게 이동시킵니다
						 // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
						 map.panTo(moveLatLon);

						 
						// ---------------------------------------------
						 // Set Marker
						 const markerImage = new kakao.maps.MarkerImage(gifSrc, gifSize, gifOption);
						    
						 // 지도를 클릭한 위치에 표출할 마커입니다
						    
						 wmark = new kakao.maps.Marker({ 
						    	position : latlng,
						    	image : markerImage
						    }); 
						 wmark.setMap(map);

						 pop = true;

				    }
				      
				});


				
				</script>			
		</main>

		<!-- 바닥글 -->
		<jsp:include page="/footer.wd" />
		<!-- /바닥글 -->

		</div>
		<!-- /콘텐츠 -->
	</div>

</body>
</html>