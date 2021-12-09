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
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- /헤드 -->

    <body class="nav-fixed">

		<!-- 헤더 -->
		<jsp:include page="/header.wd" />
		<script type="text/javascript">
			$(document).ready(function() {
				
				$("#zonecode").click(function() {
					new daum.Postcode({
						oncomplete: function(data) {
							$("#czonecode").val(data.zonecode);
							$("#croadaddress").val(data.roadAddress);
							$("#cjibunaddress").val(data.jibunAddress);		
							$("#croadaddressdetail").val("");
						}
					}).open();
				});
			});
		</script>
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
					// 신청 리스트
					List<OfferVO> offerList = (List<OfferVO>) request.getAttribute("offerList");
					OfferVO ovo = offerList.get(0);
					
					// 반려동물 리스트
					List<PetVO> petList = (List<PetVO>) request.getAttribute("petList");		
					int petListSize = petList.size();
					
					MemberVO mvo = (MemberVO) request.getAttribute("mvo");
					
					String mroadaddress = mvo.getMroadaddress();
					String[] mroadaddressArr = mroadaddress.split("@");
				%>
                <main style="width:960px; margin:0 auto;">
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-4">
                        <!-- Invoice-->
                        <div class="card invoice">
		                    <header class="page-header page-header-light bg-light mb-0">
		                        <div class="container-xl px-4">
		                            <div class="page-header-content pt-4">
		                                <div class="row align-items-center justify-content-between">
		                                    <div class="col-auto mt-4">
		                                        <h1 class="page-header-title">
		                                            <div class="page-header-icon"><i class="fas fa-pencil-alt"></i></div>
		                                                                                                반려동물 대리돌보미 신청
		                                        </h1>
		                                        <div class="page-header-subtitle" style="font-size:15px;">대리돌봄 서비스 신청정보를 확인하시고, 반려동물 대리돌보미 신청내용을 작성해주세요.</div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </header>
                            <div class="card-body p-4 p-md-5">
                            
	                      		<div class="row">
		                       
		                            <div class="col-lg-12 mb-4">
		                                <div class="card card-collapsable">
										    <a class="card-header" href="#collapseCardExample1" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
										    	<span style="font-size:18px; color:black;"><%= ovo.getMname() %> (<%= ovo.getMid() %>) 님의 대리돌봄 서비스 내용</span>
										        <div class="card-collapsable-arrow">
										            <i class="fas fa-chevron-down"></i>
										        </div>
										    </a>
										    <div class="collapse show" id="collapseCardExample1">
										        <div class="card-body">
										            <span><i class="fas fa-map-marked-alt"></i> &nbsp; <%= ovo.getTlat() %>, <%= ovo.getTlng() %></span> <br>
										            <span><i class="far fa-clock"></i> &nbsp; <%= ovo.getStartdate() %> ~ <%= ovo.getEnddate() %></span> <br>
										            <span><i class="fas fa-coins"></i> &nbsp; <%= ovo.getTprice() %> 원</span> <br>
													<span><i class="far fa-edit"></i> &nbsp; <%= ovo.getTcontent() %></span> <br><br>
													 
													 <div style="background:#ededed; padding:10px;">
										 	 		<span>맡길 반려동물 정보</span> <br>
											 	 	<span class="badge badge-xs mt-2 mb-2" style="background:blue;">반려동물 <span class="ms-1 badge bg-white text-dark"><%=petListSize%></span></span>
													 <% 
														for(int i=0; i<petListSize; i++) {
															PetVO pvo = petList.get(i);
															
															String pneutral = pvo.getPneutral();
															String pneutraltext = "";
															String pgender = pvo.getPgender();
															String pgendertext = "";
															String ptype = pvo.getPtype();
															String ptypetext = "";
															
															if(pneutral.equals("Y")) {
																pneutraltext = "중성화 O";
															} else {
																pneutraltext = "중성화 X";
															}
															
															if(pgender.equals("01")) {
																pgendertext = "수컷";
															} else {
																pgendertext = "암컷";
															}
															
															if(ptype.equals("01")) {
																ptypetext = "쉽독";
															} else if(ptype.equals("02")) {
																ptypetext = "캐틀 독";
															} else if(ptype.equals("03")) {
																ptypetext = "테리어";
															} else if(ptype.equals("04")) {
																ptypetext = "닥스훈트";
															} else if(ptype.equals("05")) {
																ptypetext = "스피츠";
															} else if(ptype.equals("06")) {
																ptypetext = "센트하운드";
															} else if(ptype.equals("07")) {
																ptypetext = "포인팅독";
															} else if(ptype.equals("08")) {
																ptypetext = "리트리버";
															} else if(ptype.equals("09")) {
																ptypetext = "토이독";
															} else if(ptype.equals("10")) {
																ptypetext = "사이트 하운드";					
															}															
													  %>
														   <div class="col-lg-4 mb-3">
															   <div class="d-flex align-items-center">
																   <div class="avatar avatar-lg"><img class="avatar-img img-fluid" src="/img/pet/<%=pvo.getPphoto()%>"></div>
																   <div class="ms-3">
																	   <div class="fs-4 text-dark fw-500"><%=pvo.getPname()%>&nbsp;<span style="font-size:12px;">(<%=ptypetext%>)</span></div>
																	   <div class="small text-muted"><%=pvo.getPweight()%>KG/<%=pvo.getPages()%>살/<%=pneutraltext%>/<%=pgendertext%></div>
																   </div>
															   </div>
														   </div>
													  <%
														}
													  %>
													  </div>

										        </div>
										    </div>
										</div>
		                            </div>
		                            
		                            <div class="ms-2" style="margin-top:50px;">
		                            	<h2>반려동물 대리돌보미 신청 내용 작성</h2>
		                            	<hr>
		                            	<form id="conditionInsertForm" name="conditionInsertForm" action="/conditionInsert.wd" method="post">
		                            		<input type="hidden" id="tno" name="tno" value="<%=ovo.getTno()%>">
		                            	
			                            	<div class="mb-5">
			                            		<label for="cprice">요구 금액</label> <br>
			                            		<input class="form-control" id="cprice" name="cprice" type="text" placeholder="요구 금액 입력" 
			                            			   value="<%=ovo.getTprice()%>" style="max-width:300px; display:inline-block;" required>&nbsp; 원
			                            	</div>
			                            	
			                            	<div class="mb-5">
			                            		<label for="ccontent">요구 사항</label>
			                            		<textarea class="form-control" id="ccontent" name="ccontent" rows="3" style="max-width:500px;" placeholder="예) 집이 넓어서 강아지가 편하게 지낼 수 있습니다."></textarea>
			                            	</div>
			                            	
                                            <!-- 우편번호, 우편번호 찾기 버튼 -->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (organization name)-->
                                                <div class="col-md-6">
                                                    <label class="mb-1" for="czonecode">우편번호</label>
                                                    <input class="form-control" id="czonecode" type="text" name="czonecode" 
                                                    	   placeholder="우편번호 입력" value="<%=mvo.getMzonecode()%>" required/>
                                                </div>
                                            </div>
                                            
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                 <label class="mb-1" for="zonecode"></label>
                                                    <button id="zonecode" class="btn btn-success btn-sm lift" type="button">우편번호 찾기</button>
                                                </div>
                                            </div>
                                            
                                            <!-- 도로명 주소, 도로명 상세주소 -->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (organization name)-->
                                                <div class="col-md-6">
                                                    <label class="mb-1" for="croadaddress">도로명 주소</label>
                                                    <input class="form-control" id="croadaddress" name="croadaddress" type="text" placeholder="도로명 주소 입력" value="<%=mroadaddressArr[0]%>" required />
                                                </div>
                                                <!-- Form Group (location)-->
                                                <div class="col-md-6">
                                                    <label class="mb-1" for="croadaddressdetail">도로명 상세주소</label>
                                                    <input class="form-control" id="croadaddressdetail" name="croadaddressdetail" type="text" placeholder="도로명 상세주소 입력" value="<%=mroadaddressArr[1]%>" required />
                                                </div>
                                            </div>
                                            
                                            <!-- 지번 주소-->
                                            <div class="mb-5">
                                                <label class="mb-1" for="cjibunaddress">지번주소</label>
                                                <input class="form-control" id="cjibunaddress" name="cjibunaddress" type="text" placeholder="지번주소 입력" value="<%=mvo.getMjibunaddress()%>" required />
                                            </div>			
                                            
                                            <hr>                            	
                                            
			                            	<div class="mt-4">
			                            		<input class="btn btn-primary lift" type="submit" value="신청 완료">
			                            	</div>
			                            	
			                            	
		                            	</form>
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