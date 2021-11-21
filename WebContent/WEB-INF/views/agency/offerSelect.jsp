<%@page import="a.b.c.com.pet.vo.PetVO"%>
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
					
				</main>
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					TEST
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
				<% 
					List<OfferVO> offerList = (List<OfferVO>) request.getAttribute("offerList");
					OfferVO ovo = offerList.get(0);
					
					List<PetVO> petList = (List<PetVO>) request.getAttribute("petList");
					int petListSize = petList.size();
				%>
				
               <main style="width:960px; margin:0 auto;">
                     <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="layout"></i></div>
                                            <span>돌봄신청 상세정보</span>
                                        </h1>
                                        <div class="page-header-subtitle">The default page header layout with main content that overlaps the background of the page header</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- 상세 돌봄신청 정보 -->
                    <div class="container-xl px-4 mt-n10">

                        <div class="card mb-4 mt-4">
                            <div class="card-header d-flex align-items-center">
                                <a class="btn btn-transparent-dark btn-icon" onclick="javascript:history.back();"><i data-feather="arrow-left"></i></a>
                                <div class="ms-3">
                                	<div class="my-3">
                                		<span style="font-size:35px; font-weight:bold;"><%=ovo.getTno()%></span> &nbsp;
                                	    <span class="me-3">
                                           	<i class="fas fa-circle fa-sm ms-3 text-cyan"></i>
                                       		<span class="hahmlet" style="font-size:13px; color:#4cc1c1; font-weight:bold;">준비중</span>
                                        </span>	
                                	</div>	
                                </div>
                            </div>
                            
                            <div class="card-body">
                            	<br>
                            	<div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-map-marked-alt"></i> &nbsp; 
	                                	<span>지역</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-2"><%= ovo.getTlat() %>, <%= ovo.getTlng() %></p>
                                </div>
                                <br>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="far fa-clock"></i> &nbsp; 
	                                	<span>날짜</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-3"><%= ovo.getStartdate() %> ~ <%= ovo.getEnddate() %></p>
                                </div>
                                <br>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-coins"></i> &nbsp; 
	                                	<span>금액</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-5 ms-3"><%= ovo.getTprice() %> 원</p>
                                </div>
                                <br>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-paw"></i> &nbsp; 
	                                	<span>맡기는 동물</span>
	                                </h4>
			                        <hr>
			                        <div class="card-body bg-light">
			                           <div class="small mb-2" style="font-size:14px;"><%=petListSize%> 마리</div>
			                           <div class="row" style="padding:10px;">
			                              <% 
			                              	for(int i=0; i<petListSize; i++) {
			                              		PetVO pvo = petList.get(i);
			                              %>
			                               <div class="col-lg-4 mb-3">
			                                   <div class="d-flex align-items-center">
			                                       <div class="avatar avatar-lg"><img class="avatar-img img-fluid" src="/template/assets/img/illustrations/profiles/profile-1.png"></div>
			                                       <div class="ms-3">
			                                           <div class="fs-4 text-dark fw-500"><%=pvo.getPname()%>&nbsp;<span style="font-size:12px;">(<%=pvo.getPtype()%>)</span></div>
			                                           <div class="small text-muted">중형견(<%=pvo.getPweight()%>)/<%=pvo.getPages()%>살/중성화 x(<%=pvo.getPneutral()%>)</div>
			                                       </div>
			                                   </div>
			                               </div>
			                              <%
			                              	}
			                              %>
			                           </div>
			                       </div>
		                       </div>
		                       <br>
		                       <br>
		                       
                               <div>
	                               <h4 class="ms-1">
		                               <i class="far fa-edit"></i> &nbsp; 
		                               <span>요구사항</span>
	                               </h4>
		                           <hr>
	                               <div class="lead mb-5 ms-3" style="max-width:500px; background:#e8e8e8; padding:20px; border-radius:20px;">
	                                  <%= ovo.getTcontent() %>
	                               </div>
                               </div>		                       
                               
                            </div>
                        </div>
                        <!-- /상세 돌봄신청 정보 -->

						<h4 class="mb-0 mt-5">조건제시 정보</h4>
                        <hr class="mt-2 mb-4" />
                        <!-- 조건제시 정보 -->
                        <div class="row">
                        
                            <div class="col-lg-6 mb-4">
                                <div class="card lift lift-sm h-100">
                                    <div class="card-body" onclick="javascript:location.href='/conditionSelect.wd'">
                                        <h5 class="card-title text-primary mb-2">
                                            <i class="me-2" data-feather="edit-2"></i>
                                            D202111200001
                                        </h5>
                                        <p class="card-text mb-1 hahmlet">
                                        	<i class="fas fa-user"></i> &nbsp;&nbsp;
                                        	<span>qorhvk123</span>
                                        </p>
                                        <p class="card-text mb-1 hahmlet">
                                        	<i class="fas fa-coins"></i> &nbsp; 
                                        	<span>50,000 원</span>
                                        </p>
                                        <p class="card-text mb-1 hahmlet">
                                        	<i class="text-black-50 mt-1" data-feather="map-pin"></i> &nbsp;
                                        	<span>경기도 안양시 석수동</span>
                                        </p>
                                        <p class="card-text mb-1 hahmlet" style="white-space:nowrap; width:70%; overflow: hidden; text-overflow: ellipsis;">
                                        	<i class="far fa-edit"></i> &nbsp; 
                                        	<span>gregregergergergergregergegergregergeregegergergergdfgdfgdgdffdgdfdfgdgdfgdfgdfgf</span>
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                    	<div class="btn btn-primary hahmlet">
                                    		<i class="far fa-check-circle"></i> &nbsp; 수락
                                    	</div>
                                    	<div class="btn btn-red hahmlet">
                                    		<i class="fas fa-check-circle"></i> &nbsp; 수락해제
                                    	</div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-lg-6 mb-4">
                                <a class="card lift lift-sm h-100" href="knowledge-base-category.html">
                                    <div class="card-body">
                                        <h5 class="card-title text-yellow mb-2">
                                            <i class="me-2" data-feather="credit-card"></i>
                                            Billing Information
                                        </h5>
                                        <p class="card-text mb-1">Troubleshoot billing issues, subscriptions, and updating payment information</p>
                                    </div>
                                    <div class="card-footer"><div class="small text-muted">2 articles in this category</div></div>
                                </a>
                            </div>
                            
                            <div class="col-lg-6 mb-4">
                                <a class="card lift lift-sm h-100" href="knowledge-base-category.html">
                                    <div class="card-body">
                                        <h5 class="card-title text-teal mb-2">
                                            <i class="me-2" data-feather="code"></i>
                                            API
                                        </h5>
                                        <p class="card-text mb-1">Documentation and integration instructions for our API</p>
                                    </div>
                                    <div class="card-footer"><div class="small text-muted">15 articles in this category</div></div>
                                </a>
                            </div>
                            
                            <div class="col-lg-6 mb-4">
                                <a class="card lift lift-sm h-100" href="knowledge-base-category.html">
                                    <div class="card-body">
                                        <h5 class="card-title text-orange mb-2">
                                            <i class="me-2" data-feather="layers"></i>
                                            Integration
                                        </h5>
                                        <p class="card-text mb-1">App integration policies and related content on connecting to our database</p>
                                    </div>
                                    <div class="card-footer"><div class="small text-muted">5 articles in this category</div></div>
                                </a>
                            </div>
                            
                            <div class="col-lg-6 mb-4">
                                <a class="card lift lift-sm h-100" href="knowledge-base-category.html">
                                    <div class="card-body">
                                        <h5 class="card-title text-secondary mb-2">
                                            <i class="me-2" data-feather="lock"></i>
                                            Privacy &amp; Content
                                        </h5>
                                        <p class="card-text mb-1">Our privacy policy and information on how we track and utilize user data</p>
                                    </div>
                                    <div class="card-footer"><div class="small text-muted">2 articles in this category</div></div>
                                </a>
                            </div>
                            
                            <div class="col-lg-6 mb-4">
                                <a class="card lift lift-sm h-100" href="knowledge-base-category.html">
                                    <div class="card-body">
                                        <h5 class="card-title text-red mb-2">
                                            <i class="me-2" data-feather="map"></i>
                                            Miscellaneous
                                        </h5>
                                        <p class="card-text mb-1">Other troubleshooting, help, and support articles related to our products and services</p>
                                    </div>
                                    <div class="card-footer"><div class="small text-muted">2 articles in this category</div></div>
                                </a>
                            </div>
                            
                        </div>
                        <!-- /조건제시 정보 -->
                        <nav class="dataTable-pagination float-end">
                        	<ul class="dataTable-pagination-list">
                        		<li class="active"><a href="#" data-page="1">1</a></li>
                        		<li class=""><a href="#" data-page="2">2</a></li>
                        		<li class=""><a href="#" data-page="3">3</a></li>
                        		<li class=""><a href="#" data-page="4">4</a></li>
                        		<li class=""><a href="#" data-page="5">5</a></li>
                        		<li class=""><a href="#" data-page="6">6</a></li>
                        		<li class="pager"><a href="#" data-page="2">›</a></li>
                        	</ul>
                        </nav>
                        
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