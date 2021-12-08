<%@page import="a.b.c.com.member.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="a.b.c.com.pet.vo.PetVO"%>
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
		<script>
		$(document).ready(function(){	
			$("#SelectAll").click(function(){
				//alert("mno >>>" + petinsert.mno.value);
				$("#petinsert").attr({ "method":"POST","action":"petSelectAll.wd"}).submit();
			});
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
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-xl px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="user"></i></div>
                                                                                  내 프로필
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
                            <a class="nav-link" href="/profile.wd">프로필정보</a>
                            <a class="nav-link active ms-0" href="#" id="Mypet">동물정보</a>
                            <a class="nav-link" href="/mypay.wd">포인트정보</a>
                            <a class="nav-link" href="myReviewList.wd">리뷰정보</a>
                        </nav>
                        <hr class="mt-0 mb-4" />
                <form id="petinsert" name="petinsert">
            	<script type="text/javascript">
					<%
						MemberVO member = (MemberVO)request.getAttribute("member");
						System.out.println("mno >>>>" + member.getMno());
					%>
				</script>
					<input type="hidden" id="mno" name="mno" value = <%=member.getMno() %>>
					<div class="card">
					    <div class="card-header">수정 완료</div>
					    <div class="card-body">나의 댕댕이 정보 삭제가 완료되었습니다.</div>
					</div>
					<hr class="my-4" />
                    <div class="d-flex justify-content-between">
                        <button class="btn btn-primary" type="button" id="SelectAll" name="SelectAll" >목록</button>
                    </div>
                    </form>
				</main>
				
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					TEST
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
				<!-- 
				<div class="card">
					<img class="card-img-top" src="" alt="사진준비중">
					<div class="card-body">
						<h5 class="card-title">Test card</h5>
						<p class="card-text">
						</p>
					</div>
				</div>
				 -->
				
				<!-- ** /주요 내용 ** -->
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>