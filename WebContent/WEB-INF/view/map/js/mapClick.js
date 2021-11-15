// Set Value 
const	imageSrc = "img/maker.png", // 마커이미지의 주소입니다    
    	imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
    	imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

let		pop = false;
let		moveable = false;
let		markers = [];
let		latlng;


// ------------------------------------------------------------------------------------


//click Event
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    latlng = mouseEvent.latLng;
    const moveLatLon = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
    const popLocation = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()+0.003);
    
    let message = '위도  : ' + latlng.getLat();
    message += '\n경도 : ' + latlng.getLng();
    
    console.log(message);
     

    if (pop == false) {
    	
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
		 const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		    
		 // 지도를 클릭한 위치에 표출할 마커입니다
		    
		 let marker = new kakao.maps.Marker({ 
		    	position : latlng,
		    	image : markerImage
		    }); 
		 

		 
		 marker.setMap(map);
		 markers.push(marker);
		 
		 pop = true;

    }
      
});


