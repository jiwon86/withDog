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
	<style>
	.headerdog  {
		position : absolute;
		width : 20%;
		height : 200px;
		left : 60%
	}
	</style>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
		<script type="text/javascript">
			$(document).ready(function() {
				// 신청 정보를 모달형태로 보여주기 위한 Ajax처리
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
				console.log("tno >>> : " + result.tno);
				console.log("tlag >>> : " + result.tlag);
				console.log("tlng >>> : " + result.tlng);
				console.log("taddress >>> : " + result.taddress);
				console.log("tphoto >>> : " + result.tphoto);
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
				$("#modalLocation").text(result.taddress);
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
					
					var link = `/img/pet/${"${pphoto}"}`;
					
					// 반려동물 정보 바꾸기
					var pneutraltext = '';
					
					if(pneutral == 'Y') {
						pneutraltext = '중성화 O';
					} else {
						pneutraltext = '중성화 X';
					}
					
					var pgendertext = '';
					
					if(pgender == '01') {
						pgendertext = '수컷';
					} else {
						pgendertext = '암컷';
					}
					
					var ptypetext = '';
					
					if(ptype == '01') {
						ptypetext = '쉽독';
					} else if(ptype == '02') {
						ptypetext = '캐틀 독';
					} else if(ptype == '03') {
						ptypetext = '테리어';
					} else if(ptype == '04') {
						ptypetext = '닥스훈트';
					} else if(ptype == '05') {
						ptypetext = '스피츠';
					} else if(ptype == '06') {
						ptypetext = '센트하운드';
					} else if(ptype == '07') {
						ptypetext = '포인팅독';
					} else if(ptype == '08') {
						ptypetext = '리트리버';
					} else if(ptype == '09') {
						ptypetext = '토이독';
					} else if(ptype == '10') {
						ptypetext = '사이트 하운드';					
					}
					
					let $petTag = `
                        <div class="col-lg-4 mb-3">
	                        <div class="d-flex align-items-center">
	                            <div class="avatar avatar-lg"><img class="avatar-img img-fluid" src=${"${link}"}></div>
	                            <div class="ms-3">
	                                <div class="fs-4 text-dark fw-500">${"${pname}"}&nbsp;<span style="font-size:12px;">(${"${ptypetext}"})</span></div>
	                                <div class="small text-muted">${"${pweight}"}KG/${"${pages}"}살/${"${pneutraltext}"}/${"${pgendertext}"}</div>
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
						<span style="font-size:25px; font-weight:bold; color:#7f7f7f;">
							<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)">
								${"${result.mid}"} 돌봄신청
							</span> &nbsp;
							<span style="color:gray; font-size:14px;">(${"${result.tno}"})</span>
						</span> &nbsp;
						<span class="me-3">
							<i class="fas fa-circle fa-sm ms-3 text-cyan"></i>
							<span class="hahmlet" style="font-size:13px; color:#4cc1c1; font-weight:bold;">준비중</span>
						</span>						
					`;
				}
				
				// 진행중
				if(today >= startdate && today < enddate) {
					$stateTag = `
						<span style="font-size:25px; font-weight:bold; color:#7f7f7f;">
							<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)">
								${"${result.mid}"} 돌봄신청
							</span> &nbsp;
							<span style="color:gray; font-size:14px;">(${"${result.tno}"})</span>
						</span> &nbsp;					
						<span class="me-3">
							<i class="fas fa-circle fa-sm ms-3 text-teal"></i>
							<span class="hahmlet" style="font-size:13px; color::#13a4a4; font-weight:bold;">진행중</span>
						</span>					
					`;
				}
				
				// 종료
				if(today > enddate) {
					$stateTag = `
						<span style="font-size:25px; font-weight:bold; color:#7f7f7f;">
							<span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)">
								${"${result.mid}"} 돌봄신청
							</span> &nbsp;
							<span style="color:gray; font-size:14px;">(${"${result.tno}"})</span>
						</span> &nbsp;					
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
                            	<img src="/image/header_dog_4.png" class="headerdog">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="activity"></i></div>
                                                                                  돌봄서비스
                                        </h1>
                                        <div class="page-header-subtitle">간편하고 편리한 돌봄서비스를 이용해보세요.</div>
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
                                                <h5 class="hahmlet">돌봄신청 현황</h5>
                                                <div class="text-muted small">To create informative visual elements on your pages</div>
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
                                                <h5 class="hahmlet">조건제시 현황</h5>
                                                <div class="text-muted small">To keep you on track when working with our toolkit</div>
                                            </div>
                                            <img src="/template/assets/img/illustrations/processing.svg" alt="..." style="width: 8rem" />
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- /탭메뉴 -->
                        
                        <!-- 돌봄신청 리스트 -->
                        <h4 class="mb-0 mt-5">내 조건제시 정보</h4>
                        <hr class="mt-2 mb-4" />

						<div class="row">
						<%
							//페이징 변수 세팅
							int pageSize = 0;
							int groupSize = 0;
							int curPage = 0;
							int totalCount = 0;	
							
                			
							List<ConditionVO> conditionListAll = (List<ConditionVO>) request.getAttribute("conditionListAll");
							
							if(conditionListAll.size() > 0) {
							
							ConditionVO pagingConditionVO = (ConditionVO)request.getAttribute("pagingConditionVO");
                			List<Integer> agencyListAnoCount = (List<Integer>) request.getAttribute("agencyListAnoCount"); 
                			// agencySelectCount가 0이면 "N"이 들어가 있음
                			List<String> agencyListMatchyn = (List<String>) request.getAttribute("agencyListMatchyn");
                			List<Integer> payListCount = (List<Integer>) request.getAttribute("payListCount");
                			
							for(int i=0; i<conditionListAll.size(); i++) {
								ConditionVO cvo = conditionListAll.get(i);
								
                    			int agencySelectCount = agencyListAnoCount.get(i);
                    			String matchyn = agencyListMatchyn.get(i);
                    			int payCount = payListCount.get(i);
								
								pageSize = Integer.parseInt(pagingConditionVO.getPageSize());
								groupSize = Integer.parseInt(pagingConditionVO.getGroupSize());
								curPage = Integer.parseInt(pagingConditionVO.getCurPage());
								totalCount = Integer.parseInt(cvo.getTotalCount());
								
								String cno = cvo.getCno();
								String tno = cvo.getTno();
						%>
	                            <div class="col-lg-6 mb-4">
	                                <div class="card lift lift-sm h-100">
	                                    <div class="card-body" onclick="javascript:location.href='/myConditionSelect.wd?cno=<%=cvo.getCno()%>'">
	                                        <h5 class="card-title mb-2 hahmlet" style="font-weight:bold; font-size:20px; color:#7f7f7f;">
	                                            <span style="background:linear-gradient(to top, #FFE400 50%, transparent 50%)">
	                                            	<%=cvo.getMid()%> 조건제시
	                                            </span> &nbsp;
	                                            <span style="color:gray; font-size:14px;">(<%= cvo.getTno() %>)</span>
	                                        </h5>
	                                        <hr>
	                                        <p class="card-text mb-1 hahmlet">
	                                        	<i class="fas fa-user"></i> &nbsp;&nbsp;
	                                        	<span><%=cvo.getMname() %> (<%=cvo.getMid() %>)</span>
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
	                                    
	                                    <div class="card-footer">
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
                        
                        <!-- 
                        	<div class="btn btn-red hahmlet">
		                     	<i class="fas fa-times-circle"></i></i> &nbsp; 매칭실패
		                    </div> 
		                -->
                        
                        <!-- /돌봄신청 리스트 -->
                        
                        <% 
                        	if(conditionListAll.size() > 0) {
                        %>
                        <!-- /돌봄신청 리스트 -->
	                    <jsp:include page="conditionPaging.jsp" flush="true">
							<jsp:param name="url" value="myConditionSelectAllPaging.wd"/>
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
</html>