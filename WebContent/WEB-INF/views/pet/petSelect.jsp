<%@page import="a.b.c.com.pet.vo.PetVO"%>
<%@page import="java.util.ArrayList"%>
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
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		$(document).ready(function(){
			
			compCheck();
			
			$("#Mypet").click(function(){
<<<<<<< HEAD
				alert("mno >>>" + petSelectForm.mno.value);
=======
				//alert("mno >>>" + petSelectForm.mno.value);
>>>>>>> branch 'master' of https://github.com/jiwon86/withDog.git
				$("#petSelectForm").attr({ "method":"POST","action":"petSelectAll.wd"}).submit();
			});
			
			$("#Prev").click(function(){
<<<<<<< HEAD
				alert("mno >>>" + petSelectForm.mno.value);
=======
				//alert("mno >>>" + petSelectForm.mno.value);
>>>>>>> branch 'master' of https://github.com/jiwon86/withDog.git
				$("#petSelectForm").attr({ "method":"POST","action":"petSelectAll.wd"}).submit();
			});
			
			$("#Update").click(function(){
				//alert("pno >>>> " + petSelectForm.pno.value);
				
				$("#petSelectForm")
				.prop({
						"action":"petUpdate.wd",
					    "method":"POST",
					    "enctype":"multipart/form-data"
				       })
				.submit();
				});
			
			$("#Delete").click(function(){
				//alert("pno >>>> " + petSelectForm.pno.value);
				
				$("#petSelectForm")
				.prop({
						"action":"petDelete.wd",
					    "method":"POST",
					    "enctype":"multipart/form-data"
				       }).submit();
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
                    <%
                    	Object obj = request.getAttribute("listS");
                    	if(obj == null) return;
                    	
                    	ArrayList<PetVO> aList = (ArrayList<PetVO>)obj;
                    	int nCnt = aList.size();
                    	
                    	PetVO pvo = null;
                    	if(nCnt == 1){
                    		pvo=aList.get(0);
                    	}
                    	
                    	String pgender = pvo.getPgender();
                    	String pneutral = pvo.getPneutral();
                    	String ptype = pvo.getPtype();
                    	String pphoto = pvo.getPphoto();
                    	
                    	System.out.println("ptype >>>>> " + ptype);
                    %>
                    <script>
                    function compCheck(){
                    	console.log("compCheck >>> 진입 >>> : ");

                    	// 성별-----------------------------------------------------------
                    	var gen = '<%= pgender %>';
                    	console.log("gen >>> : "  + gen);
                    	if ('01' == gen){
                    		document.getElementsByName("pgender")[0].checked = true;
                    	}
                    	if ('02' == gen){
                    		document.getElementsByName("pgender")[1].checked = true;
                    	}	
                    	
                    	// 중성화-----------------------------------------------------------
                    	var neu = '<%= pneutral %>';
                    	console.log("neu >>> : "  + neu);
                    	
                    	if ('Y' == neu){
                    		document.getElementsByName("pneutral")[0].checked = true;
                    	}
                    	if ('N' == neu){
                    		document.getElementsByName("pneutral")[1].checked = true;
                    	}
                    	
                    	//견종-----------------------------------------------------------
                    	var type = '<%= ptype%>';
                    	console.log("type >>>> " + type);
                    	
                    	if('01'==type){
                    		document.getElementById("ptype")[1].selected = true;
                    	}else if('02'==type){
                    		document.getElementById("ptype")[2].selected = true;
                    	}else if('03'==type){
                    		document.getElementById("ptype")[3].selected = true;
                    	}else if('04'==type){
                    		document.getElementById("ptype")[4].selected = true;
                    	}else if('05'==type){
                    		document.getElementById("ptype")[5].selected = true;
                    	}else if('06'==type){
                    		document.getElementById("ptype")[6].selected = true;
                    	}else if('07'==type){
                    		document.getElementById("ptype")[7].selected = true;
                    	}else if('08'==type){
                    		document.getElementById("ptype")[8].selected = true;
                    	}else if('09'==type){
                    		document.getElementById("ptype")[9].selected = true;
                    	}else if('10'==type){
                    		document.getElementById("ptype")[10].selected = true;
                    	}else{
                    		document.getElementById("ptype")[0].selected = true;
                    	}
                    }
                    
                    
                    
                    
                    
                   
                    
                    </script>
                    <div class="container-xl px-4 mt-4">
                        <!-- Account page navigation-->
                        <nav class="nav nav-borders">
                            <a class="nav-link" href="/profile.wd">프로필정보</a>
                            <a class="nav-link active ms-0" href="#" id="Mypet">동물정보</a>
                            <a class="nav-link" href="/mypay.wd">포인트정보</a>
                            <a class="nav-link" href="myReviewList.wd">리뷰정보</a>
                        </nav>
                        <hr class="mt-0 mb-4" />
                        <form id="petSelectForm" name= "petSelectForm">
                        <div class="card-header text-primary">나의 댕댕이 수정</div>
                        <div class="card-body bg-white">
						  
                              <!-- 반려견 번호 -->
                              <input type="hidden" id="pno" name="pno" value=<%=pvo.getPno() %>>
                              <input type="hidden" id="mno" name="mno" value=<%=pvo.getMno() %>>
                              <!-- 이름 -->
                             <div class="mb-3">
                                 <label class="small mb-1" for="inputUsername">반려견 이름(최대 50자)</label>
                                 <input class="form-control" id="pname" name= "pname" type="text" placeholder="이름" value=<%=pvo.getPname() %>>
                             </div>
                               <!-- 성별 -->
                                 <div class="row gx-3">
                                   <label class="small mb-1" for="inputUsername">성별</label>
                                     <div class="mb-3 col-md-6">
                                       <div class="form-check form-checked-solid">
                                           <input class="form-check-input" id="pgender" type="radio" name="pgender" value='01' value="checked">
                                         <label class="form-check-label" for="flexRadioSolid1">♂</label>
                                       </div>
                                     </div>
                                     <div class="mb-3 col-md-6">
                                         <div class="form-check form-checked-solid">
                                         <input class="form-check-input" id="pgender" type="radio" name="pgender" value='02'>
                                         <label class="form-check-label" for="flexRadioSolid1">♀</label>
                                     </div>
                                     </div>
                                 </div>
                                 
                                  <!-- 나이 & 몸무게 -->
                                 <div class="row gx-3">
                                     <div class="mb-3 col-md-6">
                                         <label class="small mb-1" for="inputOrgName">나이</label>
                                         <input class="form-control" id="pages" name="pages" type="text" placeholder="나이" value= <%=pvo.getPages() %>>
                                     </div>
                                     
                                     <div class="mb-3 col-md-6">
                                         <label class="small mb-1" for="inputLocation">몸무게</label>
                                         <input class="form-control" id="pweight" name="pweight" type="text" placeholder="몸무게" value= <%=pvo.getPweight() %>>
                                     </div>
                                 </div>
                                 <!-- 중성화 여부 -->
                                 <div class="row gx-3">
                                   <label class="small mb-1" for="inputUsername">중성화 여부</label>
                                     <div class="mb-3 col-md-6">
                                       <div class="form-check form-checked-solid">
                                           <input class="form-check-input" id="pneutral" name="pneutral"type="radio" value='Y'>
                                         <label class="form-check-label" for="flexRadioSolid1">O</label>
                                       </div>
                                     </div>
                                     <div class="mb-3 col-md-6">
                                         <div class="form-check form-checked-solid">
                                         <input class="form-check-input" id="pneutral" name="pneutral" type="radio" value='N'>
                                         <label class="form-check-label" for="flexRadioSolid1">X</label>
                                     </div>
                                     </div>
                                     </div>
                                                   
                                                 
                                    <!-- 병원 -->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputUsername">자주가는 병원</label>
                                        <input class="form-control" id="phospital" name="phospital" type="text" placeholder="병원명 (있는 경우)" value=<%=pvo.getPhospital() %>>
                                    </div>
                                   <br>
                             	  <!-- 견종 -->
                                	<div class="mb-3">
                            		 <label for="exampleFormControlSelect1">견종</label>
                            		 	<select class="form-control text-xs" id="ptype" name="ptype">
			                                 <option value="00">---견종 선택---</option>
			                                 <option value="01">쉽독 , 캐틀독</option>
			                                 <option value="02">핀셔,슈나우저-몰로세르 견종-스위스 마운틴 독,캐틀 독</option>
			                                 <option value="03">테리어</option>
			                                 <option value="04">닥스훈트</option>
			                                 <option value="05">스피츠 , 프리미티브 타입</option>
			                                 <option value="06">센트하운드 , 관련 견종</option>
			                                 <option value="07">포인팅 독</option>
			                                 <option value="08">리트리버, 플러싱 독, 워터 독</option>
			                                 <option value="09">반려견 및 토이독</option>
			                                 <option value="10">사이트 하운드</option>
	                           	  		</select>
                         		</div>
                         		<br>
                         		<!-- 특이사항 -->
                         		<div class="mb-0">
                                            	<label for="exampleFormControlTextarea1">특이사항을 기입해주세요(1000Byte)</label>
                                            		<textarea class="form-control" id="pmemo" name="pmemo" rows="10" ><%=pvo.getPmemo() %></textarea>
                               </div>
                               </div>             
                                     
                                <!-- 반려견 사진 -->
                               <br>
                               <div class="col-xl-4">
	                               <div class="card mb-4 mb-xl-0">
    	                               <div class="card-header">반려견 사진을 업로드 해주세요</div>
        	                           <div class="card-body text-center bg-white">
        	                           		<% if(pphoto != null) { %>
			                                 	<img id="pphoto" src="/WithDog/img/pet/<%=pvo.getPphoto()%>" alt="댕댕이 사진" 
			                                 	  />
			                               	
			                               	<% } else { %>
			                               		<img id="pphoto" src="/WithDog/img/pet/default.jpg" alt="댕댕이 사진" 
			                                 	 />
			                               	<% } %>
                    	                   <div class="small font-italic text-muted mb-4">이미지 용량의 제한이 있습니다.</div>
                                         	<!-- 
                        	               <input class="btn btn-primary" type="button" value="프로필 사진 선택">
                        	                -->
                                       <input class="btn btn-primary" type="file" name="newpphoto" id="newpphoto" value="<%=pvo.getPphoto()%>" />
                                   </div>
                               </div>
                           </div>
                           <!-- 버튼 -->
                            <hr class="my-4" />
                            <div class="d-flex justify-content-between">
                                <button class="btn btn-light" type="button" id="Prev" name="Prev">목록</button>
                                <button class="btn btn-primary" type="button" id="Update" name="Update" >수정</button>
                                <button class="btn btn-red" type="button" id="Delete" name="Delete" >삭제</button>
                            </div>
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
				
				<!-- ** /주요 내용 ** -->
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>