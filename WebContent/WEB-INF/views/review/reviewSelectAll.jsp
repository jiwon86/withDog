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
	
	<style>
	
	a{text-decoration:none;}
	
	.brs{border-bottom:1px solid #d3d3d3;color:#69707a;}
	.brs>a{color:#69707a;}
	.brsr{border-right:1px solid #d3d3d3;}
	
	.trcon:hover{background:#d3d3d3;}
	
	</style>
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
				<form action="reviewSelect.wd" method="GET" name="RevieList" id="RevieList">
                    <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title"><div class="page-header-icon"><i data-feather="filter"></i></div>후기 게시판</h1>
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
                            	
                                <table id="datatablesSimple"style="width:100%;text-align:center;border:1px solid #d3d3d3;border-radius: 100px;">
                                <input type="hidden" id="crnum" name="crnum"/>
                                    <thead>
                                        <tr style="background:#194ae8;">
                                            <th  style="color:#fff;">글번호</th>
                                            <th  style="color:#fff;">제목</th>
                                            <th  style="color:#fff;">작성자</th>
                                            <th  style="color:#fff;">작성일</th>
                                        </tr>
                                    </thead>
                                    <%
                                    	for(int i=0; i<nCnt; i++){
                                    		ReviewVO rvo = list.get(i);
                                    %>
                                    <tbody>
                                    	
                                        <tr class="trcon">
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getCrnum() %></a></td>
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getCrsubject() %></a></td>
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getCrwriter() %></a></td>
                                            <td class="brs"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getInsertdate() %></a></td>
                                        </tr>
                                    
                                   <%
                                    		} // end of for
                                   %>
                                   </tbody>
                                </table>
                               
                                		
                            </div>
                        </div>
                        <div>
                        	<a href="reviewInsertForm.wd"><button class="btn btn-primary me-2 my-1" type="button" id="I" style="float:right;">글쓰기</button></a>
                        </div>
                    </div>
                    </form>
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