<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="a.b.c.com.map.vo.MapTradeVO"%>
<%-- 
	jsp:include : 내 서버내의 jsp파일만 가능
	c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
<head>
<%
	Object obj = request.getAttribute("mvo");
	if (obj == null) return;
	
	MapTradeVO mvo = (MapTradeVO)obj;
	
%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$('#submit').click(function(){
		
	});
}); // end ready
</script>
</head>
	<jsp:include page="/head.wd" />
	<!-- /헤드 -->

    <body class="nav-fixed">

		<!-- 헤더 -->
		<jsp:include page="/header.wd" />
		<!-- /헤더 -->

		
        <div id="layoutSidenav">
			<!-- 사이드바 -->
			<jsp:include page="/sidebar.wd" />
			<!-- /사이드바 -->

			<!-- 콘텐츠 -->
            <div id="layoutSidenav_content">
				<main>
				 	<header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="github"></i></div>
                                            	돌봄 신청하기
                                        </h1>
                                        <div class="page-header-subtitle">Use this blank page as a starting point for creating new pages inside your project!</div>
                                    </div>
                                    <div class="col-12 col-xl-auto mt-4">WITH DOG</div>
                                </div>
                            </div>
                        </div>
                    </header>
                    
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                        <div class="card">
                            <div class="card-header"><%= mvo.getTTITLE()%></div>
                            <div class="card-body"><%= mvo.getTCONTENT() %><br>
                            <button class="btn btn-success" id="submit" type="button">신청하기</button>
                            
                            </div>
                        </div>
                    </div>
					
					
				</main>
			
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />

                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>