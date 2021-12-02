<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="a.b.c.com.review.vo.ReviewVO" %>
<%@ page import="a.b.c.com.member.vo.Member"%>

<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
	<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
	
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		//페이징 변수 세팅
		int pageSize = 0;
		int groupSize = 0;
		int curPage = 0;
		int totalCount = 0;
		
		Object objPaging = request.getAttribute("reviewPagingBVO");
		ReviewVO reviewPagingBVO = (ReviewVO)objPaging;
	
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
                                            <th  style="color:#fff;">돌봄이</th>
                                            <th  style="color:#fff;">후기 작성자</th>
                                            <th  style="color:#fff;">작성일</th>
                                        </tr>
                                    </thead>
                                   <%
                                   
									for(int i=0; i<nCnt; i++){		
										ReviewVO rvo = list.get(i);	
										pageSize = Integer.parseInt(reviewPagingBVO.getPageSize());
										groupSize = Integer.parseInt(reviewPagingBVO.getGroupSize());
										curPage = Integer.parseInt(reviewPagingBVO.getCurPage());
										totalCount = Integer.parseInt(rvo.getTotalCount());
										
									%>		
                                    <tbody>
                                    	
                                        <tr class="trcon">
                                        	<!-- 번호 -->
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getCrnum() %></a></td>
                                            <!-- 제목 -->
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getCrsubject() %></a></td>
                                            
                                            <!-- 돌봄이 -->
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getMid() %></a></td>
                                           	
                                            <!-- 이름 -->
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getRwriter() %></a></td>
                                            <!-- 입력날짜 -->
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
                        	<input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br>
							<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일 ">
							~ <input type="text" id="enddate" name="enddate" size="12" placeholder="종료일">
                        	<a href="reviewInsertForm.wd"><button class="btn btn-primary me-2 my-1" type="button" id="I" style="float:right;">글쓰기</button></a>
                        </div>
                       <jsp:include page="reviewPaging.jsp" flush="true">
							<jsp:param name="url" value="reviewSelectPaging.wd"/>
							<jsp:param name="str" value=""/>
							<jsp:param name="pageSize" value="<%=pageSize%>"/>
							<jsp:param name="groupSize" value="<%=groupSize%>"/>
							<jsp:param name="curPage" value="<%=curPage%>"/>
							<jsp:param name="totalCount" value="<%=totalCount%>"/>
						</jsp:include>
                    </div>
                    </form>
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