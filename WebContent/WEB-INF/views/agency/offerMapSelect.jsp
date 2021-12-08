<%@page import="a.b.c.com.agency.vo.AgencyVO"%>
<%@page import="a.b.c.com.agency.vo.ConditionVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<head>
		<script type="text/javascript">

			function chatPaymentResultBtnClick(cno, tno) {
				console.log("cno >>> : " + cno);
				console.log("tno >>> : " + tno);
				
				location.href=`/chatPaymentResult2.wd?cno=${"${cno}"}&tno=${"${tno}"}`;
			}
			
			function conditionInsertForm(tno, mno) {
				console.log("tno >>> : " + tno);
				console.log("mno >>> : " + mno);
				
				location.href=`/conditionInsertForm.wd?tno=${"${tno}"}&mno=${"${mno}"}`;
			}
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
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					TEST
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
				<% 
					/*
					int pageSize = 0;
					int groupSize = 0;
					int curPage = 0;
					int totalCount = 0;
					*/
					
					// 신청 리스트
					List<OfferVO> offerList = (List<OfferVO>) request.getAttribute("offerList");
					OfferVO ovo = offerList.get(0);
					
					// 반려동물 리스트
					List<PetVO> petList = (List<PetVO>) request.getAttribute("petList");
					int petListSize = petList.size();
					
					// 조건제시 페이징
					ConditionVO pagingConditionVO = (ConditionVO) request.getAttribute("pagingConditionVO");
					
            		List<ConditionVO> conditionList = (List<ConditionVO>) request.getAttribute("conditionList");
        			int conditionCnt = conditionList.size();
        			
        			List<Integer> agencyListAnoCount = (List<Integer>) request.getAttribute("agencyListAnoCount"); 
        			// agencySelectCount가 0이면 "N"이 들어가 있음
        			List<String> agencyListMatchyn = (List<String>) request.getAttribute("agencyListMatchyn");
        			List<Integer> payListCount = (List<Integer>) request.getAttribute("payListCount");
					
					// 오늘 날짜 구하기
					Date today = new Date();
					SimpleDateFormat todayFormat = new SimpleDateFormat("yyyy-MM-dd H:m");
					
					String todayString = todayFormat.format(today);
					Date todayDate = todayFormat.parse(todayString);
					
					Date startDate = todayFormat.parse(ovo.getStartdate());
					Date endDate = todayFormat.parse(ovo.getEnddate());
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

						<!-- 신청정보 카드 -->
                        <div class="card mb-4 mt-4">
                            <div class="card-header d-flex align-items-center">
                                <a class="btn btn-transparent-dark btn-icon" onclick="javascript:history.back();"><i data-feather="arrow-left"></i></a>
                                <div class="ms-3">
                                	<div class="my-3">
                                		<% if(todayDate.before(startDate)) { %>
	                                		<!-- 준비중 -->
	                                        <span style="font-size:25px; font-weight:bold; color:#7f7f7f;">
	                                        	<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)">
	                                        		<%=ovo.getMid()%> 돌봄신청
	                                        	</span> &nbsp;
	                                        	<span style="color:gray; font-size:14px;">(<%=ovo.getTno()%>)</span>
	                                        </span> &nbsp;	                                		
	                                	    <span class="me-3">
	                                           	<i class="fas fa-circle fa-sm ms-3 text-cyan"></i>
	                                       		<span class="hahmlet" style="font-size:13px; color:#4cc1c1; font-weight:bold;">준비중</span>
	                                        </span>
                                        <% } %>
                                        
                                        <% if(todayDate.after(startDate) && todayDate.before(endDate)) { %>	
	                                        <!-- 진행중 -->
	                                        <span style="font-size:25px; font-weight:bold; color:#7f7f7f;">
	                                        	<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)">
	                                        		<%=ovo.getMid()%> 돌봄신청
	                                        	</span> &nbsp;
	                                        	<span style="color:gray; font-size:14px;">(<%=ovo.getTno()%>)</span>
	                                        </span> &nbsp;	                                        
	                                        <span class="me-3">
	                                           	<i class="fas fa-circle fa-sm ms-3 text-teal"></i>
	                                       		<span class="hahmlet" style="font-size:13px; color:#13a4a4; font-weight:bold;">진행중</span>
	                                        </span>
                                        <% } %>
                                        
                                        <% if(todayDate.after(endDate)) { %>
	                                        <!-- 종료 -->
	                                        <span style="font-size:25px; font-weight:bold; color:#7f7f7f;">
	                                        	<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)">
	                                        		<%=ovo.getMid()%> 돌봄신청
	                                        	</span> &nbsp;
	                                        	<span style="color:gray; font-size:14px;">(<%=ovo.getTno()%>)</span>
	                                        </span> &nbsp;
	                                        <span class="me-3">
	                                           	<i class="fas fa-circle fa-sm ms-3 text-red"></i>
	                                       		<span class="hahmlet" style="font-size:13px; color:red; font-weight:bold;">종료</span>
	                                        </span>
                                        <% } %>                                        
                                        
                                	</div>	
                                </div>
                            </div>
                            
                            <div class="card-body">
                            	<br>
                            	<div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-map-marked-alt"></i> &nbsp; 
	                                	<span>사용자</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-2"><%= ovo.getMname() %> (<%= ovo.getMid() %>)</p>
                                </div>
                                <br>
                            	<div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-map-marked-alt"></i> &nbsp; 
	                                	<span>지역</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-2"><%=ovo.getTaddress() %></p>
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
                               <br>
                               
                               <%
                               	 if(conditionList.size() > 0) {
                               %>
									<div class="alert alert-danger" role="alert">
									  <i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;조건제시는 1개이상 신청하실 수 없습니다.
									</div>
                               <%
                               	 } else {
                               %>
	                               	<div>
	                               	    <div class="btn btn-primary" onclick="conditionInsertForm('<%=ovo.getTno()%>', '<%=ovo.getMno()%>')">조건제시 작성</div>
	                               	</div>
                               <%
                               	 }
                               %>
                            </div>
                        </div>
                        <!-- /신청정보 카드 -->

						<h4 class="mb-0 mt-5">나의 조건제시 정보</h4>
                        <hr class="mt-2 mb-4" />
                        <!-- 조건제시 정보 -->
                        <div class="row">
                        	
                        	<%
                    			if(conditionList.size() > 0) {
	                        		for(int i=0; i<conditionCnt; i++) {
	                        			ConditionVO cvo = conditionList.get(i);
	                        			int anoCount = agencyListAnoCount.get(i);
	                        			String matchyn = agencyListMatchyn.get(i);
	                        			int payCount = payListCount.get(i);
	                        			
	                        			String cno = cvo.getCno();
	    								String tno = cvo.getTno();
	    								
	                        			/*
	                					pageSize = Integer.parseInt(pagingConditionVO.getPageSize());
	                					groupSize = Integer.parseInt(pagingConditionVO.getGroupSize());
	                					curPage = Integer.parseInt(pagingConditionVO.getCurPage());
	                        			totalCount = Integer.parseInt(cvo.getTotalCount());
	                        			*/
                        	%>
			                        	<!-- 조건제시 정보 -->
			                            <div class="col-lg-6 mb-4">
			                                <div class="card lift lift-sm h-100">
			                                    <div class="card-body" onclick="javascript:location.href='/conditionSelect.wd?cno=<%=cvo.getCno() %>'">
			                                        <input type="hidden" class="cno" value="<%=cvo.getCno() %>" />
			                                        <input type="hidden" class="tno" value="<%=ovo.getTno() %>" />
			                                        <input type="hidden" class="paycount" value="<%=payCount%>" />
			                                        
			                                        <h5 class="card-title mb-2 hahmlet" style="font-weight:bold; font-size:20px; color:#7f7f7f;">
			                                            <span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)">
			                                            	<%=cvo.getMid()%> 조건제시
			                                            </span> &nbsp;
			                                            <span style="color:gray; font-size:14px;">(<%= cvo.getTno() %>)</span>
			                                        </h5>
			                                        <hr>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="fas fa-user"></i> &nbsp;
			                                        	<span class="mAccount"><%= cvo.getMname() %> (<%= cvo.getMid() %>)</span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="fas fa-coins"></i> &nbsp; 
			                                        	<span><%=cvo.getCprice() %> 원</span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet">
			                                        	<i class="text-black-50 mt-1" data-feather="map-pin"></i> &nbsp;
			                                        	<span><%=cvo.getCaddress() %></span>
			                                        </p>
			                                        <p class="card-text mb-1 hahmlet" style="white-space:nowrap; width:70%; overflow: hidden; text-overflow: ellipsis;">
			                                        	<i class="far fa-edit"></i> &nbsp; 
			                                        	<span><%=cvo.getCcontent() %></span>
			                                        </p>
			                                    </div>
			                                    <div class="card-footer controlBtn">
			                                    	<!-- 수락 및 수락해제 버튼 위치 -->
			                                    	<%
			                                    		if(anoCount > 0) {
			                                    			if(matchyn.equals("Y")) {
			                                    				if(payCount > 0) {
			                                    	%>
						                                    		<div class="btn btn-green hahmlet chatPaymentBtn" 
						                                    			 onclick="chatPaymentResultBtnClick('<%=cno%>', '<%=tno%>')">
						                                    			<i class="fas fa-check-circle"></i> &nbsp; 결제완료
						                                    		</div>	                                    					
				                                    <%		
			                                    				} else {
			                                    	%>
					                                    			<button class="btn btn-yellow" type="button" disabled>
																	  <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
																	  &nbsp;&nbsp;결제완료 대기중..
																	</button>	 
			                                    	<%
			                                    				}
				                                    		} else {
				                                    %>
				                                    			<button class="btn btn-primary" type="button" disabled>
																  <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
																  &nbsp;&nbsp;조건수락 대기중..
																</button>
				                                    <%	
				                                    		}
			                                    			
			                                    		} else {
			                                    	%>
					                                    	<button class="btn btn-primary" type="button" disabled>
															  <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
															  &nbsp;&nbsp;조건수락 대기중..
															</button>                                    	
			                                    	<%
			                                    		}
			                                    	%>
			                                    </div>
			                                </div>
			                            </div>
                            
                            <% 
                        			}
                    			} else {
                    		%>
                    				<h2>현재 조건제시가 없습니다.</h2>
                    		<%
                    			}
                            %>
                            
                        </div>
                        <!-- /조건제시 정보 -->
                        
                        <%-- 
                        <% 
                        	if(conditionList.size() > 0) { 
                        %>
			                    <jsp:include page="conditionPaging.jsp" flush="true">
									<jsp:param name="url" value="offerSelect.psh"/>
									<jsp:param name="str" value=""/>
									<jsp:param name="pageSize" value="<%=pageSize%>"/>
									<jsp:param name="groupSize" value="<%=groupSize%>"/>
									<jsp:param name="curPage" value="<%=curPage%>"/>
									<jsp:param name="totalCount" value="<%=totalCount%>"/>
								</jsp:include>
                        <%
                        	} else {
                        %>
                        	
                        <%
                        	}
                        %>
                        --%>
                    </div>
                    
                    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
						<div id="liveToast1" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
						  <div class="d-flex">
						    <div class="toast-body">
						            조건제시 수락을 성공하셨습니다.
						    </div>
						    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
						  </div>
						</div>
						
						<div id="liveToast2" class="toast align-items-center text-white bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
						  <div class="d-flex">
						    <div class="toast-body">
						            조건제시 수락을 실패하셨습니다
						    </div>
						    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
						  </div>
						</div>
						
						<div id="liveToast3" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
						  <div class="d-flex">
						    <div class="toast-body">
						            조건제시 수락해제를 성공하셨습니다.
						    </div>
						    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
						  </div>
						</div>
						
						<div id="liveToast4" class="toast align-items-center text-white bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
						  <div class="d-flex">
						    <div class="toast-body">
						            조건제시 수락해제를 실패하셨습니다
						    </div>
						    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
						  </div>
						</div>
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