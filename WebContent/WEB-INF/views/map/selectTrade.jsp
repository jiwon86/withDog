<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="a.b.c.com.map.vo.MapTradeVO"%>
<%-- 
	jsp:include : 내 서버내의 jsp파일만 가능
	c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
<head>
<%
	Object obj = request.getAttribute("listall");
	if (obj == null) return;
	
	String loginid = (String)request.getAttribute("loginid");
	
	ArrayList<MapTradeVO> listall = (ArrayList<MapTradeVO>)obj;
	int nCnt = listall.size();
	
	
%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

function clickbutt(a) {
	location.href="/selectmarker.wd?tno="+a;
}
</script>
</head>
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
				 	<header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="github"></i></div>
                                            	돌봄 현황
                                        </h1>
                                        <div class="page-header-subtitle">돌봄 서비스를 구인하거나 신청중인 현황을 볼 수 있어요!</div>
                                    </div>
                                    <div class="col-12 col-xl-auto mt-4">WITH DOG</div>
                                </div>
                            </div>
                        </div>
                    </header>
                    
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                    <% 
                    	for(int i=0; nCnt > i; i++){
                    		MapTradeVO mvo = listall.get(i);
                    		String tno = mvo.getTNO();
                    		String writer = mvo.getTWRITER();
                    %>
					<div class="card card-header-actions">
					<% if(loginid.equals(writer)){
					%>
						<div class="card-header">
					<% } else {
					%>	
						<div class="card-header bg-warning text-white">
					<% } %>
							<%=mvo.getTTITLE()%>
							<div class="dropdown no-caret">
								<button
									class="btn btn-transparent-dark btn-icon dropdown-toggle"
									id="dropdownMenuButton" type="button" data-bs-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">
									<i data-feather="more-vertical"></i>
								</button>
								<div
									class="dropdown-menu dropdown-menu-right animated--fade-in-up"
									aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="#!">Action</a> <a
										class="dropdown-item" href="#!">Another action</a> <a
										class="dropdown-item" href="#!">Something else here</a>
								</div>
							</div>
						</div>
						<div class="card-body">
							<%=mvo.getTCONTENT()%>
							<button class="btn btn-success" id="submit" type="button" onclick="clickbutt('<%= tno %>')">자세히 보기</button>
						</div>
					</div>
					<%
						}
					%>
                    </div>
					
					
				</main>
			
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />

                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>