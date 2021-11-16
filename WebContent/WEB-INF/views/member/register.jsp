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
<!-- /헤드 -->

<body class="nav-fixed">

<!-- 헤더 -->
<jsp:include page="/header.wd" />
<!-- /헤더 -->


<div id="layoutSidenav">
<!-- 사이드바 -->
<jsp:include page="/sidebar.wd" />
<!-- /사이드바 -->
<style>
.col-md-6 {
	width: 300px !important;
}
.mb-3{
width: 300px !important;
}

#idcheck.btn.btn.btn-primary{
	position:absolute !important;
	top:46% !important;
	left:38% !important;
}
#passcheck.form-control.form-control-solid{
	margin-left: 8px;
}
#pwcheck.btn.btn.btn-primary{
	position: absolute !important;
	top:57.5% !important;
	left:71.5% !important;
}
</style>

<!-- 콘텐츠 -->
<div id="layoutSidenav_content">

  
	<main width="1000px">
                <div class="container-xl px-4">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-9">
                            <!-- Social registration form-->



			<div class="card my-5" width="500px">
                    <div class="card-body p-5 text-center">
                        <div class="h3 fw-light mb-3">Create an Account</div>
                        <div class="small text-muted mb-2">Sign in using...</div>
                        <!-- Social registration links-->
        <a class="btn btn-icon btn-facebook mx-1" href="#!"><i class="fab fa-facebook-f fa-fw fa-sm"></i></a>
        <a class="btn btn-icon btn-github mx-1" href="#!"><i class="fab fa-github fa-fw fa-sm"></i></a>
        <a class="btn btn-icon btn-google mx-1" href="#!"><i class="fab fa-google fa-fw fa-sm"></i></a>
        <a class="btn btn-icon btn-twitter mx-1" href="#!"><i class="fab fa-twitter fa-fw fa-sm text-white"></i></a>
    </div>
    <hr class="my-0" />
    <div class="card-body p-5">
        <!-- Login form-->
        <form>
            <!-- Form Row-->
            <div class="row gx-3">
                <div class="col-md-6">
                    <!-- Form Group (first name)-->
                    <div class="mb-3">
                        <label class="text-gray-600 small" for="firstNameExample">Your Name</label>
                        <input class="form-control form-control-solid" type="text" placeholder="이름을 입력해 주세요" aria-label="First Name" aria-describedby="firstNameExample" required />
                    <!-- Form Group (last name)-->
                         <label class="text-gray-600 small" for="lastNameExample">Your Id</label>
                        <input class="form-control form-control-solid" type="text" placeholder="Id를 입력해 주세요" aria-label="Last Name" aria-describedby="lastNameExample" required>
                    <!-- 중복확인 버튼 -->
                    </div>
                </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                          <a class="btn btn-primary" href="auth-login-social.html" id="idcheck" name="idcheck">Id Check</a>
                    </div>
                </div>
                
            </div>
            <!-- Form Group (email address)-->
            
            <!-- Form Row-->
            <div class="row gx-3">
                <div class="col-md-6">
                    <!-- Form Group (choose password)-->
                    <div class="mb-3">
                        <label class="text-gray-600 small" for="passwordExample">Password</label>
                        <input class="form-control form-control-solid" type="password" placeholder="Password를 입력해 주세요" aria-label="Password" aria-describedby="passwordExample" required />
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Form Group (confirm password)-->
                    <div class="mb-3">
                        <label class="text-gray-600 small" for="confirmPasswordExample">Confirm Password</label>
  <input class="form-control form-control-solid" type="password" placeholder="Password를 입력해 주세요" aria-label="Confirm Password" aria-describedby="confirmPasswordExample" id="passcheck" required />
   <a class="btn btn-primary" href="auth-login-social.html" id="pwcheck" name="pwcheck">Pw Check</a>
                    </div>
                </div>
                <div class="mb-3">
                <label class="text-gray-600 small" for="emailExample">Email Address</label>
                <input class="form-control form-control-solid" type="text" placeholder="Email을 입력해 주세요" aria-label="Email Address" aria-describedby="emailExample" required/>
            </div>
            </div>
             <div class="mb-3">
                <label class="text-gray-600 small" for="emailExample">Date of Birth</label>
                <input class="form-control form-control-solid" type="text" placeholder="Ex)1993.05.08" aria-label="Birth Address" aria-describedby="birthExample" required/>
            </div>
            <div class="mb-3">
                <label class="text-gray-600 small" for="emailExample">우편번호</label>
                <input class="form-control form-control-solid" type="text" placeholder="Ex)10052" aria-label="Address" aria-describedby="addressExample" required/>
            </div>
            <button class="btn btn-primary" type="button">Upload new image</button>
            <!-- Form Group (form submission)-->
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="form-check">
                                                <input class="form-check-input" id="checkTerms" type="checkbox" value="" />
                                                <label class="form-check-label" for="checkTerms">
                                                    I accept the
                                                    <a href="#!">terms &amp; conditions</a>
                                                    .
                                                </label>
                                            </div>
                                            <a class="btn btn-primary" href="auth-login-social.html">Create Account</a>
                                        </div>
                                    </form>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body px-5 py-4">
                                    <div class="small text-center">
                                        Have an account?
                                        <a href="auth-login-social.html">Sign in!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

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