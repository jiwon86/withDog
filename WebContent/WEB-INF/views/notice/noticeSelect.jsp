<%@page import="java.util.List"%>
<%@page import="a.b.c.com.notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
				<main style="width:960px; margin:0 auto;">
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
                        
                    </header>

<%
List<NoticeVO> listS = (List<NoticeVO>)request.getAttribute("listS");
int nCnt = listS.size();

for(int i=0; i<nCnt; i++){
	NoticeVO nvo = listS.get(i);
%>
                 
                    
                    <!-- Main page content-->
                    <div class="container-fluid px-4">
                        <div class="row gx-4">
                            <div class="col-lg-8">
                               <div class="card mb-4" style="width:900px;">
                                    <div class="card-header" style="height:40px; line-height:15px; ">
                                    	<span style="font-size:25px; color:black;">[<%= nvo.getNnum() %>] <%= nvo.getNsubject() %></span>
                                    </div>
                                    <div class="card-body">
                                    	<div style-"font-size:12px; color:gray;"><%= nvo.getNwriter() %> | 작성일 : <%= nvo.getInsertdate() %></div>
                                    	<a href="/img/notice/<%= nvo.getNfile() %>" download><i data-feather="file"></i> <%= nvo.getNfile() %> 다운로드</a>
                                    	<hr>
                                    	<br>
                                    	<div><pre><%= nvo.getNcontents() %></pre></div>
                                    	<br>
                                    	<sec:authorize access="hasRole('ROLE_ADMIN')">
	                                    	<a class="btn btn-warning" href="noticeUpdate.wd?nnum=<%= nvo.getNnum() %>">수정</a>
											<a class="btn btn-danger" href="noticeDelete.wd?nnum=<%= nvo.getNnum() %>">삭제</a>
	                                    	<!--<a href="noticeDelete.wd?nnum=<%=nvo.getNnum()%>"><button class="btn btn-danger" type="button" id="D">삭제</button></a>   -->
                                    	</sec:authorize>
                                    </div>
                                </div>
                            </div>
<%
						}
%>
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