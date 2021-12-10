<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="a.b.c.com.agency.vo.ConditionVO"%>
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
		
			function chatPaymentResultBtnClick(e) {
				let cno = $(e).parent().parent().find(".cno").val();
				let tno = $(e).parent().parent().find(".tno").val();
				console.log("cno >>> : " + cno);
				console.log("tno >>> : " + tno);
				
				location.href=`/chatPaymentResult.wd?cno=${"${cno}"}&tno=${"${tno}"}`;
			}
		
			function chatPaymentBtnClick(e) {
				let cno = $(e).parent().parent().find(".cno").val();
				let tno = $(e).parent().parent().find(".tno").val();
				console.log("cno >>> : " + cno);
				console.log("tno >>> : " + tno);
				location.href=`/chatPayment.wd?cno=${"${cno}"}&tno=${"${tno}"}`;
			}
		
			// 수락버튼 누를 때 이벤트 함수
			function acceptBtnClick(e) {
				let paycount = $(e).parent().parent().find(".paycount").val();
				console.log("paycount >>> : " + paycount);
				
				var mAccount = $(e).parent().parent().find(".mAccount").text();
				
				Swal.fire({
					title: "정말로 " + mAccount + "님의 조건제시를 해제하시겠습니까?",
					text: "다시 한번 조건제시을 확인해 주세요.",
					icon: "warning",
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
				    cancelButtonColor: '#d33',
				    confirmButtonText: '확인',
				    cancelButtonText: '취소'					
				}).then((result) => {
					if(result.value) {
				
						// ajax로 insert 혹은 update문이 실행되야 한다.
						let cnoVal = $(e).parent().parent().find(".cno").val();
						let tnoVal = $(e).parent().parent().find(".tno").val();
						
						let typeVal = "GET";
						let urlVal = "/agencyCheckAjax.wd";
						
						console.log("cnoVal >>> : " + cnoVal);
						console.log("tnoVal >>> : " + tnoVal);
						
						$.ajax({
							url: urlVal,
							type: typeVal,
							data: {
								"cno": cnoVal,
								"tno": tnoVal
							},
							success: whenSuccess1,
							error: whenError1
						});
						
						let cancelBtn = "";
						
						if(paycount > 0) {
							cancelBtn = `
                        		<div class="btn btn-green hahmlet chatPaymentBtn" onclick="chatPaymentResultBtnClick(this)">
                    				<i class="fas fa-check-circle"></i> &nbsp; 결제완료
                    			</div>	
							`;	
						} else {
							cancelBtn = `
			        			<div class="btn btn-red hahmlet cancelBtn" onclick="cancelBtnClick(this)">
			            			<i class="fas fa-check-circle"></i> &nbsp; 수락해제
			            		</div>
			            		<div class="btn btn-yellow hahmlet" onclick="chatPaymentBtnClick(this)">
			            			<i class="fas fa-check-circle"></i> &nbsp; 결제하기
			            		</div>
							`;							
						}
						
						$(e).parent().html(cancelBtn);
					}
				})
				
			}
			
			// 취소버튼 누를 때 이벤트 함수
			function cancelBtnClick(e) {
				
				var mAccount = $(e).parent().prev().find(".mAccount").text();
				
				Swal.fire({
					title: "정말로 " + mAccount + "님의 조건제시를 해제하시겠습니까?",
					text: "다시 한번 조건제시을 확인해 주세요.",
					icon: "warning",
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
				    cancelButtonColor: '#d33',
				    confirmButtonText: '확인',
				    cancelButtonText: '취소'					
				}).then((result) => {
					if(result.value) {
				
						// ajax로 update문이 실행되어야 한다.
						let cnoVal = $(e).parent().parent().find(".cno").val();
						let tnoVal = $(e).parent().parent().find(".tno").val();
						let typeVal = "GET";
						let urlVal = "/agencyCheckAjax.wd";
						
						console.log("cnoVal >>> : " + cnoVal);
						console.log("tnoVal >>> : " + tnoVal);
						
						$.ajax({
							url: urlVal,
							type: typeVal,
							data: {
								"cno": cnoVal,
								"tno": tnoVal
							},
							success: whenSuccess2,
							error: whenError2
						});
						
						let acceptBtn = `
		                	<div class="btn btn-primary hahmlet acceptBtn" onclick="acceptBtnClick(this)">
								<i class="far fa-check-circle"></i> &nbsp; 수락
							</div>	          
                      		<div class="btn btn-danger hahmlet refuseBtn" onclick="refuseBtnClick(this)">
                      		<i class="fas fa-handshake-slash"></i> &nbsp; 거절
							</div>									
						`;
						
						$(e).parent().html(acceptBtn);
					}
				})	
						
			}
			
			// 거절버튼 누를 때 이벤트 함수
			function refuseBtnClick(e) {
				let paycount = $(e).parent().parent().find(".paycount").val();
				console.log("paycount >>> : " + paycount);
				
				var mAccount = $(e).parent().parent().find(".mAccount").text();
				
				Swal.fire({
					title: "정말로 " + mAccount + "님의 조건제시를 거절하시겠습니까?",
					text: "다시 한번 조건제시을 확인해 주세요.",
					icon: "warning",
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
				    cancelButtonColor: '#d33',
				    confirmButtonText: '거절',
				    cancelButtonText: '취소'					
				}).then((result) => {
					if(result.value) {

						// ajax로 insert 혹은 update문이 실행되야 한다.
						let cnoVal = $(e).parent().parent().find(".cno").val();
						let tnoVal = $(e).parent().parent().find(".tno").val();
						
						let typeVal = "GET";
						let urlVal = "/refuseCheckAjax.wd";
						
						console.log("cnoVal >>> : " + cnoVal);
						console.log("tnoVal >>> : " + tnoVal);
						
						$.ajax({
							url: urlVal,
							type: typeVal,
							data: {
								"cno": cnoVal,
								"tno": tnoVal
							},
							success: whenSuccess3,
							error: whenError3
						});
				
					}
				})
				
			}				
			
			// 수락버튼
			function whenSuccess1(resData) {
				console.log("성공");
				$("#liveToast1").toast("show");
			}
			
			function whenError1() {
				console.log("실패");
				$("#liveToast2").toast("show");
			}
			
			// 수락해제 버튼
			function whenSuccess2(resData) {
				console.log("성공");
				$("#liveToast3").toast("show");
			}
			
			function whenError2() {
				console.log("실패");
				$("#liveToast4").toast("show");
			}

			// 거절 버튼
			function whenSuccess3(resData) {
				if(resData == 'success') {
					alert("거절을 성공하셨습니다.");
					window.history.back();
				} else {
					alert("거절을 실패하셨습니다.");
					return;
				}
			}
			
			function whenError3() {
				console.log("실패");
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
               <main style="width:960px; margin:0 auto;">
                     <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="layout"></i></div>
                                            <span>반려동물 대리돌보미 상세정보</span>
                                        </h1>
                                        <div class="page-header-subtitle"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- 상세 돌봄신청 정보 -->
                    <div class="container-xl px-4 mt-n10">
					
					<%
						List<ConditionVO> conditionList = (List<ConditionVO>) request.getAttribute("conditionList");
						ConditionVO cvo = conditionList.get(0);
						
            			List<Integer> agencyListAnoCount = (List<Integer>) request.getAttribute("agencyListAnoCount");
            			List<String> agencyListMatchyn = (List<String>) request.getAttribute("agencyListMatchyn");
            			List<Integer> payListCount = (List<Integer>) request.getAttribute("payListCount");
            			
            			int anoCount = agencyListAnoCount.get(0);
            			String matchyn = agencyListMatchyn.get(0);
            			int payCount = payListCount.get(0);
            			
            			
    					// 오늘 날짜 구하기
    					String startdate = (String)request.getAttribute("startdate");
    					String enddate = (String)request.getAttribute("enddate");
    					
            			System.out.println("startdate >>> : " + startdate);
            			System.out.println("enddate >>> : " + enddate);

            			Date today = new Date();
    					SimpleDateFormat todayFormat = new SimpleDateFormat("yyyy-MM-dd H:m");
    					
    					String todayString = todayFormat.format(today);
    					Date todayDate = todayFormat.parse(todayString);
    					
    					Date startDate = todayFormat.parse(startdate);
    					Date endDate = todayFormat.parse(enddate);
					%>
					
                        <div class="card mb-4 mt-4">
                            <div class="card-header d-flex align-items-center">
                                <a class="btn btn-transparent-dark btn-icon" onclick="javascript:history.back();"><i data-feather="arrow-left"></i></a>
                                <div class="ms-3">
                                	<div class="my-3">
                                		<span style="font-size:25px; font-weight:bold; color:#7f7f7f;">
                                			<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)">
                                				<%=cvo.getMid()%> 반려동물 대리돌보미 신청
                                			</span>
                                		</span> &nbsp;
                                		<span style="color:gray; font-size:14px;">(<%=cvo.getCno()%>)</span> &nbsp;
                                	</div>	
                                </div>
                            </div>
                            
                            <div class="card-body">
                          		<input type="hidden" class="cno" value="<%=cvo.getCno() %>" /> 
			                    <input type="hidden" class="tno" value="<%=cvo.getTno() %>" />
			                    <input type="hidden" class="paycount" value="<%=payCount%>" />
			                    
                            	<div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-user"></i> &nbsp; 
	                                	<span>계정 아이디</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-2 mAccount"><%=cvo.getMname() %> (<%=cvo.getMid() %>)</p>
                                </div>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-coins"></i> &nbsp; 
	                                	<span>요구금액</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-5 ms-3"><%=cvo.getCprice() %>원</p>
                                </div>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-map-marked-alt"></i> &nbsp; 
	                                	<span>지역</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-3"><%= cvo.getCaddress() %></p>
                                </div>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="far fa-edit"></i> &nbsp; 
	                                	<span>추가 요구사항</span>
	                                </h4>
			                        <hr>
	                                <div class="lead mb-5 ms-3" style="max-width:500px; background:#e8e8e8; padding:20px; border-radius:20px;">
	                                	<%=cvo.getCcontent() %>
	                                </div>
                                </div>
                                
                                <div class="controlBtn">
                                   	<%
                                   		if(anoCount > 0) {
                                   			if(matchyn.equals("Y")) {
                                   				if(payCount > 0) {
                                   	%>
		                                    		<!--  
	                                    			<div class="btn btn-red hahmlet cancelBtn" onclick="cancelBtnClick(this)">
		                                    			<i class="fas fa-check-circle"></i> &nbsp; 수락해제
		                                    		</div>
		                                    		-->
		                                    		<div class="btn btn-green hahmlet chatPaymentBtn" onclick="chatPaymentResultBtnClick(this)">
		                                    			<i class="fas fa-check-circle"></i> &nbsp; 결제완료
		                                    		</div>	
                                    <%		
                                   				} else {
                                   					if(todayDate.before(startDate)) {
                                   	%>
		                                    			<div class="btn btn-red hahmlet cancelBtn" onclick="cancelBtnClick(this)">
			                                    			<i class="fas fa-check-circle"></i> &nbsp; 수락해제
			                                    		</div>
			                                    		<div class="btn btn-yellow hahmlet chatPaymentBtn" onclick="chatPaymentBtnClick(this)">
			                                    			<i class="fas fa-check-circle"></i> &nbsp; 결제하기
			                                    		</div>
		                            <%
                                   					}
                                   				}
                                    		} else {
                                    			if(todayDate.before(startDate)) {
                                    %>
		                                  			<div class="btn btn-primary hahmlet acceptBtn" onclick="acceptBtnClick(this)">
														<i class="far fa-check-circle"></i> &nbsp; 수락
													</div>	 
													<div class="btn btn-danger hahmlet refuseBtn" onclick="refuseBtnClick(this)">
														<i class="fas fa-handshake-slash"></i> &nbsp; 거절
													</div>	   
                                    <%	
                                    			}
                                    		}
                                   			
                                   		} else {
                                   			if(todayDate.before(startDate)) {
                                   	%>
		                                    	<div class="btn btn-primary hahmlet acceptBtn" onclick="acceptBtnClick(this)">
													<i class="far fa-check-circle"></i> &nbsp; 수락
												</div>	       
												<div class="btn btn-danger hahmlet refuseBtn" onclick="refuseBtnClick(this)">
													<i class="fas fa-handshake-slash"></i> &nbsp; 거절
												</div>	                                	
                                   	<%
                                   			}
                                   		}
                                   	%>
		                       	</div>
		                       	
                            </div>
                        </div>
                        <!-- /상세 돌봄신청 정보 -->
                        
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