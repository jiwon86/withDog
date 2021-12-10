<%@page import="a.b.c.com.pet.vo.PetVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="a.b.c.com.agency.vo.OfferVO"%>
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
	<style>
	.headerdog  {
		position : absolute;
		width : 20%;
		height : 200px;
		left : 60%
	}
	</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
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
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					TEST
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
                <main style="width:960px; margin:0 auto;">
                    <header class="page-header page-header-light bg-withcolor pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                            	<img src="/image/header_dog_3.png" class="headerdog">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="activity"></i></div>
                                                                                                대리돌봄서비스
                                        </h1>
                                        <div class="page-header-subtitle">간편하고 편리한 대리돌봄서비스를 이용해보세요.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                    	<!-- 탭메뉴 -->
                        <div class="row mb-4">
                            <div class="col-xl-6 mb-4">
                                <!-- Dashboard example card 1-->
                                <a class="card lift h-100" href="/offerSelectAllPaging.wd">
                                    <div class="card-body d-flex justify-content-center flex-column">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="me-3">
                                                <i class="feather-xl text-primary mb-3" data-feather="package"></i>
                                                <h5 class="hahmlet">반려동물 대리돌봄 서비스 신청</h5>
                                                <div class="text-muted small">가까운 이웃들에게 반려동물을 맡겨보세요!</div>
                                            </div>
                                            <img src="/template/assets/img/illustrations/browser-stats.svg" alt="..." style="width: 8rem" />
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-xl-6 mb-4">
                                <!-- Dashboard example card 2-->
                                <a class="card lift h-100" href="/myConditionSelectAllPaging.wd">
                                    <div class="card-body d-flex justify-content-center flex-column">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="me-3">
                                                <i class="feather-xl text-secondary mb-3" data-feather="book"></i>
                                                <h5 class="hahmlet">반려동물 대리돌보미 신청</h5>
                                                <div class="text-muted small">가까운 이웃들에게 반려동물을 맡아주세요!</div>
                                            </div>
                                            <img src="/template/assets/img/illustrations/processing.svg" alt="..." style="width: 8rem" />
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- /탭메뉴 -->
                        
                        <!-- 돌봄신청 리스트 -->
                        <h4 class="mb-0 mt-5" style="color:gray; font-size:20px;">나의 반려동물 대리돌봄 서비스 신청정보</h4>
                        <hr class="mt-2 mb-4" />

						<%
							
							//페이징 변수 세팅
							int pageSize = 0;
							int groupSize = 0;
							int curPage = 0;
							int totalCount = 0;	
							
							// 오늘 날짜 구하기
							Date today = new Date();
							SimpleDateFormat todayFormat = new SimpleDateFormat("yyyy-MM-dd H:m");
							String todayString = todayFormat.format(today);
							Date todayDate = todayFormat.parse(todayString);
							
							// 멤버 신청리스트 구하기
							List<OfferVO> offerListAll = (List<OfferVO>) request.getAttribute("offerListAll");
							
							if(offerListAll.size() > 0) {
							
							Object objPaging = request.getAttribute("pagingOfferVO");
							OfferVO pagingOfferVO = (OfferVO)objPaging;
							
							
							for(int i=0; i<offerListAll.size(); i++) {
								OfferVO ovo = offerListAll.get(i);
								Date startDate = todayFormat.parse(ovo.getStartdate());
								Date endDate = todayFormat.parse(ovo.getEnddate());
								
								Map<String, Object> petMap = (Map<String, Object>) request.getAttribute("petMap");
								List<PetVO> pvo = (List<PetVO>) petMap.get(ovo.getTno());
								
								pageSize = Integer.parseInt(pagingOfferVO.getPageSize());
								groupSize = Integer.parseInt(pagingOfferVO.getGroupSize());
								curPage = Integer.parseInt(pagingOfferVO.getCurPage());
								totalCount = Integer.parseInt(ovo.getTotalCount());
								
								// a.after(b)
								// after 1이 2보다 나중이면 true
								// before 1이 2보다 먼저이면 true
						%>

								<% if(todayDate.before(startDate)) { %>
									<!-- 준비중 -->
			                        <a class="card card-icon lift lift-sm mb-4" href="/offerSelect.wd?tno=<%=ovo.getTno()%>">
			                            <div class="row g-0">
			                                <div class="col-auto card-icon-aside bg-cyan"><i class="text-white-50" data-feather="wifi"></i></div>
			                                <div class="col">
			                                    <div class="card-body py-4">
			                                        <span class="card-title hahmlet" style="font-size:20px; color:#7f7f7f; font-weight:bold;">
			                                        	<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)"><%=ovo.getMid()%> 대리돌봄 서비스 신청</span> <span style="color:gray; font-size:12px;">(<%= ovo.getTno() %>)</span>
			                                        </span>
			                                        <span class="me-3">
			                                           	<i class="fas fa-circle fa-sm ms-3 text-cyan"></i>
			                                       		<span class="hahmlet" style="font-size:13px; color:#4cc1c1; font-weight:bold;">준비중</span>
			                                        </span>
			                                        <hr>
			                                        
			                                        <p class="card-text mt-3 mb-1 hahmlet">
			                                        	<i class="fas fa-user"></i> &nbsp;
			                                        	<span><%= ovo.getMname() %> (<%= ovo.getMid() %>)</span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="far fa-compass"></i> &nbsp;
			                                        	<span><%= ovo.getTaddress() %></span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="far fa-clock"></i> &nbsp; 
			                                        	<span><%=ovo.getStartdate()%> ~ <%=ovo.getEnddate()%></span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="fas fa-coins"></i> &nbsp; 
			                                        	<span><%=ovo.getTprice()%> 원</span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="fas fa-paw"></i> &nbsp; 
			                                        	<span><%=pvo.size()%> 마리</span>
			                                        </p>
			                                        <div class="small text-muted mt-3">
			                                        	<i class="fas fa-exclamation-circle"></i>&nbsp; 
			                                        	<span><%=ovo.getConditionCount()%>개의 조건제시가 존재</span>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </a>
								<% } %>
								
								<% if(todayDate.after(startDate) && todayDate.before(endDate)) { %>
									<!-- 진행중 -->
			                        <a class="card card-icon lift lift-sm mb-4" href="/offerSelect.wd?tno=<%=ovo.getTno()%>">
			                            <div class="row g-0">
			                                <div class="col-auto card-icon-aside bg-teal"><i class="text-white-50" data-feather="activity"></i></div>
			                                <div class="col">
			                                    <div class="card-body py-4">
			                                        <span class="card-title mb-2 hahmlet" style="font-size:20px; color:#7f7f7f; font-weight:bold;">
			                                        	<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)"><%= ovo.getMid() %> 대리돌봄 서비스 신청</span>	 <span style="color:gray; font-size:12px;">(<%= ovo.getTno() %>)</span>
			                                        </span>
			                                        <span class="me-3">
			                                           	<i class="fas fa-circle fa-sm ms-3 text-teal"></i>
			                                       		<span class="hahmlet" style="font-size:13px; color:#13a4a4; font-weight:bold;">진행중</span>
			                                        </span>
			                                        <hr>
			                                        
			                                        <p class="card-text mt-3 mb-1 hahmlet">
			                                        	<i class="fas fa-user"></i> &nbsp;
			                                        	<span><%= ovo.getMname() %> (<%= ovo.getMid() %>)</span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="text-black-50 mt-1" data-feather="map-pin"></i> &nbsp;
			                                        	<span><%= ovo.getTaddress() %></span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="text-black-50 mt-1" data-feather="clock"></i> &nbsp; 
			                                        	<span><%=ovo.getStartdate()%> ~ <%=ovo.getEnddate()%></span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="fas fa-coins"></i> &nbsp; 
			                                        	<span><%=ovo.getTprice()%> 원</span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="fas fa-paw"></i> &nbsp; 
			                                        	<span><%=pvo.size()%> 마리</span>
			                                        </p>
			                                        <div class="small text-muted mt-3">
			                                        	<i class="fas fa-exclamation-circle"></i>&nbsp; 
			                                        	<span><%=ovo.getConditionCount()%>개의 조건제시가 존재</span>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </a>
								<% } %>
								
								<% if(todayDate.after(endDate)) { %>
									<!-- 종료 -->
			                        <a class="card card-icon lift lift-sm mb-4" href="/offerSelect.wd?tno=<%=ovo.getTno()%>">
			                            <div class="row g-0">
			                                <div class="col-auto card-icon-aside bg-red"><i class="text-white-50" data-feather="wifi-off"></i></div>
			                                <div class="col">
			                                    <div class="card-body py-4">
			                                        <span class="card-title mb-2 hahmlet" style="font-size:20px; font-weight:bold;">
			                                        	<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)"><%= ovo.getMid() %> 대리돌봄 서비스 신청</span>	 <span style="color:gray; color:#7f7f7f; font-size:12px;">(<%= ovo.getTno() %>)</span>
			                                        </span>
			                                        <span class="me-3">
			                                           	<i class="fas fa-circle fa-sm ms-3 text-red"></i>
			                                       		<span class="hahmlet" style="font-size:13px; color:red; font-weight:bold;">종&nbsp;료</span>
			                                        </span>
			                                        <hr>
			                                        
			                                        <p class="card-text mt-3 mb-1 hahmlet">
			                                        	<i class="fas fa-user"></i> &nbsp;
			                                        	<span><%= ovo.getMname() %> (<%= ovo.getMid() %>)</span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="text-black-50 mt-1" data-feather="map-pin"></i> &nbsp;
			                                        	<span><%= ovo.getTaddress() %></span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="text-black-50 mt-1" data-feather="clock"></i> &nbsp; 
			                                        	<span><%=ovo.getStartdate()%> ~ <%=ovo.getEnddate()%></span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="fas fa-coins"></i> &nbsp; 
			                                        	<span><%=ovo.getTprice()%> 원</span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="fas fa-paw"></i> &nbsp; 
			                                        	<span><%=pvo.size()%> 마리</span>
			                                        </p>
			                                        <div class="small text-muted mt-3">
			                                        	<i class="fas fa-exclamation-circle"></i>&nbsp; 
			                                        	<span><%=ovo.getConditionCount()%>개의 조건제시가 존재</span>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </a>
								<% } %>

                        <% 
                        	}
							} else {
						%>
								<h2>현재 돌봄신청이 존재하지 않습니다.</h2>
						<%
							}
						%>
                        
                        
                        <% 
                        	if(offerListAll.size() > 0) {
                        %>
                        
                        <!-- /돌봄신청 리스트 -->
	                    <jsp:include page="offerPaging.jsp" flush="true">
							<jsp:param name="url" value="offerSelectAllPaging.wd"/>
							<jsp:param name="str" value=""/>
							<jsp:param name="pageSize" value="<%=pageSize%>"/>
							<jsp:param name="groupSize" value="<%=groupSize%>"/>
							<jsp:param name="curPage" value="<%=curPage%>"/>
							<jsp:param name="totalCount" value="<%=totalCount%>"/>
						</jsp:include>
                        <%
                        	}
                        %>
                        
					</div>
                </main>				
				<!-- ** /주요 내용 ** -->
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>