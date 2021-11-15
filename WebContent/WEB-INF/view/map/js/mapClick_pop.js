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
'            <span class="number"><input type="text" class="inputtext" placeholder="제목을 입력 하세요."></input></span>' +
'        </li>' +
'        <li>' +
'            <span class="title">돌봄이 에게 바라는 사항</span><br>' +
'            <span class="number"><textarea id="memo" name="memo" class="text" cols="40" rows="10" placeholder="돌봄이에게 바라는 사항을 입력해주세요."></textarea></span>' +
'        </li>' +
'		<li>' +
'            <span class="title">강아지 사진을 올려주세요!</span><br>' +
'            <span class="imgfile"><input type="file"></span>' +
'        </li>' +
'		<li>' +
'            <span class="title">돌봄 비용</span><br>' +
'            <span class="number"><input type="text" class="inputtext" placeholder="돌봄이에게 지급 할 금액 입니다."></span>' +
'        </li>' +
'		<li>' +
'            <span class="title">돌봄 기간</span><br>' +
'            <span class="number"><input type="text" name="when" id="when" class="inputtext" placeholder="기간을 입력해주세요."></span>' +
'        </li>' +
'            <span class="cancle"><input class="butt" id="cancle" type="button" value="취소"></span>' +
'            <span class="submit"><input class="butt" id="submit" type="button" value="확인"></span>' +
'    </ul>' +
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





//----------------------------------------------------------------------------------------
	

$(document).ready(function(){	
		$('#submit').click(function(){
		 
		let memo = $("#memo").val();
	    let Lat = latlng.getLat();
	    let Lng = latlng.getLng();
	    let markcount =  markers.length - 1;
		console.log(Lat);
		console.log(Lng);
		//AJAX TEST	
		$.ajax({			
			url : '/Rash/test01',		
			type : 'get',			
			data : {
				memo : memo
				,Lat : Lat
				,Lng : Lng
				,markcount : markcount
			},
		    success: function (data){
		        alert("데이터전송 성공");
		    },
		    error: function (error){
		        alert("에러");
		    }
		}); // end of ajax()
	});
});

// 취소 시 팝업을 하이드 시킴
function hidePopup(event) {
	overlaybox.classList.add("hidden");
    
	moveable = true;
	map.setDraggable(moveable);
	map.setZoomable(moveable);
	
	let markcount =  markers.length - 1;
	
	markers[markcount].setMap(null);
	pop = false;
}

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < mark.length; i++) {
        mark[i].setMap(map);
    }            
}

function submitPopup() {
	
	overlaybox.classList.add("hidden");
    
	moveable = true;
	map.setDraggable(moveable);
	map.setZoomable(moveable);
	pop = false;
	
	let markcount =  markers.length - 1;
	
	kakao.maps.event.addListener(markers[markcount], 'mouseover', function() {
		 // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				 
				 
				 
				 $.ajax({			
						url : '/Rash/test02',		
						type : 'get',			
						data : {
							markcount : markcount
						},
					    success: function (data){

					    	const result = $(data).find("result").text();		
					    	//alert(data);
					    	//alert(result);
					        
					        
					        var iwContent = '<div style="padding:5px;">'+result+'</div>'; 

					        var infowindow = new kakao.maps.InfoWindow({
					            content : iwContent
					        });
					        
					        infowindow.open(map, markers[markcount]);
					        
					    	// 마커에 마우스아웃 이벤트를 등록합니다
					    	kakao.maps.event.addListener(markers[markcount], 'mouseout', function() {
					    	    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
					    	    infowindow.close();
					    	});
					    	
					    },
					    error: function (error){
					        alert("에러");
					    }
					}); // end of ajax()
	});
	

}

// 
const pbutt_cancel = document.getElementById("cancle");
const pbutt_submit = document.getElementById("submit");

// Set Event
pbutt_cancel.addEventListener("click" ,hidePopup);
pbutt_submit.addEventListener("click" ,submitPopup);


