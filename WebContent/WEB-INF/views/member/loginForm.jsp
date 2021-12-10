<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
	<head>
	<style>
	.headerdog {
		position : realtive;
		width : 100%;
		height : 300px;
	}
	</style>
	</head>
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
				
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 
					
					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
                <main>
                <br>
                <br>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                <!-- Social login form-->
                                <div class="card my-5">
                                    <div class="card-body p-5 text-center border-bottom-0 bg-withcolor">
                                    	<img src="/image/header/withdog_log.png" class="headerdog">
                                        <div class="h3 fw-light mb-1">
                                        <!-- 
                                        	<div style="font-weight:bold; color:#b43f3f;">WITH DOG</div> 
                                        	<div class="mt-2" style="font-weight:bold; color:white;">로그인</div>
                                         -->
                                        </div>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body p-5 a">
                                        <!-- Login form-->
                                        <form method="post" action="/login">
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                                <label class="text-gray-600 small" for="usernameExample">아이디</label>
                                                <input class="form-control form-control-solid" type="text" name="username" 
                                                	   placeholder="아이디 입력" aria-label="username" aria-describedby="usernameExample" />
                                            </div>
                                            <!-- Form Group (password)-->
                                            <div class="mb-3">
                                                <label class="text-gray-600 small" for="passwordExample">비밀번호</label>
                                                <input class="form-control form-control-solid" type="password" name="password" 
                                                       placeholder="비밀번호 입력" aria-label="Password" aria-describedby="passwordExample" />
                                            </div>
                                            <!-- Form Group (forgot password link)-->
                                            <div class="mb-3"><a class="small" href="PwFinding.wd">비밀번호 찾기</a> / <a class="small" href="register.wd">회원가입</a></div>
                                            <!-- Form Group (login box)-->
                                            <div class="d-flex align-items-center justify-content-between mb-0">
                                                <div class="form-check">
                                                </div>
                                                <input type="submit" class="btn btn-withcolor" value="로그인">
                                            </div>
                                            
                                            <sec:csrfInput/>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        
                                	</div>
                            </div>
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