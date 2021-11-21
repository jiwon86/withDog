<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
	jsp:include : 내 서버내의 jsp파일만 가능
	c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
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
					
				</main>
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					TEST
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
               <main style="width:960px; margin:0 auto;">
                     <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="layout"></i></div>
                                            <span>조건제시 상세정보</span>
                                        </h1>
                                        <div class="page-header-subtitle">The default page header layout with main content that overlaps the background of the page header</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- 상세 돌봄신청 정보 -->
                    <div class="container-xl px-4 mt-n10">

                        <div class="card mb-4 mt-4">
                            <div class="card-header d-flex align-items-center">
                                <a class="btn btn-transparent-dark btn-icon" onclick="javascript:history.back();"><i data-feather="arrow-left"></i></a>
                                <div class="ms-3">
                                	<div class="my-3">
                                		<span style="font-size:35px; font-weight:bold;">D202111200001</span> &nbsp;
                                	</div>	
                                </div>
                            </div>
                            
                            <div class="card-body">
                            	<div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-user"></i> &nbsp; 
	                                	<span>계정 아이디</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-2">경기도 안양시 석수동</p>
                                </div>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-coins"></i> &nbsp; 
	                                	<span>요구금액</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-5 ms-3">50,000원</p>
                                </div>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-map-marked-alt"></i> &nbsp; 
	                                	<span>지역</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-3">2021/11/05 12:00 ~ 2021/11/07 15:00</p>
                                </div>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="far fa-edit"></i> &nbsp; 
	                                	<span>추가 요구사항</span>
	                                </h4>
			                        <hr>
	                                <div class="lead mb-5 ms-3" style="max-width:500px; background:#e8e8e8; padding:20px; border-radius:20px;">
	                                	gssdgsdgsdgsdgsdgfdgdfgsbstrbstgesgsergesrgergersgersggeherherherhrehreherhereheheheheherhreheheheherherherher
	                                </div>
                                </div>
                                
                                <button class="btn btn-primary hahmlet" type="button">
		                       		<i class="far fa-check-circle"></i> &nbsp; 수락
		                       	</button>
		                       	<button class="btn btn-red hahmlet" type="button">
		                       		<i class="fas fa-check-circle"></i> &nbsp; 수락해제
		                       	</button>
		                       	
                            </div>
                        </div>
                        <!-- /상세 돌봄신청 정보 -->
                        
                    </div>
                </main>				
				<!-- ** /주요 내용 ** -->
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>