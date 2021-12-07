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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".offerInfoBtn").on("click", function() {
					let urlVal = "/offerSelectAjax.wd";
					let typeVal = "GET";
					let tnoVal = $(this).find('.tnoVal').val();
					let mnoVal = $(this).find('.mnoVal').val();
					
					console.log("urlVal >>> : " + urlVal);
					console.log("typeVal >>> : " + typeVal);
					console.log("mnoVal >>> : " + mnoVal);
					
					$.ajax({
						url: urlVal,
						type: typeVal,
						data: {
							"mno":mnoVal,
							"tno":tnoVal
						},
						success : whenSuccess,
						error: whenError
					});
				});

			});
			
			function whenSuccess(resData) {
				console.log("성공");
				var result = JSON.parse(resData);
				console.log("tno >>> : " + result.tno);
				console.log("mid >>> : " + result.mid);
				console.log("mname >>> : " + result.mname);
				console.log("tlag >>> : " + result.tlag);
				console.log("tlng >>> : " + result.tlng);
				console.log("startdate >>> : " + result.startdate);
				console.log("enddate >>> : " + result.enddate);
				console.log("tprice >>> : " + result.tprice);
				console.log("tcontent >>> : " + result.tcontent);
				console.log("petArr >>> : " + result.petArr.length);
				var petArrLength = result.petArr.length;
				
				// 날짜 비교할 startdate와 enddate 변수
				const startdate = new Date(result.startdate);
				const enddate = new Date(result.enddate);
				
				// 오늘 날짜
				const today = new Date(getToday());
				
				//$("#modalTno").text(result.tno);
				$("#modalAccount").text(result.mname + " (" + result.mid + ")");
				$("#modalLocation").text(result.tlag + " , " + result.tlng);
				$("#modalDate").text(result.startdate + " ~ " + result.enddate);
				$("#modalTprice").text(result.tprice);
				$("#modalTcontent").text(result.tcontent);
				$("#modalPet").text("");
				
				for(var i=0; i<petArrLength; i++) {
					var petArr = result.petArr[i];
					var pname = petArr["pname"];
					var ptype = petArr["ptype"];
					var pgender = petArr["pgender"];
					var pneutral = petArr["pneutral"];
					var pphoto = petArr["pphoto"];
					var pweight = petArr["pweight"];
					var pmemo = petArr["pmemo"];
					var pages = petArr["pages"];
					
					let $petTag = `
                        <div class="col-lg-4 mb-3">
	                        <div class="d-flex align-items-center">
	                            <div class="avatar avatar-lg"><img class="avatar-img img-fluid" src="/template/assets/img/illustrations/profiles/profile-1.png"></div>
	                            <div class="ms-3">
	                                <div class="fs-4 text-dark fw-500">${"${pname}"}&nbsp;<span style="font-size:12px;">(${"${ptype}"})</span></div>
	                                <div class="small text-muted">중형견(${"${pweight}"})/${"${pages}"}살/중성화 x(${"${pneutral}"})</div>
	                            </div>
	                        </div>
	                    </div>					
					`;
					
					$("#modalPet").append($petTag);
				}
				
				var $stateTag = "";
				
				// 준비중
				if(today < startdate) {
					$stateTag = `
						<span style="font-size:35px; font-weight:bold; color:#4cc1c1">${"${result.tno}"}</span> &nbsp;
						<span class="me-3">
							<i class="fas fa-circle fa-sm ms-3 text-cyan"></i>
							<span class="hahmlet" style="font-size:13px; color:#4cc1c1; font-weight:bold;">준비중</span>
						</span>						
					`;
				}
				
				// 진행중
				if(today >= startdate && today < enddate) {
					$stateTag = `
						<span style="font-size:35px; font-weight:bold; color:#13a4a4;">${"${result.tno}"}</span> &nbsp;
						<span class="me-3">
							<i class="fas fa-circle fa-sm ms-3 text-teal"></i>
							<span class="hahmlet" style="font-size:13px; color::#13a4a4; font-weight:bold;">진행중</span>
						</span>					
					`;
				}
				
				// 종료
				if(today > enddate) {
					$stateTag = `
						<span style="font-size:35px; font-weight:bold; color:red;">${"${result.tno}"}</span> &nbsp;
						<span class="me-3">
							<i class="fas fa-circle fa-sm ms-3 text-red"></i>
							<span class="hahmlet" style="font-size:13px; color:red; font-weight:bold;">종료</span>
						</span>					
					`;
				}
				
				$("#modalState").html($stateTag);
				
			}
			
			function whenError() {
				console.log("실패");
			}
			
			// 자바스크립트 서버시간 가져오기
			function srvTime(){
				var xmlHttp; 
				
			    if (window.XMLHttpRequest) {
			        xmlHttp = new XMLHttpRequest();
			        xmlHttp.open('HEAD',window.location.href.toString(),false);
			        xmlHttp.setRequestHeader("Content-Type", "text/html");
			        xmlHttp.send('');
			        return xmlHttp.getResponseHeader("Date");
			    }else if (window.ActiveXObject) {
			            xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
			            xmlHttp.open('HEAD',window.location.href.toString(),false);
			            xmlHttp.setRequestHeader("Content-Type", "text/html");
			            xmlHttp.send('');
			            return xmlHttp.getResponseHeader("Date");
			    }
			}
			
			function getToday() {
				var st = srvTime();
				var today = new Date(st);
				
				var year = '';
				var month = '';
				var day = '';
				var time = '';
				var todayTime = ''; 

				// 현재 날짜 조회
				year = today.getFullYear()+'';
				month = (today.getMonth()+1)+'';
				day = today.getDate()+'';
				hour = today.getHours()+'';
				min = today.getMinutes()+'';
		
				if(month.length == 1) {
				  month = '0'+month;
				}
				if(day.length == 1) {
				  day = '0'+day;
				}
				if(hour.length == 1) {
				  hour = '0'+hour;
				}
				if(min.length == 1) {
				  min = '0'+min;
				}
				today = (year+ "/" +month+ "/" +day);
				todayTime = (today+' '+hour+':'+min);	
				
				return todayTime;
			}
			
			function chatPaymentResultBtnClick(cno, tno) {
				console.log("cno >>> : " + cno);
				console.log("tno >>> : " + tno);
				
				location.href=`/chatPaymentResult2.wd?cno=${"${cno}"}&tno=${"${tno}"}`;
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
                                            <span>조건제시 상세정보</span>
                                        </h1>
                                        <div class="page-header-subtitle">The default page header layout with main content that overlaps the background of the page header</div>
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
							
							String tno = cvo.getTno();
							
                			List<Integer> agencyListAnoCount = (List<Integer>) request.getAttribute("agencyListAnoCount"); 
                			List<String> agencyListMatchyn = (List<String>) request.getAttribute("agencyListMatchyn");
                			List<Integer> payListCount = (List<Integer>) request.getAttribute("payListCount");
                			
                			int agencySelectCount = agencyListAnoCount.get(0);
                			String matchyn = agencyListMatchyn.get(0);
                			int payCount = payListCount.get(0);
                			
							String cno = cvo.getCno();
                			
							// 오늘 날짜 구하기
							Date today = new Date();
							SimpleDateFormat todayFormat = new SimpleDateFormat("yyyy/MM/dd H:m");
							
							String todayString = todayFormat.format(today);
							Date todayDate = todayFormat.parse(todayString);
						%>
						
                        <div class="card mb-4 mt-4">
                            <div class="card-header d-flex align-items-center">
                                <a class="btn btn-transparent-dark btn-icon" onclick="javascript:history.back();"><i data-feather="arrow-left"></i></a>
                                <div class="ms-3">
                                	<div class="my-3">
                                		<span style="font-size:35px; font-weight:bold;"><%=cvo.getCno()%></span> &nbsp;
                                	</div>	
                                </div>
                            </div>
                            
                            <div class="card-body">
                            	<div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-user"></i> &nbsp; 
	                                	<span>사용자</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-2"><%=cvo.getMname() %> (<%=cvo.getMid() %>)</p>
                                </div>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-coins"></i> &nbsp; 
	                                	<span>요구금액</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-5 ms-3"><%=cvo.getCprice() %> 원</p>
                                </div>
                                
                                <div>
	                                <h4 class="ms-1">
	                                	<i class="fas fa-map-marked-alt"></i> &nbsp; 
	                                	<span>지역</span>
	                                </h4>
	                                <hr>
	                                <p class="lead mb-4 ms-3"><%=cvo.getCaddress() %></p>
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
                                
                                <span class="controlBtn">
                               		<%
                               			if(agencySelectCount > 0) {
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
								</span>
								
                   				<div class="btn btn-info hahmlet offerInfoBtn" data-bs-toggle="modal" data-bs-target="#offerModel">
                               		<i class="far fa-file-alt"></i> &nbsp; 신청정보
                        			<input type="hidden" class="mnoVal" value="<%=cvo.getMno()%>"/>
                        			<input type="hidden" class="tnoVal" value="<%=cvo.getTno()%>"/>
                               	</div>
                               	
                            </div>
                        </div>
                        <!-- /상세 돌봄신청 정보 -->
                        
                    </div>
                </main>				
				<!-- ** /주요 내용 ** -->

				<!-- 신청정보 모달창 -->
				<div class="modal fade" id="offerModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				    <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="exampleModalScrollableTitle">신청 정보</h5>
				                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
								<!-- 신청정보 카드 -->
		                        <div class="card mb-4 mt-4">
		                            <div class="d-flex align-items-center">
		                                <div class="ms-3">
		                                	<div id="modalState" class="my-3">
		                                	</div>	
		                                </div>
		                            </div>
		                            
		                            <div class="card-body">
		                            	<br>
		                            	<div>
			                                <h4 class="ms-1">
			                                	<i class="fas fa-user"></i> &nbsp; 
			                                	<span>사용자</span>
			                                </h4>
			                                <hr>
			                                <p class="lead mb-4 ms-2" id="modalAccount"></p>
		                                </div>
		                                <br>
		                                
		                            	<div>
			                                <h4 class="ms-1">
			                                	<i class="fas fa-map-marked-alt"></i> &nbsp; 
			                                	<span>지역</span>
			                                </h4>
			                                <hr>
			                                <p class="lead mb-4 ms-2" id="modalLocation"></p>
		                                </div>
		                                <br>
		                                
		                                <div>
			                                <h4 class="ms-1">
			                                	<i class="far fa-clock"></i> &nbsp; 
			                                	<span>날짜</span>
			                                </h4>
			                                <hr>
			                                <p class="lead mb-4 ms-3" id="modalDate"></p>
		                                </div>
		                                <br>
		                                
		                                <div>
			                                <h4 class="ms-1">
			                                	<i class="fas fa-coins"></i> &nbsp; 
			                                	<span>금액</span>
			                                </h4>
			                                <hr>
			                                <p class="lead mb-5 ms-3" id="modalTprice"> 원</p>
		                                </div>
		                                <br>
		                                
		                                <div>
			                                <h4 class="ms-1">
			                                	<i class="fas fa-paw"></i> &nbsp; 
			                                	<span>맡기는 동물</span>
			                                </h4>
					                        <hr>
					                        <div id="modalPet" class="row" style="padding:10px;">
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
			                               <div id="modalTcontent" class="lead mb-5 ms-3" style="max-width:500px; background:#e8e8e8; padding:20px; border-radius:20px;">
			                                  
			                               </div>
		                               </div>		                       
		                               
		                            </div>
		                        </div>
		                        <!-- /신청정보 카드 -->	
		                        			                
				            </div>
				            <div class="modal-footer">
				            	<button class="btn btn-red" type="button" data-bs-dismiss="modal">닫기</button>
				            </div>
				        </div>
				    </div>
				</div>
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>>