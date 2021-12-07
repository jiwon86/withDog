<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
	jsp:include : 내 서버내의 jsp파일만 가능
	c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>with Dog</title>
<link rel="stylesheet" type="text/css" href="css/index/style.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/motion.js"></script>
<script>

	$( document ).ready( function() {
		AOS.init();
	} );

</script>
</head>
<body>

	<div class="wrap">
		
		<nav>
			<ul class="button_wrap gnb_slider">
				<li><button class="slide_button1"><img src="image/index/button_1.png" alt="버튼"></button></li>
				<li><button class="slide_button2"><img src="image/index/button_1.png" alt="버튼"></button></li>
				<li><button class="slide_button3"><img src="image/index/button_1.png" alt="버튼"></button></li>
			</ul>
		</nav>

		<div class="container_visual1">
			
			<div class="container_inner1">
				
				<p class="container_top_text"><b>우리동네 반려동물 돌봄 서비스</b></p>

				<a href="withmap.wd"><button ani_type="bounce">돌봄 시작하기</button></a>


			</div>

				-->
			<!-- ** 주요 내용 **  -->

			<!-- ** /주요 내용 ** -->

			<!-- 바닥글 -->
			<jsp:include page="/footer.wd" />
			<!-- /바닥글 -->

		</div>
		<div class="container_visual2">
			
			<div class="container_inner2" class="con2">
				
				<div class="con2_1">
					<div class="con_text">
						<p>1등 돌봄 서비스 <b>위드독</b></p>
						<p>돌봄이 매칭 수 <b class="con2_b ml1">30,550건</b></p>
						<p><span class="ml1">누적 돌봄 수</span>  <b class="con2_b">220,502건</b></p>
						<p><span class="ml2">돌봄 마리 수</span>  <b class="con2_b">50,502건</b></p>
					</div>
					<div class="con2_1_imgwrap">
						<img class="con2_1_img" src="image/index/back.png" data-aos="zoom-in" alt="이미지">
					</div>
				</div>

				<div class="con2_2">
					<div class="con2_back">
						<img class="con2_back_img" data-aos="fade-left" src="image/index/con2_rigth.png" alt="이미지">
					</div>
				</div>


			</div>

		</div>
		<div class="container_visual3">
			
			<div class="container_inner3" class="con3">
				<div class="left_con2">
					<div class="content_txt2">
						<p class="side_writer">돌봄이가 필요할때<br><b>위드독</b>을 부르세요!</p>
					</div>
					<ul class="side_button">
						<li><button>매칭하기</button></li>
						<li><button>매칭완료</button></li>
						<li><button>결제완료</button></li>
						<li><button>후기작성</button></li>
					</ul>
					<div class="side_txt_out">
						<ul class="side_txt">
							<li>
								<p><span>여행 갈 때 반려동물을 맡길 때 가 없을 때</span><br>위드독으로 신뢰 같은 우리 이웃에게 돌봄 매칭하기</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="right_con2">
					<ul class="side_img">
						<li>
							<img src="image/index/side_img1.png">
						</li>
					</ul>
				</div>
			</div>

		</div>
<!-- 
		<div class="container_visual4">
			
			<div class="container_inner4" class="con4">
				
				

			</div>

		</div>

 -->
	</div>

</body>
</html>