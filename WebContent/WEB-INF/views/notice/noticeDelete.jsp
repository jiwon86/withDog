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
	
	
	<style>
#abcd.btn.btn-sm.btn-light.text-primary{}
		
	</style>
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
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="file-text"></i></div>
                                            	공지사항
                                        </h1>
                                    </div>
                                    <div class="col-12 col-xl-auto mb-3">
                                        <a class="btn btn-sm btn-light text-primary" href="noticeSelectAll.wd">
                                            <i class="me-1" data-feather="arrow-left"></i>
                                          	  공지사항 전체목록
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="noticeSelectAll.wd"><button class="btn btn-danger me-2 my-1" type="button" style="float:right" >공지사항 삭제</button></a>
                        <a href="noticeUpdate.wd"><button class="btn btn-primary me-2 my-1" type="button" style="float:right">공지사항 수정</button></a>
                    </header>
                    <!-- Main page content-->
                    <div class="container-fluid px-4">
                        <div class="row gx-4">
                            <div class="col-lg-8">
                               <div class="card mb-4" style="width:900px;">
                                    <div class="card-header" style="height:40px;line-height:15px;">공지사항 제목</div>
                                    <div class="card-body"><input class="form-control" id="postTitleInput" type="text" placeholder="" value=""  style="height:10px;"/></div>
                                </div>
                                
                               <div class="card mb-4" style="width:900px;">
                                    <div class="card-header" style="height:40px;line-height:15px;">작성자</div>
                                    <div class="card-body"><input class="form-control" id="postTitleInput" type="text" placeholder="" value=""  style="height:10px;"/></div>
                                </div>
                                
                                <div class="card card-header-actions mb-4" style="width:900px;">
                                    <div class="card-header">공지사항 내용</div>
                                    <div class="card-body"><textarea class="lh-base form-control" type="text" placeholder="" rows="4" style="height:500px;"></textarea></div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                    <div class="card-body"></div>
                            </div>
                        </div>
                    </div>
                </main>
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