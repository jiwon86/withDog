<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
   jsp:include : 내 서버내의 jsp파일만 가능
   c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<html lang="ko">
<!-- 헤드 -->
<jsp:include page="/head.wd" />
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
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                <!-- Social forgot password form-->
                                <div class="card my-5">
                                    <div class="card-body p-5 text-center"><div class="h3 fw-light mb-0">Password Recovery</div></div>
                                    <hr class="my-0" />
                                    <div class="card-body p-5">
                                        <div class="text-center small text-muted mb-4">인증이 완료 되었습니다 바꾸실 비밀번호를 입력해 주세요.</div>
                                        <!-- Forgot password form-->
                                        <form action="pwupdate.wd" method="post";>
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                                <label class="text-gray-600 small" for="Examplepw">비밀번호</label>
                                                <input class="form-control form-control-solid" type="text" name="mpw" placeholder="비밀번호를 입력해 주세요(6~12자)" 
                                                aria-label="Email Address" aria-describedby="Examplepw" required minlength="6" maxlength="12"/><br>
                                                
                                                <label class="text-gray-600 small" for="Examplepw1">비밀번호 확인</label>
                                                <input class="form-control form-control-solid" type="text" placeholder="비밀번호를 입력해 주세요(6~12자)" 
                                                aria-label="Email Address" aria-describedby="Examplepw1" required minlength="6" maxlength="12"/><br>
                                                
                                            </div>
                                            <%
                                            	Object memail = (Object)request.getAttribute("memail");
                                                System.out.println("pw update dmemail의 값 >>> : " + memail);
                                            %>
                                            <!-- Form Group (reset password button)    -->
                                            <input type="hidden" name="memail" value=<%=memail %>>
                                            <input type="submit" class="btn btn-primary" value="Reset Password"></a>
                                        </form>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body px-5 py-4">
                                        <div class="small text-center">
                                            비밀번호가 생각 나셨나요??
                                            <a href="register.wd">메인페이지로 돌아가기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
			<!--  
               ===================================
               <main> 내용 </main> 부분을 복사해서 
<<<<<<< HEAD
               TEST


               Test1
=======


>>>>>>> branch 'master' of https://github.com/jiwon86/withDog
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