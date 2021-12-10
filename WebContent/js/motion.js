

$(function(){

	$('.slide_button1').click(function(){
		
		//var 함수를 이용해 offset으로 선언 후 해당 태그 클래스경로로 가기위해서 offset()함수를 사용해 주었다.
		var offset = $('.container_visual1').offset(); 

		//animate() 함수를 이용해 0.4초 스무스하게 이동해주었다.
		//스크롤탑 함수를 이용해 offset.top만큼 움직이게 만들어주었다.
		$('html,body').stop().animate({scrollTop : offset.top}, 400);

	});

	$('.slide_button2').click(function(){

		var offset = $('.container_visual2').offset(); 
		$('html,body').stop().animate({scrollTop : offset.top}, 400);

	});

	$('.slide_button3').click(function(){

		var offset = $('.container_visual3').offset();
		$('html,body').stop().animate({scrollTop : offset.top}, 400);

	});

	$('.slide_button4').click(function(){

		var offset = $('.container_visual4').offset();
		$('html,body').stop().animate({scrollTop : offset.top}, 400);

	});

	var mHtml = $("html");
	var page = 1;


	mHtml.animate({scrollTop : 0},10);

	$(window).on("mousewheel", function(e) {

		if(mHtml.is(":animated")) return;

		if(e.originalEvent.deltaY > 0) {

			if(page == 3) return;
			page++;

		} else if(e.originalEvent.deltaY < 0) {

			if(page == 1) return;
			page--;

		}

		var posTop =(page-1) * $(window).height();

		mHtml.stop().animate({scrollTop : posTop});

	});

	// 메인상단 버튼관련 이벤트

	$(".container_top_text").hide();
	$(".container_top_text").fadeIn(800,function(){
		
		$(".container_inner a button").animate({marginTop:25},400);

	});

	$(".container_inner a button").mouseover(function(){
		
		$(".container_inner a button").trigger('startRumble');

	})

	//3번째 컨텐츠 변화 이벤트
	$(".side_button li:eq(0) button").click(function(){
        $(".side_txt li p:eq(0)").replaceWith("<p><span>여행 갈 때 반려동물을 맡길 때 가 없을 때</span><br>위드독으로 신뢰 같은 우리 이웃에게 돌봄 매칭하기</p>");
		$(".side_img li img:eq(0)").replaceWith("<img src='image/index/side_img1_1.png'>");
   });
   $(".side_button li:eq(1) button").click(function(){
        $(".side_txt li p:eq(0)").replaceWith("<p><span>매칭완료 후 원하는 날짜, 위치, 조건제시 후</span><br>조건이 맞다면 돌봄 매칭 시작</p>");
		$(".side_img li img:eq(0)").replaceWith("<img src='image/index/side_img2_1.png'>");
   });
   $(".side_button li:eq(2) button").click(function(){
        $(".side_txt li p:eq(0)").replaceWith("<p><span>사용자의 신청 조건을 선택 후</span><br>결제창으로 이동 후 원하는 방식으로 결제 진행</p>");
		$(".side_img li img:eq(0)").replaceWith("<img src='image/index/side_img3_1.png'>");
   });
   $(".side_button li:eq(3) button").click(function(){
        $(".side_txt li p:eq(0)").replaceWith("<p><span>돌봄 완료 후 해당 돌봄이의 대한 후기 작성!</span></p>");
		$(".side_img li img:eq(0)").replaceWith("<img src='image/index/side_img4_1.png'>");
   });
});