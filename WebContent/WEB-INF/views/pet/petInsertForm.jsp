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
			
			$("#Insert").click(function(){
				alert("pname >>> : " + document.petInsertForm.pname.value);
				$("#petInsertForm")
				.attr({
						"action":"petInsert.wd",
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
                    <div class="container-xl px-4 mt-4">
                        <!-- Account page navigation-->
                        <nav class="nav nav-borders">
                            <a class="nav-link" href="account-profile.html">Profile</a>
                            <a class="nav-link active ms-0" href="myPetList.wd">MyPet</a>
                            <a class="nav-link" href="account-security.html">Security</a>
                            <a class="nav-link" href="account-notifications.html">Notifications</a>
                        </nav>
                        <hr class="mt-0 mb-4" />
						  <form id="petInsertForm" name= "petInsertForm" action="petInsert.wd" method="POST" enctype="multipart/form-data">
                                                    <!-- 이름 -->
                                                   <div class="mb-3">
                                                       <label class="small mb-1" for="inputUsername">반려견 이름(최대 50자)</label>
                                                       <input class="form-control" id="pname" name="pname" type="text" placeholder="이름"/>
                                                   </div>
                                                 
                                                 <!-- 성별 -->
                                                   <div class="row gx-3">
                                                     <label class="small mb-1" for="inputUsername">성별</label>
                                                       <div class="mb-3 col-md-6">
                                                         <div class="form-check form-checked-solid">
                                                             <input class="form-check-input" id="pgender" type="radio" name="pgender" value='01'>
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
                                                           <input class="form-control" id="pages" name="pages" type="text" placeholder="나이"/>
                                                       </div>
                                                       
                                                       <div class="mb-3 col-md-6">
                                                           <label class="small mb-1" for="inputLocation">몸무게</label>
                                                           <input class="form-control" id="pweight" name="pweight" type="text" placeholder="몸무게"/>
                                                       </div>
                                                   </div>
                                                   <!-- 중성화 여부 -->
                                                   <div class="row gx-3">
                                                     <label class="small mb-1" for="inputUsername">중성화 여부</label>
                                                       <div class="mb-3 col-md-6">
                                                         <div class="form-check form-checked-solid">
                                                             <input class="form-check-input" id="pneutral" type="radio" name="pneutral" value='Y'>
                                                           <label class="form-check-label" for="flexRadioSolid1">O</label>
                                                         </div>
                                                       </div>
                                                       <div class="mb-3 col-md-6">
                                                           <div class="form-check form-checked-solid">
                                                           <input class="form-check-input" id="pneutral" type="radio" name="pneutral" value='N'>
                                                           <label class="form-check-label" for="flexRadioSolid1">X</label>
                                                       </div>
                                                       </div>
                                                       </div>
                                                   
                                                   
                                                 
                                                   <!-- 병원 -->
                                                   <div class="mb-3">
                                                       <label class="small mb-1" for="inputUsername">자주가는 병원</label>
                                                       <input class="form-control" id="phospital" name="phospital" type="text" placeholder="병원명 (있는 경우)"/>
                                                   </div>
                                                  
                                                   
                                                  <br>
                                                   <div class="mb-3">
						                              <label for="exampleFormControlSelect1">견종</label><select class="form-control" id="ptype">
						                                  <option>---견종 선택---</option>
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
						                          <div class="mb-0">
                                                   	<label for="exampleFormControlTextarea1">특이사항을 기입해주세요(1000Byte)</label>
                                                   	<textarea class="form-control" name ="pmemo" id="pmemo" rows="10">
                                                   	</textarea></div>
                                                   <!-- 반려견 사진 -->
                                                   <br>
                                                    <div class="col-xl-4">
						                                <div class="card mb-4 mb-xl-0">
						                                    <div class="card-header">반려견 사진을 업로드 해주세요</div>
						                                    <div class="card-body text-center">
						                                        <img id="mphoto" class="img-account-profile mb-2" 
						                                        	 src="" alt="프로필 사진" style="border-radius:50%; max-width:150px; max-height:150px;" />
						                                        <div class="small font-italic text-muted mb-4">이미지 용량의 제한이 있습니다.</div>
						                                          
						                                        <input class="btn btn-primary" id="pphoto" type="button" value="프로필 사진 선택">
						                                       
						                                        <input type="file" name="pphoto" id="pphoto" style="display:none;" />
						                                    </div>
						                                </div>
						                            </div>
                                                <hr class="my-4" />
                                                <div class="d-flex justify-content-between">
                                                    <button class="btn btn-light" type="button">Previous</button>
                                                    <button class="btn btn-primary" type="button" id="Insert" name="Insert" >Submit</button>
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