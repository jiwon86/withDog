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
                            <div class="col-lg-5">
                                <!-- Basic forgot password form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="fw-light my-4">비밀번호 찾기</h3></div>
                                    <div class="card-body">
                                        <div class="small mb-3 text-muted">회원가입 당시 이름과 이메일을 입력해 주세요</div>
                                        <!-- Forgot password form-->
                                        <form action="pw_auth.wd" method="post">
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailName">이름 </label>
                                                <input class="form-control" id="inputEmailName" type="text" name="mname" placeholder="가입 당시 입력한 이름을 입력해주세요" /><br>
                                                <label class="small mb-1" for="inputEmailAddress">이메일</label>
                                                <input class="form-control" id="inputEmailAddress" type="email" name="memail" aria-describedby="emailHelp" placeholder="가입 당시 입력한 이름을 입력해주세요" />
                                            </div>
                                            <!-- Form Group (submit options)-->
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="login.wd">로그인으로 돌아가기</a>
                                                <input type="submit" class="btn btn-withcolor" value="비밀번호찾기"></a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="register.wd">회원가입</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
			<!--  
               ===================================
               <main> 내용 </main> 부분을 복사해서 
               TEST


               Test1


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