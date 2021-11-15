<!-- 
	Github 테스트
	sanghyeok
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
	<%@ include file="/WEB-INF/view/fragment/head.jsp" %>
	<!-- /헤드 -->

    <body class="nav-fixed">

		<!-- 헤더 -->
		<%@ include file="/WEB-INF/view/fragment/header.jsp" %>
		<!-- /헤더 -->

		
        <div id="layoutSidenav">
			<!-- 사이드바 -->
			<%@ include file="/WEB-INF/view/fragment/sidebar.jsp" %>
			<!-- /사이드바 -->

			<!-- 콘텐츠 -->
            <div id="layoutSidenav_content">
				
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					TEST 1 
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
				
				<!-- ** /주요 내용 ** -->
				
				<!-- 바닥글 -->
				<%@ include file="/WEB-INF/view/fragment/footer.jsp" %>
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>