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
		<style type="text/css">
				
			.headerdog  {
				position : absolute;
				width : 15%;
				height : 250px;
				left : 65%
			}
		
		</style>
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
				<%
					MemberVO member = (MemberVO)request.getAttribute("mvo");
					String mroadaddress = member.getMroadaddress();
					String[] mroadaddressArr = mroadaddress.split("@");
					String mphoto = member.getMphoto();
				%>
				<form id="memberUpdateForm" name="memberUpdateForm">
					<input id="mname" type="hidden" name="mname" value="<%=member.getMname()%>" />
					<input id="memail" type="hidden" name="memail" value="<%=member.getMemail()%>" />
	                <input id="mbirth" type="hidden" name="mbirth" value="<%=member.getMbirth()%>" />
	                <input id="mzonecode" type="hidden" name="mzonecode" value="<%=member.getMzonecode()%>" />
	                <input id="mroadaddress" type="hidden" name="mroadaddress" value="<%=mroadaddressArr[0]%>" />
	                <input id="mroadaddressdetail" type="hidden" name="mroadaddressdetail" value="<%=mroadaddressArr[1]%>" />
	                <input id="mjibunaddress" type="hidden" name="mjibunaddress" value="<%=member.getMjibunaddress()%>" />
				</form>
				
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
	<header class="page-header page-header-light bg-withcolor pb-10">
		<div class="container-xl px-4">
			<div class="page-header-content pt-4">
				<img src="/image/header/header_profile_4.png" class="headerdog">
					<div class="row align-items-center justify-content-between">
						<div class="col-auto mt-4">
							<h1 class="page-header-title">
								<div class="page-header-icon"><i i class="fas fa-coins"></i></div>
										포인트
									</h1>
						<div class="page-header-subtitle">포인트의 충전내역을 확인 할 수 있어요. </div>
					</div>
				</div>
			</div>
		</div>
	</header>
<div class="container-xl px-4 mt-n10">	
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
                                	<div id="check_module" class="btn btn-sm text-arrow-icon small bg-withcolor text-dark lift">
                                                                           포인트 충전하기
                                        <i data-feather="arrow-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                            
                        <div style="clear:both"></div>
                        <%
                    		if(payList.size() > 0) {
                        %>
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
		                                                	<span class="badge bg-primary text-white"><%=payvo.getCardname() %></span>
		                                                </td>
		                                            <%
	                                                	} else if(paymethod.equals("point") && payvo.getTmno().equals("0")) {
		                                            %>
		                                                <td>
		                                                	<span class="badge bg-green text-white">포인트충전</span>
		                                                </td>		                                            
		                                            <%
	                                                	} else if(paymethod.equals("mypoint")) {
		                                            %>
		                                                <td>
		                                                	<span class="badge bg-warning text-white">포인트결제</span>
		                                                </td>		                                            		                                            
		                                            <%
	                                                	} else if(paymethod.equals("point")) {
	                                                %>
			                                            <td>
		                                                	<span class="badge bg-light text-dark" style="background:#FFF612;">카카오페이</span>
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
						<%
		                	} else {
		                %>
		                		<h2 class="text-center" style="margin-top:50px;">현재 결제내역이 존재하지 않습니다.</h2>
		                <%
		                	}
		                %>

						<%
							if(payList.size() > 0) {
						%>
		                    <jsp:include page="mypayPaging.jsp" flush="true">
								<jsp:param name="url" value="mypay.wd"/>
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
				
				<script type="text/javascript">
					const tnoVal = `0`;
					const cnoVal = `0`;
					const tmnoVal = `0`;
					const cmnoVal = `<%=mvo.getMno()%>`;
				
					$("#check_module").click(function () {
					
						var value = prompt("충전할 금액을 입력하세요.", "1000");
						
						//==== 결제모듈 ========
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
						amount: value,
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
								let urlVal = "/payChargeAjax.wd";
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
						//==== /결제모듈 ========		
						
					});	
					
					// 일반 결제
					function whenSuccess1(result) {
						
						if(result == "success") {
							alert("충전을 성공하셨습니다.");
							location.href=`/mypay.wd`;
						} else {
							alert("충전을 실패하였습니다.");
						}
					}
					
					function whenError1(result) {
						alert("에러가 발생하였습니다.");
					}
		
				</script>
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>