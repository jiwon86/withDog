<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="a.b.c.com.review.vo.ReviewVO" %>

<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
	<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
	
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		Object obj = request.getAttribute("listAll");
		List<ReviewVO> list = (List)obj;
		
		int nCnt = list.size();
		System.out.println("nCnt >>> : " + nCnt);
	%>
	<!-- /헤드 -->

    <body class="nav-fixed">
	<%-- <% request.setCharacterEncoding("UTF-8"); %>
	<%
	
		Object obj = request.getAttribute("listAll");
		List<ReviewVO> list = (List)obj;
		
		int nCnt = list.size();
		System.out.println("nCnt >>> : " + nCnt);
	
	%> --%>
	
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
                                            <div class="page-header-icon"><i data-feather="filter"></i></div>
                                            		후기 게시판
                                        </h1>
                                        <div class="page-header-subtitle">소중한 반려동물을 위해 후기를 작성해보세요</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">돌봄의 후기들</div>
                            <div class="card-body">
                            	<form>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>후기번호</th>
                                            <th>돌봄신청번호</th>
                                            <th>조건제시번호</th>
                                            <th>평점</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <%
                                    	for(int i=0; i<nCnt; i++){
                                    		ReviewVO rvo = list.get(i);
                                    	
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%= rvo.getCrnum() %></td>
                                            <td><%= rvo.getCnum() %></td>
                                            <td><%= rvo.getNnum() %></td>
                                            <td><%= rvo.getCrscore() %></td>
                                            <td><%= rvo.getInsertdate() %></td>
                                            <td><div class="badge bg-primary text-white rounded-pill">Full-time</div></td>
                                            <td>
                                                <button class="btn btn-datatable btn-icon btn-transparent-dark me-2"><i data-feather="more-vertical"></i></button>
                                                <button class="btn btn-datatable btn-icon btn-transparent-dark"><i data-feather="trash-2"></i></button>
                                            </td>
                                        </tr>
                                        <%
                                    		} // end of for
                                        %>
                                        <tr>
                                        	<td></td>
                                        </tr>
                                    </tbody>
                                </table>
                                </form>
                            </div>
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