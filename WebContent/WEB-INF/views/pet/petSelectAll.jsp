<%@page import="a.b.c.com.member.vo.MemberVO"%>
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
		
		<!-- w3 -->
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		
		<!-- 자바스크립트 -->
		<script type="text/javascript">
		$(document).ready(function(){	

			$("#Mypet").click(function(){

				console.log("mno >>>" + petSelectAllForm.mno.value);
				$("#petSelectAllForm").attr({ "method":"POST","action":"petSelectAll.wd"}).submit();
			});
			
			
			$(document).on("click", "#pno", function(){
				
				var pno = $(this).attr('value');
				//alert("pno >>>>>" + pno);	
				//$("#petSelectAllForm").attr({ "method":"GET","action":"petSelect.wd","value":pno}).submit();
			});
			
				
				
			$(document).on("click", "#insert", function(){	
				//alert("mno >>>" + petSelectAllForm.mno.value);
				
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
                            <a class="nav-link" href="/profile.wd">프로필정보</a>
                            <a class="nav-link active ms-0" href="#" id="Mypet">동물정보</a>
                            <a class="nav-link" href="/mypay.wd">포인트정보</a>
                            <a class="nav-link" href="myReviewList.wd">리뷰정보</a>
                        </nav>
                        <hr class="mt-0 mb-4" />
            	<%
						Object obj = request.getAttribute("listAll");
						System.out.println("obj >>>>>" + obj);
						if (obj == null) return;
						MemberVO member = (MemberVO)request.getAttribute("member");
						
						ArrayList<PetVO> aList = (ArrayList<PetVO>)obj;
						
						int nCnt = aList.size();
						
						
					%>
					<div class="w3-row">

					<form name="petSelectAllForm" id="petSelectAllForm">
					<input type="hidden" name="mno" id="mno" value=<%=member.getMno() %>>
					<div class="card-header text-primary">나의 댕댕이 관리</div>
					<div class="card-body bg-white">
						등록된 댕댕이 :  총 <%=nCnt %> 마리
						<button class="btn btn-primary" type="button" name="insert" id ="insert" style="float : right">추가하기</button>
					</div>
					
					</div>
					<br>
					<table>
						<%
						for(int i=0; i<nCnt; i++){
							PetVO pvo = aList.get(i);
							
							
							if(i%2==0){
						%>
							<div class="w3-row">
							
						<%
							}
						%>
						
						 	<div class="w3-half w3-container">
						 	<div class="card-header text-primary"><%=pvo.getPname() %></div>
							<div class="card w3-center">
								<a class="bg-transparent" href="/petSelect.wd?mno=<%=member.getMno() %>&pno=<%=pvo.getPno()%>">
								<% if(pvo.getPphoto() != null) { %>
                                 	<img id="select" 
                                 	 src="/img/pet/<%=pvo.getPphoto()%>" alt="댕댕이 사진"
                                 	 style="border-radius:50%; width:300px; height:300px; margin :30px;"
                                 	  />
                               	<% } else { %>
                               		<img id="select"  
                                 	 src="/img/pet/default.jpg" alt="댕댕이 사진" 
                                 	 style="border-radius:50%; max-width:300px; max-height:300px; margin :30px;"
                                 	 />
                               	<% } %>
								
								</a>
								<%
									String type = "";
									type=pvo.getPtype();
									System.out.println("tyep >>>> " + type);
									
									
									//견종 관련 코드
									if(type.equals("01")){
										type = "쉽독 , 캐틀독";
									}else if(type.equals("02")){
										type= "핀셔,슈나우저-몰로세르 견종-스위스 마운틴 독,캐틀 독";
									}else if(type.equals("03")){
										type= "테리어";
									}else if(type.equals("04")){
										type= "닥스훈트";
									}else if(type.equals("05")){
										type= "스피츠 , 프리미티브";
									}else if(type.equals("06")){
										type= "센트하운드";
									}else if(type.equals("07")){
										type = "포인팅 독";
									}else if(type.equals("08")){
										type= "리트리버, 플러싱 독, 워터 독";
									}else if(type.equals("09")){
										type= "토이독";
									}else if(type.equals("10")){
										type= "사이트 하운드";
									}
									
									
									
								%>
								<div class="card-body bg-primary text-light">
									<p class="card-text">
										나이 : <%=pvo.getPages() %>살<br>
										견종 : <%=type%><br>
										무게 : <%=pvo.getPweight() %>kg
									</p>	
									<!-- 
									<button class="btn btn-primary" type="button" name ="pno" id="pno"  value=<%=pvo.getPno() %>>수정/삭제</button>
									 -->
								</div>
							</div>
							</div>
							<%
								if(i%2==1){
							%>
								</div>
								<br>
							<% 
								}
							%>
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