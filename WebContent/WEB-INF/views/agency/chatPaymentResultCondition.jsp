<%@page import="a.b.c.com.agency.vo.PayVO"%>
<%@page import="a.b.c.com.member.vo.MemberVO"%>
<%@page import="a.b.c.com.agency.vo.ConditionVO"%>
<%@page import="a.b.c.com.pet.vo.PetVO"%>
<%@page import="a.b.c.com.agency.vo.OfferVO"%>
<%@page import="java.util.List"%>
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
	<script type="text/javascript">
		function conditionLocationBtn(cno) {
			location.href=`/myConditionSelect.wd?cno=${"${cno}"}`;
		}
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

				<!-- ** 주요 내용 **  -->
				<%
					// 신청 리스트
					List<OfferVO> offerList = (List<OfferVO>) request.getAttribute("offerList");
					OfferVO ovo = offerList.get(0);
					
					// 반려동물 리스트
					List<PetVO> petList = (List<PetVO>) request.getAttribute("petList");		
					int petListSize = petList.size();
					
					List<ConditionVO> conditionList = (List<ConditionVO>) request.getAttribute("conditionList");
					ConditionVO cvo = conditionList.get(0);
					
					List<PayVO> payList = (List<PayVO>) request.getAttribute("payList");
					PayVO payvo = payList.get(0);
					
					MemberVO mvo = (MemberVO) request.getAttribute("mvo");
				%>
                <main style="width:960px; margin:0 auto;">
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-4">
                        <!-- Invoice-->
                        <div class="card invoice">
                            <div class="card-header p-4 p-md-5 border-bottom-0 bg-gradient-primary-to-secondary text-white-50">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-12 col-lg-auto mb-5 mb-lg-0 text-center text-lg-start">
                                        <!-- Invoice branding-->
                                        <img class="invoice-brand-img rounded-circle mb-4" src="assets/img/demo/demo-logo.svg" alt="" />
                                        <div class="h2 text-white mb-0">Start Bootstrap</div>
                                        Web Design &amp; Development
                                    </div>
                                    <div class="col-12 col-lg-auto text-center text-lg-end">
                                        <!-- Invoice details-->
                                        <div class="h3 text-white">Invoice</div>
                                        #29301
                                        <br />
                                        January 1, 2021
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-4 p-md-5">
                            
                            	<!-- 결제 결과 화면 -->
		                        <div class="tab-pane py-5 py-xl-10 " id="wizard4" role="tabpanel" aria-labelledby="wizard4-tab">
		                            <div class="row justify-content-center">
		                                <div class="col-xxl-8 col-xl-8 col-8 p-5 bg-img-repeat bg-light" 
		                                	 style="background-image: url('/template/assets/img/backgrounds/bg-pattern-shapes.png'); border:4px dashed #657d89;">
		                                    <h3 class="text-primary text-center">
		                                    	<i class="fas fa-check-circle" style="color:#0091EA; font-size:3em;"></i>
		                                    </h3>
		                                    <h3 class="text-primary text-center hahmlet" style="font-weight:bold;">돌봄 서비스 내용</h3>
		                                    <h5 class="card-title mt-3 mb-4 text-center">돌봄 서비스를 이용해 주셔서 감사합니다.</h5>
		                                    
		                                    <div class="mt-5 mb-3" style="border-top: 2px dashed #c4c4c4;width:100%;height:3px;"></div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>신청자 : </em></div>
		                                        <div class="col"><%= ovo.getMname() %> (<%=ovo.getMid() %>)</div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>조건제시자 : </em></div>
		                                        <div class="col"><%= cvo.getMname() %> (<%=cvo.getMid() %>)</div>
		                                    </div>
		                                    <div class="mt-3 mb-3" style="border-top: 2px dashed #c4c4c4;width:100%;height:3px;"></div>
		                                    
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>결제금액 : </em></div>
		                                        <div class="col"><%= payvo.getPayamount() %> 원</div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>돌봄 위치 : </em></div>
		                                        <div class="col"><%= cvo.getCaddress() %></div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>돌봄 날짜 : </em></div>
		                                        <div class="col"><%= ovo.getStartdate() %> ~ <%= ovo.getEnddate() %></div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>신청자 요청사항 :</em></div>
		                                        <div class="col"><%= ovo.getTcontent() %></div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>조건제시자 요청사항 : </em></div>
		                                        <div class="col"><%= cvo.getCcontent() %></div>
		                                    </div>
		                                    <div class="mt-3 mb-3" style="border-top: 2px dashed #c4c4c4;width:100%;height:3px;"></div>
		                                    
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>결제 번호 : </em></div>
		                                        <div class="col"><%= payvo.getPayno()%></div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>결제 이름 : </em></div>
		                                        <div class="col"><%= payvo.getPayname() %></div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>카드 이름 : </em></div>
		                                        <div class="col"><%= payvo.getCardname() %></div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>카드 번호 : </em></div>
		                                        <div class="col"><%= payvo.getCardnumber() %></div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>결제 방법 : </em></div>
		                                        <div class="col"><%= payvo.getPaymethod() %></div>
		                                    </div>
		                                    <div class="row small">
		                                        <div class="col-sm-4 text-truncate"><em>결제 일시 : </em></div>
		                                        <div class="col"><%= payvo.getInsertdate() %></div>
		                                    </div>
		                                    <div class="mt-3 mb-4" style="border-top: 2px dashed #c4c4c4;width:100%;height:3px;"></div>
	
											 <div class="mt-3" style="background:#ededed; padding:10px;">
											 	 <span>돌봄 반려동물 정보</span> <br>
											 	 <span class="badge badge-xs mt-2 mb-2" style="background:blue;">반려동물 <span class="ms-1 badge bg-white text-dark"><%=petListSize%></span></span>
												 <% 
													for(int i=0; i<petListSize; i++) {
														PetVO pvo = petList.get(i);
												  %>
													   <div class="d-flex align-items-center">
														   <div class="avatar avatar-sm"><img class="avatar-img img-fluid" src="/template/assets/img/illustrations/profiles/profile-1.png"></div>
														   <div class="ms-3">
															   <div class="text-dark fw-500"><%=pvo.getPname()%>&nbsp;<span style="font-size:10px;">(<%=pvo.getPtype()%>)</span></div>
															   <div class="small text-muted">중형견(<%=pvo.getPweight()%>)/<%=pvo.getPages()%>살/중성화 x(<%=pvo.getPneutral()%>)</div>
														   </div>
													   </div>
												  <%
													}
												  %>
											  </div>

		                                    <hr class="my-4" />
		                                    <div class="d-flex justify-content-between">
		                                        <button class="btn btn-primary btn-lg" style="margin:0 auto;" type="button" onclick="conditionLocationBtn('<%=cvo.getCno()%>')">확인</button>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>                                
                                
                            </div>

                            <div class="card-footer p-4 p-lg-5 border-top-0">
                                <div class="row">
                                    <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
                                        <!-- Invoice - sent to info-->
                                        <div class="small text-muted text-uppercase fw-700 mb-2">To</div>
                                        <div class="h6 mb-1">Company Name</div>
                                        <div class="small">1234 Company Dr.</div>
                                        <div class="small">Yorktown, MA 39201</div>
                                    </div>
                                    <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
                                        <!-- Invoice - sent from info-->
                                        <div class="small text-muted text-uppercase fw-700 mb-2">From</div>
                                        <div class="h6 mb-0">Start Bootstrap</div>
                                        <div class="small">5678 Company Rd.</div>
                                        <div class="small">Yorktown, MA 39201</div>
                                    </div>
                                    <div class="col-lg-6">
                                        <!-- Invoice - additional notes-->
                                        <div class="small text-muted text-uppercase fw-700 mb-2">Note</div>
                                        <div class="small mb-0">Payment is due 15 days after receipt of this invoice. Please make checks or money orders out to Company Name, and include the invoice number in the memo. We appreciate your business, and hope to be working with you again very soon!</div>
                                    </div>
                                </div>
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