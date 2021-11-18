<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-lg-6">
                                <div class="text-center mt-4">
                                    <img class="img-fluid p-4" src="/template/assets/img/illustrations/403-error-forbidden.svg" alt="" />
                                    <p class="lead">당신은 이페이지에 접근할 권한을 가지고 있지 않습니다.</p>
                                    <a class="text-arrow-icon" href="/">
                                        <i class="ms-0 me-1" data-feather="arrow-left"></i>
                                                                          메인으로 이동
                                    </a>
                                </div>
                            </div>
                        </div>
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