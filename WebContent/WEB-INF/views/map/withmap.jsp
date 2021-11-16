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
			
				<div id="map" class="map"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f59b335fdce7811c29ddb73572e2a37b"></script>
				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
								
				<script>
				const container = document.getElementById('map');
				const options = {
					center: new kakao.maps.LatLng(37.3971709, 126.8007997),
					level: 3
				};

				const	map = new kakao.maps.Map(container, options);

				</script>
			


		<!-- 바닥글 -->
		<jsp:include page="/footer.wd" />
		<!-- /바닥글 -->

		</div>
		<!-- /콘텐츠 -->
	</div>

</body>
</html>