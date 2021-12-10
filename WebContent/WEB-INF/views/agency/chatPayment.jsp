<%@page import="a.b.c.com.member.vo.MemberVO"%>
<%@page import="a.b.c.com.agency.vo.ConditionVO"%>
<%@page import="a.b.c.com.pet.vo.PetVO"%>
<%@page import="a.b.c.com.agency.vo.OfferVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					
					List<ConditionVO> conditionList = (List<ConditionVO>) request.getAttribute("conditionList");
					ConditionVO cvo = conditionList.get(0);
					
					MemberVO mvo = (MemberVO) request.getAttribute("mvo");
				%>
                <main style="width:960px; margin:0 auto;">
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-4">
                        <!-- Invoice-->
                        <div class="card invoice">
                            <div class="card-header p-4 p-md-5 border-bottom-0 bg-gradient-primary-to-secondary text-white-50">
                                <div class="row justify-content-between align-items-center">
                                	<h1 class="mt-3" style="font-weight:bold; color:white;">대리돌봄 매칭서비스 결제하기</h1>
                                </div>
                            </div>
                            <div class="card-body p-4 p-md-5">
                            
	                      		<div class="row">
		                       
		                            <div class="col-lg-6 mb-4">
		                                <div class="card card-collapsable">
										    <a class="card-header" href="#collapseCardExample1" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
										    	<span style="font-size:18px; color:black;"><%= ovo.getMname() %> (<%= ovo.getMid() %>) 님의 돌봄 신청 내용</span>
										        <div class="card-collapsable-arrow">
										            <i class="fas fa-chevron-down"></i>
										        </div>
										    </a>
										    <div class="collapse show" id="collapseCardExample1">
										        <div class="card-body">
										            <span><i class="fas fa-map-marked-alt"></i> &nbsp; <%= ovo.getTaddress() %></span> <br>
										            <span><i class="far fa-clock"></i> &nbsp; <%= ovo.getStartdate() %> ~ <%= ovo.getEnddate() %></span> <br>
										            <span><i class="fas fa-coins"></i> &nbsp; <del><fmt:formatNumber value="<%=ovo.getTprice()%>" pattern="#,###,###"/></del> 원</span> <br>
													<span><i class="far fa-edit"></i> &nbsp; <%= ovo.getTcontent() %></span> <br><br>
													 
													 <div style="background:#ededed; padding:10px;">
										 	 		<span>돌봄 반려동물 정보</span> <br>
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
														   <div class="d-flex align-items-center">
															   <div class="avatar avatar-sm"><img class="avatar-img img-fluid" src="/img/pet/<%=pvo.getPphoto()%>"></div>
															   <div class="ms-3">
																   <div class="text-dark fw-500"><%=pvo.getPname()%>&nbsp;<span style="font-size:10px;">(<%=ptypetext%>)</span></div>
																   <div class="small text-muted"><%=pvo.getPweight()%>KG/<%=pvo.getPages()%>살/<%=pneutraltext%>/<%=pgendertext%></div>
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
		                            <div class="col-lg-6 mb-4">
		                                <div class="card card-collapsable">
										    <a class="card-header" href="#collapseCardExample2" data-bs-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
										    	<span style="font-size:18px; color:black;"><%= cvo.getMname() %> (<%= cvo.getMid() %>) 님의 조건 내용</span>
										        <div class="card-collapsable-arrow">
										            <i class="fas fa-chevron-down"></i>
										        </div>
										    </a>
										    <div class="collapse show" id="collapseCardExample2">
										        <div class="card-body">
										            <span><i class="fas fa-map-marked-alt"></i> &nbsp; <%= cvo.getCaddress() %></span> <br>
										            <span><i class="fas fa-coins"></i> &nbsp; <fmt:formatNumber value="<%= cvo.getCprice() %>" pattern="#,###,###"/> 원</span> <br>
										            <span><i class="far fa-edit"></i> &nbsp; <%= cvo.getCcontent() %></span>
										        </div>
										    </div>
										</div>
		                            </div>
		                            
		                        </div>
                            
                                <div class="table-responsive mt-5">
                                    <table class="table table-borderless mb-0">
                                        <thead class="border-bottom">
                                            <tr class="small text-uppercase text-muted">
                                                <th scope="col">Description</th>
                                                <th class="text-end" scope="col">갯수</th>
                                                <th class="text-end" scope="col">반려동물</th>
                                                <th class="text-end" scope="col">금액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Invoice item 1-->
                                            <tr class="border-bottom">
                                                <td>
                                                    <div class="fw-bold">최종 내용</div>
                                                    <div class="small text-muted d-none d-md-block">
                                                    	<span><%= ovo.getStartdate() %> ~ <%= ovo.getEnddate() %></span> <br>
                                                    	<span><%= cvo.getCaddress() %></span> <br>
                                                    </div>
                                                </td>
                                                <td class="text-end fw-bold">1</td>
                                                <td class="text-end fw-bold"><%=petListSize%> 마리</td>
                                                <td class="text-end fw-bold"><fmt:formatNumber value="<%= cvo.getCprice() %>" pattern="#,###,###"/> 원</td>
                                            </tr>

                                            <tr>
                                                <td class="text-end pb-0" colspan="3"><div class="text-uppercase small fw-700 text-muted">결제 금액:</div></td>
                                                <td class="text-end pb-0"><div class="h5 mb-0 fw-700 text-green"><fmt:formatNumber value="<%= cvo.getCprice() %>" pattern="#,###,###"/> 원</div></td>
                                            </tr>
                                        </tbody>
                                    </table>
                      				
                      				<div id="payBtn" class="mt-3">
	                                    <div id="pointPayBtn" class="btn btn-warning btn-lg float-end mt-3 me-3">
	                                    	<i class="fas fa-coins"></i> &nbsp;&nbsp; 포인트 결제
	                                    </div>
	                                    <div id="check_module" class="btn btn-primary btn-lg float-end mt-3 me-3">
	                                    	<i class="fas fa-money-check-alt"></i>&nbsp; 일반 결제
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
		
		<script>
			const tnoVal = `<%=ovo.getTno()%>`;
			const cnoVal = `<%=cvo.getCno()%>`;
			const tmnoVal = `<%=ovo.getMno()%>`;
			const cmnoVal = `<%=cvo.getMno()%>`;
		
			$("#check_module").click(function () {
				var IMP = window.IMP; // 생략가능
				IMP.init('imp23448805');
				
				IMP.request_pay({
				pg: 'html5_inicis', // version 1.1.0부터 지원.
				pay_method: 'card',
				/*
				'samsung':삼성페이,'card':신용카드,'trans':실시간계좌이체,'vbank':가상계좌,'phone':휴대폰소액결제
				*/
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: '위드독 결제',
				amount: '<%= cvo.getCprice()%>',
				buyer_email: '<%= mvo.getMemail()%>',
				buyer_name: '<%= mvo.getMname()%>',
				buyer_addr: '<%= mvo.getMjibunaddress()%>',
				buyer_postcode: '<%= mvo.getMzonecode()%>',
				m_redirect_url: 'https://www.yourdomain.com/payments/complete'
				/*
				모바일 결제시,
				결제가 끝나고 랜딩되는 URL을 지정
				(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
				*/
				}, function (rsp) {
						console.log(rsp);
						
						if (rsp.success) {
							let urlVal = "/payAjax.wd";
							let typeVal = "POST";
							
							let impidVal = rsp.imp_uid;
							let merchantidVal = rsp.merchant_uid;
							let applynumVal = rsp.apply_num;
							let cardnumberVal = rsp.card_number;
							let paymethodVal = rsp.pay_method;
							let paynameVal = rsp.name;
							let payamountVal = rsp.paid_amount;
							let cardnameVal = rsp.card_name;
							
							$.ajax({
								url: urlVal,
								type: typeVal,
								data: {
									"impid": impidVal,
									"merchantid": merchantidVal,
									"applynum": applynumVal,
									"cardnumber": cardnumberVal,
									"paymethod": paymethodVal,
									"payname": paynameVal,
									"payamount": payamountVal,
									"cardname": cardnameVal,
									"tno": tnoVal,
									"cno": cnoVal,
									"tmno": tmnoVal,
									"cmno": cmnoVal
								},
								success: whenSuccess1,
								error: whenError1
							})
							
						} else {
							console.log("결제 실패 >>> ");
						}
					});
			});
			
			let urlVal = "/payAjax.wd";
			let typeVal = "POST";
			let paymethodVal = "mypoint";
			let payamountVal = "<%= cvo.getCprice()%>";
			let paynameVal = "위드독 결제";

			
			$("#pointPayBtn").on("click", function() {
				
				Swal.fire({
					title: "정말로 포인트 결제를 하시겠습니까?",
					text: "확실하다면 확인을 눌러주세요.",
					icon: "warning",
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
				    cancelButtonColor: '#d33',
				    confirmButtonText: '확인',
				    cancelButtonText: '취소'					
				}).then((result) => {
					if(result.value) {				
						$.ajax({
							url: urlVal,
							type: typeVal,
							data: {
								"paymethod": paymethodVal,
								"payname": paynameVal,
								"payamount": payamountVal,
								"payname": paynameVal,
								"tno": tnoVal,
								"cno": cnoVal,
								"tmno": tmnoVal,
								"cmno": cmnoVal
							},
							success: whenSuccess2,
							error: whenError2
						});
					}
				})				
			});
			
			// 일반 결제
			function whenSuccess1(result) {
				if(result == "success") {
					alert("일반 결제에 성공하셨습니다.");
					location.href=`/chatPaymentResult.wd?tno=${"${tnoVal}"}&cno=${"${cnoVal}"}`;
				} else {
					alert("일반 결제에 실패하셨습니다.");
				}
			}
			
			function whenError1(result) {
				alert("실패");
			}
			
			// 포인트 결제
			function whenSuccess2(result) {
				if(result == "success") {
					alert("포인트 결제에 성공하셨습니다.");
					location.href=`/chatPaymentResult.wd?tno=${"${tnoVal}"}&cno=${"${cnoVal}"}`;
				} else if(result == "lesspoint") {
					alert("포인트가 결제금액보다 적습니다.");
				} else {
					alert("포인트 결제에 실패하셨습니다.");
				}
			}
			
			function whenError2(result) {
				alert("실패");
			}
			
		</script>
		
    </body>
</html>