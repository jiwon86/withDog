<%@page import="java.util.ArrayList"%>
<%@page import="a.b.c.com.pet.vo.PetVO"%>
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
		<!-- 제이쿼리  -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 자바스크립트 -->
		<script type="text/javascript">
		$(document).ready(function(){	
			
			$(document).on("click", "#pno", function(){
				
				if($(this).prop('click')){			 
					$('.pno').prop('click',false);
					$(this).prop('click',true);
				}
			});
			
			$(document).on("click", "#select", function(){	
				alert('댕댕이 번호 >>> '+pno)
				$("#petSelectAllForm").attr({ "method":"GET","action":"petSelect.wd"}).submit();
			});
			
			$(document).on("click", "#insert", function(){	
				
				$("#petSelectAllForm").attr({ "method":"GET","action":"petInsertForm.wd"}).submit();
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
            	 <main>
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
                            <a class="nav-link" href="account-profile.html">Profile</a>
                            <a class="nav-link active ms-0" href="myPetList.wd">MyPet</a>
                            <a class="nav-link" href="account-security.html">Security</a>
                            <a class="nav-link" href="account-notifications.html">Notifications</a>
                        </nav>
                        <hr class="mt-0 mb-4" />
            	<%
						Object obj = request.getAttribute("listAll");
						System.out.println("obj >>>>>" + obj);
						if (obj == null) return;
						
						ArrayList<PetVO> aList = (ArrayList<PetVO>)obj;
						
						int nCnt = aList.size();
						out.println("등록된 반려동물 수 :  "+nCnt);
					%>
					
					<form name="petSelectAllForm" id="petSelectAllForm">
					<button class="btn btn-primary" type="button" name="insert" id ="insert">추가하기</button>
					<table>
						<%
						for(int i=0; i<nCnt; i++){
							PetVO pvo = aList.get(i);
						%>
						 
						<tr>
							<div class="card">
								<input type="hidden" id = "pno" name="pno" class="pno" value=<%=pvo.getPno() %>>
								<img id="select" name="select" class="card-img-top" src="<%=pvo.getPphoto() %>" alt="사진준비중">
								<div class="card-body">
									<h5 class="card-title"><%=pvo.getPname() %></h5>
									<p class="card-text">
										<%=pvo.getPages() %>살<br>
										<%=pvo.getPtype() %><br>
										<%=pvo.getPweight() %>kg
										
									</p>
								</div>
							</div>
							</td>
						</tr>
						
						
						<% } %>
					</table>
				</form> 
				</main>
				
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					TEST
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
				<!-- 
				<div class="card">
					<img class="card-img-top" src="" alt="사진준비중">
					<div class="card-body">
						<h5 class="card-title">Test card</h5>
						<p class="card-text">
						</p>
					</div>
				</div>
				 -->
				
				<!-- ** /주요 내용 ** -->
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>