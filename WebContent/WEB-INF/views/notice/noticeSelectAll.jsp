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
	
	</script>
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

                                            <div class="page-header-icon"><i data-feather="filter"></i></div>

                                            		공지사항

                                        </h1>

                                        <div class="page-header-subtitle">서비스 이용시 주의사항 및 공지사항  페이지 입니다. 꼭 참고하여 올바른 서비스 사용을 부탁드립니다^^</div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </header>

                    <!-- Main page content-->

                    <div class="container-xl px-4 mt-n10">

                        <div class="card mb-4">
							<a class="btn btn-primary btn-sm" href="noticeInsert.wd">
                                            <i class="me-1" data-feather="external-link"></i>
                                            공지사항 작성하기
                                        </a>
                            <div class="card-header">공지사항 & 서비스 이용 주의사항</div>

                            <div class="card-body">
                            

                                <table id="datatablesSimple">

                                    <thead>

                                        <tr>

                                            <th>순번</th>

                                            <th>공지사항 제목</th>

                                            <th>내용</th>

                                            <th>작성자</th>

                                        </tr>

                                    </thead>

                                    <tbody>

                                       

                                       
                                        <tr>

                                            <td>Michael Bruce</td>

                                            <td>Javascript Developer</td>

                                            <td>Singapore</td>

                                            <td>29</td>

                          						<td><a href="noticeSelect.wd"><div class="badge bg-secondary text-white rounded-pill">상세보기</div></a></td>

                                            <td>

                                                <button class="btn btn-datatable btn-icon btn-transparent-dark"><i data-feather="trash-2"></i></button>

                                            </td>

                                        </tr>

                                        <tr>

                                            <td>Donna Snider</td>

                                            <td>Customer Support</td>

                                            <td>New York</td>

                                            <td>27</td>

                                            <td><a href="noticeSelect.wd"><div class="badge bg-secondary text-white rounded-pill" href="noticeSelect.wd">상세보기</div></a></td>

                                            <td>

                                                <button class="btn btn-datatable btn-icon btn-transparent-dark"><i data-feather="trash-2"></i></button>

                                            </td>

                                        </tr>

                                    </tbody>

                                </table>

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