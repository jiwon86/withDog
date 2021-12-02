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
				
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
				<main>
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-xl px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="user"></i></div>
                                            Account Settings - Profile
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-4">
                        <!-- Account page navigation-->
                        <nav class="nav nav-borders">
                            <a class="nav-link active ms-0" href="#">신청현황</a>
                            <a class="nav-link" href="#">조건제시 현황</a>
                        </nav>
                    </div>
                	
                	 <div class="container">
	                     <a class="card card-icon lift lift-sm mb-4 mt-4" href="knowledge-base-category.html">
	                        <div class="row g-0">
	                      	    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	                            <div class="col-auto card-icon-aside bg-secondary text-white"><i class="fas fa-paw"></i></div>
	                            <div class="col">
	                                <div class="card-body py-5">
	                                    <h5 class="card-title text-primary mb-2">
		                                    <span>0001</span>
		                                    <span class="badge bg-success me-2">진행중</span>
	                                    </h5>
	                                    
	                                    <p class="card-text mb-1">지역 - 경기도 안양시 석수동</p>
	                                    <p class="card-text mb-1">기간 - 2021-11-05 12:00 ~ 2021-11-07 15:00</p>
	                                    <p class="card-text mb-1">금액 - 50,000원</p>
	                                    <p class="card-text mb-1">맡길동물 - 2마리</p>
	                                    <div class="small text-muted mt-2 mb-3">조건제시 5명..</div>
	                                    <button class="btn btn-warning" type="button">신청수정</button>
	                                    <button class="btn btn-danger ms-3" type="button">신청삭제</button>
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                     <a class="card card-icon lift lift-sm mb-4 mt-4" href="knowledge-base-category.html">
	                        <div class="row g-0">
	                      	    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	                            <div class="col-auto card-icon-aside bg-secondary text-white"><i class="fas fa-paw"></i></div>
	                            <div class="col">
	                                <div class="card-body py-5">
	                                    <h5 class="card-title text-primary mb-2">
		                                    <span>0002</span>
		                                    <span class="badge bg-success me-2">진행중</span>
	                                    </h5>
	                                    
	                                    <p class="card-text mb-1">지역 - 경기도 수원시 장왕동</p>
	                                    <p class="card-text mb-1">기간 - 2021-11-11 12:00 ~ 2021-11-15 15:00</p>
	                                    <p class="card-text mb-1">금액 - 50,000원</p>
	                                    <p class="card-text mb-1">맡길동물 - 2마리</p>
	                                    <div class="small text-muted mt-2 mb-3">조건제시 5명..</div>
	                                    <button class="btn btn-warning" type="button">신청수정</button>
	                                    <button class="btn btn-danger ms-3" type="button">신청삭제</button>
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                    <nav class="dataTable-pagination" style="float:right;">
		                   	 <ul class="dataTable-pagination-list" >
			                    <li class="active"><a href="#" data-page="1">1</a></li>
			                    <li class=""><a href="#" data-page="2">2</a></li>
			                    <li class=""><a href="#" data-page="3">3</a></li>
			                    <li class=""><a href="#" data-page="4">4</a></li>
			                    <li class=""><a href="#" data-page="5">5</a></li>
			                    <li class=""><a href="#" data-page="6">6</a></li>
			                    <li class="pager"><a href="#" data-page="2">›</a></li>
		                    </ul>
	                    </nav>
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