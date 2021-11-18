<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
	<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
	<!-- /헤드 -->

    <body class="nav-fixed">

		<!-- 헤더 -->
		<%@ include file="/WEB-INF/views/fragment/header.jsp" %>
		<!-- /헤더 -->

		
        <div id="layoutSidenav">
			<!-- 사이드바 -->
			<%@ include file="/WEB-INF/views/fragment/sidebar.jsp" %>
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
                                            <div class="page-header-icon"><i data-feather="layout"></i></div>
                                            Boxed Layout
                                        </h1>
                                        <div class="page-header-subtitle">On larger screens, this layout will keep the page content from expanding beyond a max width.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4">
                        <div class="card mt-n10">
                            <div class="card-header">Boxed Layout Example</div>
                            <div class="card-body">This is an example of a page with the default boxed layout. We've expanded Bootstrap by adding a new xxl breakpoint. As the screen width gets larger, the container element will set a max width to the content. The boxed layout uses the max width container element on the page header and in the main page content in this example.</div>
                        </div>
                    </div>
                </main>
				<!-- ** 주요 내용 **  -->
				
				<!-- ** /주요 내용 ** -->
				
				<!-- 바닥글 -->
				<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>