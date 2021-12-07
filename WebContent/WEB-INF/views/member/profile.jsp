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
					$("#memberUpdateForm").attr({ "method":"POST","action":"petSelectAll.wd"}).submit();
				});
				
				$("#zonecode").click(function() {
					new daum.Postcode({
						oncomplete: function(data) {
							$("#mzonecode").val(data.zonecode);
							$("#mroadaddress").val(data.roadAddress);
							$("#mjibunaddress").val(data.jibunAddress);						
						}
					}).open();
				});
/* 				
				$("#mbirth").datepicker({
			        dateFormat: 'yy-mm-dd' //달력 날짜 형태
	               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	               ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	               ,changeYear: true //option값 년 선택 가능
	               ,changeMonth: true //option값  월 선택 가능             
	               ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	               ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	               ,maxDate: "+0y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
				});
						 */		
				$("#inputImage").change(function(){
					readURL(this);
				});
				
				$("#updateBtn").click(function() {
					memberUpdateAlert();
				});
				
				$("#btnMphoto").click(function() {
					$("#inputImage").click();
				})

			});

			function memberUpdateAlert() {
				Swal.fire({
					title: "정말로 프로필을 수정하시겠습니까?",
					text: "다시 한번 수정사항을 확인해 주세요.",
					icon: "warning",
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
				    cancelButtonColor: '#d33',
				    confirmButtonText: '수정',
				    cancelButtonText: '취소'					
				}).then((result) => {
					if(result.value) {
						// 수정 버튼을 눌렀을 때 작업할 내용을 작성
						updateMemberAjax();
					}
				})
			}
			
			function updateMemberAjax() {
				
				var form = $("#memberUpdateForm")[0];
				var data = new FormData(form);
				
				$.ajax({
					type: "POST",
					enctype: "multipart/form-data",
					url: "/memberUpdate.wd",
					data: data,
					processData: false,
					contentType: false,
					/*
					beforeSend: function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					*/
					success: function(data) {
						$("#liveToast1").toast("show");
					},
					error: function(request, error) {
						$("#liveToast2").toast("show");
						console.log(error);
					}
				});
				
			}
	
			
			function readURL(input) {
				if(input.value == "") {
					console.log("input.value == '' ");
					$("#mphoto").attr("src", "/image/member/default.jpg");
				} else {
					console.log("else");
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#mphoto").attr("src", e.target.result);
					}
				}
				
				if(input.files[0] != null) {
					console.log("input.files[0] : OK");
					reader.readAsDataURL(input.files[0]);
				}
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
					
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
				<%
<<<<<<< HEAD
					Member member = (Member)request.getAttribute("member");
=======
					MemberVO member = (MemberVO)request.getAttribute("member");
				
>>>>>>> branch 'master' of https://github.com/jiwon86/withDog
					String mroadaddress = member.getMroadaddress();
					String[] mroadaddressArr = mroadaddress.split("@");
					String mphoto = member.getMphoto();
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
                            <a class="nav-link active ms-0" href="/profile.wd">Profile</a>
<<<<<<< HEAD
                            <a class="nav-link" href="myPetList.wd">MyPet</a>
                            <a class="nav-link active ms-0" href="account-profile.html">Profile</a>
                            <a class="nav-link" href="#" id="Mypet">MyPet</a>
=======
                            <a class="nav-link" id="Mypet" href="#">MyPet</a>
>>>>>>> branch 'master' of https://github.com/jiwon86/withDog
                            <a class="nav-link" href="account-security.html">Security</a>
                            <a class="nav-link" href="account-notifications.html">Notifications</a>
                            <a class="nav-link" href="myReviewList.wd">MyReview</a>
                        </nav>
                        <hr class="mt-0 mb-4" />
                        
                        <form id="memberUpdateForm">
                        	<div class="row">
	                        	<!-- 프로필 사진 -->
	                            <div class="col-xl-4">
	                                <div class="card mb-4 mb-xl-0">
	                                    <div class="card-header">프로필 사진</div>
	                                    <div class="card-body text-center">
	                                    	
	                                    	<% if(mphoto != null) { %>
		                                        <img id="mphoto" class="img-account-profile mb-2" 
		                                        	 src="/img/member/<%=member.getMphoto()%>" alt="프로필 사진" 
		                                        	 style="border-radius:50%; max-width:150px; max-height:150px;" />
                                        	<% } else { %>
                                        		<img id="mphoto" class="img-account-profile mb-2" 
		                                        	 src="/img/member/default.jpg" alt="프로필 사진" 
		                                        	 style="border-radius:50%; max-width:150px; max-height:150px;" />
                                        	<% } %>
                                        	
	                                        <div class="small font-italic text-muted mb-4">이미지 용량의 제한이 있습니다.</div>
	                                          
	                                        <input class="btn btn-primary" id="btnMphoto" type="button" value="프로필 사진 선택">
	                                       
	                                        <input type="file" name="mphoto" id="inputImage" style="display:none;" />
	                                    </div>
	                                </div>
	                            </div>
	                            
	                            <div class="col-xl-8">
	                                <!-- Account details card-->
	                                <div class="card mb-4">
	                                    <div class="card-header">내 프로필 정보</div>
	                                    <div class="card-body">
	                                    		<!-- 번호 -->
	                                        	<input type="hidden" id="mno" name="mno" value="<%=member.getMno()%>">
	                                            
	                                            <!-- 아이디 -->
	                                            <div class="mb-3">
	                                                <label class="small mb-1" for="mid">아이디</label>
	                                                <input class="form-control" id="mid" type="text" 
	                                                	   placeholder="아이디 입력" value="<%=member.getMid()%>" disabled />
	                                            </div>
	                                            
	                                            <!-- 이름 -->
	                                            <div class="mb-3">
	                                                <label class="small mb-1" for="mname">이름</label>
	                                                <input class="form-control" id="mname" name="mname" type="text" placeholder="이름 입력" value="<%=member.getMname()%>" />
	                                            </div>
	                                            
	                                            <!-- 이메일-->
	                                            <div class="mb-3">
	                                                <label class="small mb-1" for="memail">이메일</label>
	                                                <input class="form-control" id="memail" name="memail" type="email" placeholder="이메일 입력" value="<%=member.getMemail()%>" />
	                                            </div>
	                                            
	                                            <!-- 계정생성일, 생년월일 -->
	                                            <div class="row gx-3 mb-3">
	                                                <div class="col-md-6">
	                                                    <label class="small mb-1" for="insertdate">계정 생성일</label>
	                                                    <input class="form-control" id="insertdate" type="date" value="<%=member.getInsertdate()%>" disabled />
	                                                </div>
	                                                <div class="col-md-6">
	                                                    <label class="small mb-1" for="mbirth">생년월일</label>
	                                                    <input class="form-control" id="mbirth" type="date" name="mbirth" 
	                                                           placeholder="생년월일 입력" value="<%=member.getMbirth()%>" />
	                                                </div>
	                                            </div>
	                                            
	                                            <!-- 우편번호, 우편번호 찾기 버튼 -->
	                                            <div class="row gx-3 mb-3">
	                                                <!-- Form Group (organization name)-->
	                                                <div class="col-md-6">
	                                                    <label class="small mb-1" for="mzonecode">우편번호</label>
	                                                    <input class="form-control" id="mzonecode" type="text" name="mzonecode" 
	                                                    	   placeholder="우편번호 입력" value="<%=member.getMzonecode()%>" />
	                                                </div>
	                                            </div>
	                                            <div class="row gx-3 mb-3">
	                                                <div class="col-md-6">
	                                                 <label class="small mb-1" for="zonecode"></label>
	                                                    <button id="zonecode" class="btn btn-success btn-sm lift" type="button">우편번호 찾기</button>
	                                                </div>
	                                            </div>
	                                            
	                                            <!-- 도로명 주소, 도로명 상세주소 -->
	                                            <div class="row gx-3 mb-3">
	                                                <!-- Form Group (organization name)-->
	                                                <div class="col-md-6">
	                                                    <label class="small mb-1" for="mroadaddress">도로명 주소</label>
	                                                    <input class="form-control" id="mroadaddress" name="mroadaddress" type="text" placeholder="도로명 주소 입력" value="<%=mroadaddressArr[0]%>" />
	                                                </div>
	                                                <!-- Form Group (location)-->
	                                                <div class="col-md-6">
	                                                    <label class="small mb-1" for="mroadaddressdetail">도로명 상세주소</label>
	                                                    <input class="form-control" id="mroadaddressdetail" name="mroadaddressdetail" type="text" placeholder="도로명 상세주소 입력" value="<%=mroadaddressArr[1]%>" />
	                                                </div>
	                                            </div>
	                                            
	                                            <!-- 지번 주소-->
	                                            <div class="mb-4">
	                                                <label class="small mb-1" for="mjibunaddress">지번주소</label>
	                                                <input class="form-control" id="mjibunaddress" name="mjibunaddress" type="text" placeholder="지번주소 입력" value="<%=member.getMjibunaddress()%>" />
	                                            </div>
	                                            
	                                            <hr>
	                                            
	                                            <!-- 수정 하기 버튼 -->
	                                            <a id="updateBtn" class="btn btn-primary lift">수정 하기</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
  						</form>
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