<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="a.b.c.com.member.vo.MemberVO"%>
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
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f59b335fdce7811c29ddb73572e2a37b&libraries=services"></script>
				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%
	MemberVO member = (MemberVO)request.getAttribute("member");
%>

						
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
	const	imageSrc = "image/map/dogmarker.png", // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
			imageOption = {offset: new kakao.maps.Point(35, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	const	gifSrc = "image/map/marker.gif", // 마커이미지의 주소입니다    
			gifSize = new kakao.maps.Size(80, 80), // 마커이미지의 크기입니다
			gifOption = {offset: new kakao.maps.Point(35, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.    	
				
	
	let		pop = false;
	let		moveable = false;

	let		latlng; // 위도 경도 
	let		markers = [];
	let		wmark;
	let 	jsonData;
	let		load = 0; // JSON Data 로드 체크
	let 	petinfo;
	let		id = '${member.mid}';
	
		
//-------------------------------------------------------------------------------------
// Set Popup Overlay

//지도 중심 좌표 얻어오기
let center = map.getCenter();
// 커스텀 오버레이드 Html tag
let content ='<form id="popup" class="popup">'
+'<div class="overlaybox" id="overlaybox">'
+'<div class="title-header">'
	+'<header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">'
	+	'<div class="container-xl px-4">'
	+       '<div class="page-header-content pt-4">'
	+            '<div class="row align-items-center justify-content-between">'
	+                '<div class="col-auto mt-4">'
	+                   '<h1 class="page-header-title">'
	+                        '<div class="page-header-icon"><i data-feather="edit-3"></i></div>'
	+                       	'돌봄 신청 작성하기'
	+							'<button class="btn btn-red btn-icon cancle" type="button" id="cancle">'
	+					    	'<i class="fas fa-times-circle fa-3x"></i>'
	+					'</button>'
	+                   '</h1>'
	+                  '<div class="page-header-subtitle">돌봄 시 필요한 사항들을 적어주세요.</div>'
	+                '</div>'
	+            '</div>'
	+        '</div>'
	+   '</div>'
	+'</header>'
+'</div>'
+'<div class="area_1">'
+	'<ul class="list">'	
+		'<li><label for="title">asd</label><input type="text" id="title" name="title" class="form-control"></li>'
+		'<li id="dogs"><label for="dogs"><i class="fas fa-dog"></i>&nbsp;돌 볼 반려동물</label><br>&nbsp&nbsp'
			
+			'</li>'
+		'<li><label for="when"><i class="far fa-clock"></i>&nbsp;기간</label><div class="item_2"><input type="datetime-local" class="form-control" id="when_1" name="when_1" placeholder="맡기실 기간을 입력해주세요.">'
+ 			' <i class="fas fa-bone fa-2x"></i><input type="datetime-local" class="form-control" id="when_2" name="when_2"></div></li>'
+		'<li><label for="price"><i class="fas fa-coins"></i>&nbsp;돌봄 비용</label><input type="number" class="form-control" id="price" name="price" placeholder="돌봄이 에게 지급할 금액입니다."></li>'
+		'<li><label for="content"><i class="fas fa-envelope-open-text"></i>&nbsp;상세 사항</label><textarea class="form-control" id="content" name="content" rows="3" placeholder="돌봄 시 필요한 사항을 적어주세요."></textarea></li>'
+		'<li><label for="photo"><i class="fas fa-images"></i>&nbsp;반려동물 사진</label><input type="file" class="form-control" id="photo" name="photo"></li>'
+		'<li><label for="addr_2"><i class="fas fa-map-marked-alt"></i>&nbsp;주소 정보</label><div class="item_2"><input type="text" class="form-control addr" id="addr_1" name="addr_1" readonly>'
+			'<i class="fas fa-bone fa-2x"></i><input type="text" class="form-control addr" id="addr_2" name="addr_2">'
+			'</div></li>'
+		'<li><button class="btn btn-primary smit" type="button" id="submit">신청 하기</button></li>'
+'			<input type="hidden" id="lat" name="lat" value=""></input>	' 
+'			<input type="hidden" id="lng" name="lng" value=""></input>'	
+'			<input type="hidden" id="pno" name="pno" value=""></input>'	
+'			<input type="hidden" id="addr" name="addr" value=""></input>'	
+'</ul></div>'
+'</div></form>';


const customOverlay = new kakao.maps.CustomOverlay({
    position: center,
    content: content  
});



// 커스텀 오버레이를 생성 한다.
customOverlay.setMap(map);


//OverlayBox - 생성시 classList hidden을 줘서 display : none 시킨다.
const overlaybox = document.getElementById("overlaybox");
overlaybox.classList.add("hidden");


// 시간을 관리하는 함수
function addTime (str, time) {
	
	// str = h 시간// m 분
	// time 더 할 시간
	let nowDate = new Date();
	
	let month = nowDate.getMonth() + 1;
	
	if (str == 'm') {
		nowDate.setMinutes(nowDate.getMinutes() + time);
	}
	
	if (str == 'h') {
		nowDate.setHours(nowDate.getHours() + time);
	}
	
	let year = nowDate.getFullYear();
		month = month.toString().padStart(2, '0');
	let date = nowDate.getDate().toString().padStart(2, '0');
	let hours = nowDate.getHours().toString().padStart(2, '0');
	let minutes = nowDate.getMinutes().toString().padStart(2, '0');

	
	nowDate =  year + '-' + month + '-' + date + 'T' + hours + ':' + minutes;
	
	console.log(nowDate);
	
	return nowDate;
	
}



// 날짜 세팅
const when_1 = document.getElementById('when_1');
const when_2 = document.getElementById('when_2');
// 반려동물 리스트
const dogs = document.getElementById('dogs');




//----------------------------------------------------------------------------------
$(document).ready(function(){
	
	// json 최신화
	markersjson(1);
	// 위치 불러오기
	getlocation();
	
	$('#submit').click(function(){	
		// 게시글 등록
	    const form = $('#popup')[0];  	          
	    let Lat = latlng.getLat();
	    let Lng = latlng.getLng();
	    let addr_1 = document.getElementById("addr_1").value;
	    let addr_2 = document.getElementById("addr_2").value;
	    
		document.getElementById("lat").value = Lat;
		document.getElementById("lng").value = Lng;
		document.getElementById("addr").value = addr_1 + " " +addr_2;
		let formdata = new FormData(form);
    
		console.log(Lat);
		console.log(Lng);
		console.log(addr);
		
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
	
	// 멤버 번호를 가져옴
	let mno = "mno="+'${member.mno}';
	// 펫정보 가져오기
	$.ajax({			
		url : 'petlist_id.wd',		
		type : 'get',
		data : mno,
		
		dataType : 'json',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	    success: function (data){
	    	console.log(data);
	    	petinfo = data;
	    	// 반려동물 리스트	
	    	if (petinfo.length != 0) {
		    	for (i=0; i < petinfo.length; i++) {
		    		pname = petinfo[i].pname;
		    		pno = petinfo[i].pno;
		    		dogs.innerHTML +=  "<input class='form-check-input' id='"+ pno +"' type='checkbox'" + "value=" + pno + " OnClick='checkDog(this)'>&nbsp&nbsp"
										+ "<label class='form-check-label' for='" +pno + "'>" + pname + "</label>&nbsp&nbsp&nbsp&nbsp"
		    		//dogs.innerHTML += "<option>"+petinfo[i].pname+"</option>";
		    	}
	    	} else {
	    		dogs.innerHTML +=  "<a href='/petSelectAll.wd?mno=${member.mno}'> 반려동물 등록 하기</a>";
	    	}
	    },
	    error: function (error){
	        alert(error);
	    }
	}); // end of ajax()
	
});

// 체크박스 이벤트
function checkDog (box) {
	
	let pno = document.getElementById("pno");
	let checkbox = box.value;
	
	if (box.checked == true) {
		pno.value += checkbox+" ";
	} else {
		pno.value = pno.value.replace(checkbox, "");
	}
	console.log(pno.value);
}


// 마커의 대한 json data를 가져온다
function markersjson (x) {
	//MARKER DB -> JSON 최신화
	// x = 1 처음 실행
	// x = 2 인서트 후 실행
	$.ajax({			
				url : 'setmarkers.wd',		
				type : 'get',			
				success: function (data){
					console.log("JSON DATA 동기화 : " + data);
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
					    	
					   	jsonData = data;
					   	let i;
					    let size = jsonData.length;
					    
						    if (x == 1){
						    	i = 0;
						    } else {
						    	i = size-1;
						    }
						    
						    console.log(jsonData);
	   						if (size != 0) {
							    for (i; size > i; i++ ){
							    	const propose = jsonData[i].propose;
								    if (propose === "0") {
								    	const tno = jsonData[i].tno;
								    	const title = jsonData[i].title;
								    	const photo = jsonData[i].photo;
								    	const price = jsonData[i].price;
								    	const writer = jsonData[i].writer;
								    	const startdate = jsonData[i].startdate;
								    	const enddate = jsonData[i].enddate;
								    	const address = jsonData[i].address;
								    	const mno = jsonData[i].mno;
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
										markerInfoSet(title,marker,photo,markLocation,price,tno,writer,startdate,enddate,address,mno);
							        }
							    }
	   						}
						    //로드 완료	
						    load = 1;
						    console.log("Marker Load");
						 },
						    error: function (error){
						        alert("에러");
						    }
					
				});
	}

function markerInfoSet (title,marker,photo,markLocation,price,tno,writer,startdate,enddate,address,mno) {
	
	let makerInfo;
	
	// 마커에 마우스 오버 이벤트 추가
	kakao.maps.event.addListener(marker, 'mouseover', function() {
		var iwContent = '<div class="tradeinfo" style="padding:5px;">'
						+ '<img class="dogimg" src=/img/map/' + photo +'>'
						+ '<div class="tradeinfo_2">'
						+ '<ul class="tradelist">'
						+ '<li><i class="fas fa-user-alt"></i>&nbsp;작성자 : '+ writer + '</li>'
						+ '<li><i class="far fa-clock"></i>&nbsp;시작 기간 : ' + startdate + ' </li>'
						+ '<li><i class="far fa-clock"></i>&nbsp;종료 기간 : ' + enddate + ' </li>'
						+ '<li><i class="fas fa-coins"></i>&nbsp;돌봄 비용 : ' + price + '</li>'
						+ '<li><i class="fas fa-map-marked-alt"></i>&nbsp;주소 : ' + address + ' </li>'
						+'</ul></div></div>'; 

	
	makerInfo = new kakao.maps.CustomOverlay({
		    position: markLocation,
		    content: iwContent,
		    xAnchor: 0.5,
		    yAnchor : 1.15
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
		if (id === writer) {
			// 자기 글
			location.href="/offerSelect.wd?tno=" + tno;
		} else {
			// 신청자
			location.href="/offerMapSelect.wd?tno=" + tno + "&mno=" + mno;
		}
		
	}); // end of event : click
		
	
}

// ------------------------------------------------------------------------------------

let geocoder = new kakao.maps.services.Geocoder();

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

				//click Event
				kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

				    if (pop == false && load == 1) {
				    	
				    	// 주소-좌표 변환 객체를 생성합니다
				    	searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				    		let roadaddr = document.getElementById('addr_1');
				    		roadaddr.value = result[0].address.address_name;
				    	});
				    	
				    	
				        // 클릭한 위도, 경도 정보를 가져옵니다 
				        sethideMarkers(map);
				        latlng = mouseEvent.latLng;
				        const moveLatLon = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
				        const popLocation = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
				        
				        let message = '위도  : ' + latlng.getLat();
				        message += '\n경도 : ' + latlng.getLng();
				        
				        console.log(message);
				        
				        // 시간 설정
				        let startDate = addTime('m', 30); // 30분
						let endDate = addTime('h', 3); // 3시간
				        when_1.value = startDate;
						when_1.setAttribute('min', startDate);
						when_2.value = endDate;
						when_2.setAttribute('min', endDate);
				    	
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