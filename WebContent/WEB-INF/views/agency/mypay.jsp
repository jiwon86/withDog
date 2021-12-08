<%@page import="a.b.c.com.agency.vo.PayVO"%>
<%@page import="java.util.List"%>
<%@page import="a.b.c.com.member.vo.MemberVO"%>
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
			$(document).ready(function() {
				
				$("#Mypet").click(function(){
					//alert("mno >>>" + memberUpdateForm.mno.value);
					//$("#memberUpdateForm").attr({ "method":"POST","action":"petSelectAll.wd"}).submit();
					$("#memberUpdateForm").attr({ "method":"POST","action":"petSelectAll.wd"}).submit();
					//location.href="petSelectAll.wd";
				});
				
			});
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
					
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
				<%
					int pageSize = 0;
					int groupSize = 0;
					int curPage = 0;
					int totalCount = 0;
	            
	            	List<PayVO> payList = (List<PayVO>) request.getAttribute("payList");
	            	MemberVO mvo = (MemberVO) request.getAttribute("mvo");
	            	PayVO pagingPayvo = (PayVO) request.getAttribute("pagingPayvo");  				
				%>
                <main style="width:960px; margin:0 auto;">
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-xl px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="user"></i></div>
                                                                                  내 프로필
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-4">
                        <!-- Account page navigation-->
                        <nav class="nav nav-borders">
                            <a class="nav-link" href="/profile.wd">프로필정보</a>
                            <a class="nav-link" href="#" id="Mypet">동물정보</a>
                            <a class="nav-link active ms-0" href="/mypay.wd">포인트정보</a>
                            <a class="nav-link" href="myReviewList.wd">리뷰정보</a>
                        </nav>
                        <hr class="mt-0 mb-4" />
                        
                        <div class="col-lg-4 mb-4 float-end">
                            <!-- Billing card 1-->
                            <div class="card h-100 border-start-lg border-start-primary">
                                <div class="card-body">
                                    <div class="small text-muted mb-2">현재 내 포인트</div>
                                    <div class="h3"><i class="fas fa-coins text-yellow"></i> <%=mvo.getMpoint() %> P</div>
                                </div>
                            </div>
                        </div>
                            
                        <div style="clear:both"></div>
                        <div class="card mb-4">
                            <div class="card-header">결제 내역</div>
                            <div class="card-body p-0">
                                <!-- Billing history table-->
                                <div class="table-responsive table-billing-history">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-gray-200" scope="col">번호</th>
                                                <th class="border-gray-200" scope="col">날짜</th>
                                                <th class="border-gray-200" scope="col">금액</th>
                                                <th class="border-gray-200" scope="col">결제내용</th>
                                                <th class="border-gray-200" scope="col">결제방식</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <% 
                                        	
                                        	for(int i=0; i<payList.size(); i++) {
                                        		PayVO payvo = payList.get(i);
                                        		String cmno = payvo.getCmno();
                                        		String paymethod = payvo.getPaymethod();
                                        		
        	                					pageSize = Integer.parseInt(pagingPayvo.getPageSize());
        	                					groupSize = Integer.parseInt(pagingPayvo.getGroupSize());
        	                					curPage = Integer.parseInt(pagingPayvo.getCurPage());
        	                        			totalCount = Integer.parseInt(payvo.getTotalCount());
                                        %>
	                                            <tr>
	                                            	<!-- 번호 -->
	                                                <td><%=payvo.getPayno() %></td>
	                                            	<!-- 날짜 -->
	                                                <td><%=payvo.getInsertdate() %></td>
	                                            	<!-- 금액 -->
	                                                <% 
	                                                	if(cmno.equals(mvo.getMno())) { 
	                                                %>
	                                                	<td>+ <%=payvo.getPayamount() %></td>
	                                                <%
	                                                	} else {
	                                                %>
	                                                	<td>- <%=payvo.getPayamount() %></td>	                                                
	                                                <%
	                                                	}
	                                                %>
	                                            	<!-- 결제내용 -->
	                                            	<td><%=payvo.getPayname() %></td>
	                                            	
	                                            	<!-- 결제방식 -->
	                                                <% 
	                                                	if(paymethod.equals("card")) {
	                                            	%>
		                                                <td>
		                                                	<span class="badge bg-light text-dark"><%=payvo.getCardname() %></span>
		                                                </td>
		                                            <%
	                                                	} else if(paymethod.equals("point")) {
		                                            %>
		                                                <td>
		                                                	<span class="badge bg-light text-dark">카카오페이</span>
		                                                </td>		                                            
		                                            <%
	                                                	} else {
		                                            %>
		                                                <td>
		                                                	<span class="badge bg-light text-dark">이외</span>
		                                                </td>		                                            		                                            
		                                            <%
	                                                	}
		                                            %>
	                                            </tr>
										<%
                                        	}
										%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

	                    <jsp:include page="mypayPaging.jsp" flush="true">
							<jsp:param name="url" value="mypay.wd"/>
							<jsp:param name="str" value=""/>
							<jsp:param name="pageSize" value="<%=pageSize%>"/>
							<jsp:param name="groupSize" value="<%=groupSize%>"/>
							<jsp:param name="curPage" value="<%=curPage%>"/>
							<jsp:param name="totalCount" value="<%=totalCount%>"/>
						</jsp:include>
                    </div>
                    

					<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
						<div id="liveToast1" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
						  <div class="d-flex">
						    <div class="toast-body">
						            수정을 성공하셨습니다.
						    </div>
						    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
						  </div>
						</div>
						
						<div id="liveToast2" class="toast align-items-center text-white bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
						  <div class="d-flex">
						    <div class="toast-body">
						            수정을 실패하였습니다.
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