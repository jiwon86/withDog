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
	<head>
		<!-- 제이쿼리  -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 자바스크립트 -->
		<script type="text/javascript">
			
			//GET방식------------------------------------------------------
			$(document).on("click","#SALL",function(){
				alert("getbtn 진입 >>>" );
				
				//GET방식 전달
				$("#methodForm").attr({
					"action":"petSelectAll.wd",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
						}).submit();
					});
			
			//GET방식------------------------------------------------------
			$(document).on("click","#I",function(){
				alert("I 진입 >>>" );
				
				//GET방식 전달
				$("#methodForm").attr({
					"action":"petInsertForm.wd",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
						}).submit();
					});
			
			//POST방식------------------------------------------------
			$(document).on("click","#pst",function(){
				alert("postbtn 진입 >>>" );
				
				//POST방식 전달
				$("#methodForm").attr({
					"action":"petInsertForm.wd",
					"method":"POST",
					"enctype":"application/x-www-form-urlencoded"
						}).submit();
					});
		</script>
	</head>
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
					<form name ="methodForm" id = "methodForm">
						<button type ="button" id="SALL">SelectAll</button>
						<button type ="button" id="I">InsertForm</button>
					</form>
				</main>
				
					<h3>MyPetList</h3>
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					TEST
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
				
				<!-- ** /주요 내용 ** -->
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>