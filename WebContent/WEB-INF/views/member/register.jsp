<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%-- 
   jsp:include : 내 서버내의 jsp파일만 가능
   c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>

<html lang="ko">
   <!-- 헤드 -->
   <head>
   		<style>
			.headerdog  {
				position : absolute;
				width : 20%;
				height : 250px;
				left : 70%
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
<style>
.col-md-6 {
   width: 300px !important;
}
.mb-3{
width: 300px !important;
}

#idcheck.btn.btn.btn-withcolor{
   position:absolute !important;
   top:30% !important;
   left:38% !important;
}
#passcheck.form-control.form-control-solid{
   margin-left: 8px;
}
#pwcheck.btn.btn.btn-withcolor{
   position: absolute !important;
   top:38.7% !important;
   left:71.5% !important;
}
#addfinde.btn.btn-withcolor{
   position: absolute !important;
   top: 62.8% !important;
   left:38% !important;
}
#mroadaddress.form-control.form-control-solid{
/* margin-bottom:100px !important; */
   position: absolute !important;
   top:68% !important;
   width:500px !important;
}
#detailroad.form-control.form-control-solid{
   position:absolute !important;
   top:72.35% !important;
   width:500px !important;
}
#mjibunaddress.form-control.form-control-solid{
   position: absolute !important;
   top:76.70% !important;
   width:500px !important;
}

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script> 
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<script type="text/javascript">

$(document).ready(function(){
   
   let idCheck = false;
   
   /* $(document).ready(function(){
      $("#submitbtn").click(function(){
         "action":"login1.wd"
         ,"method":"POST"
         ,"enctype":"multipart/form-data";
         
      }) */
      
   
   $("#addfinde").click(function(){
      console.log("zonecode >>> : ");
      new daum.Postcode({
         oncomplete: function(data) {
             $("#mzonecode").val(data.zonecode); //5자리 새우편번호 사용
             $("#mroadaddress").val(data.roadAddress); //도로명 주소
             $("#mjibunaddress").val(data.jibunAddress); //지번주소         
         }
      }).open();
   });
      
   /*  
   var vm = new Vue({
      el:"#show",
      data:{
         num01:null,
         num02:null
      },
      methods:{
         sum:function(){
            const same = "비밀번호가 같습니다";
            const wrong = "!!비밀번호가 다릅니다!! ";
            
            console.log("## 합산 함수 호출 ##");
            var num1= Number(this.num01);
            var num2= Number(this.num02);
            if(num1==num2){
               return same;
            }
            else{
            }
            return wrong;
         }
      }
   });
    */
    
   $(document).on("click", "#idcheck", function(){
      alert("checkbtn >>> : ");

      let idCheckURL = "memIdCheck.wd";
      /* let reqType = "POST"; */
      let dataParam = { mid: $("#mid").val(), };
      
      $.ajax({
         url: idCheckURL,
         /* type: reqType,    */                     
         data: dataParam,               
         success: whenSuccess,
         error: whenError
      });
      
      function whenSuccess(resData){   
         if ("ID_YES" == resData){
            alert("사용 가능한 아이디 입니다");                                       
            $("#mid").attr("readonly", true);
            $("#mpw").focus();   
            idCheck = true;
         }else if ("ID_NO" == resData){
            alert("이미 아이디 사용중 인 아이디 입니다.");
            $("#mid").val('');
            $("#mid").focus();
         };            
      }
      function whenError(e){
         alert("e >>> : " + e.responseText);
      }
   });
   
   $("#btnMphoto").click(function() {
      $("#inputImage").click();
   })
   
   
   if(idCheck == true) {
      // submit
   } else {
      // 안된다고 얼럿창
   
   }
});

   
   function isSame() {
       var pw = $("#pass").val();
       var confirmPW = $("#passcheck").val();
       
       if(pw !='' && confirmPW !='') {
           if(pw == confirmPW) {
               $('#passcheck').css({"border":"2px solid #0061f2"});
               $('#pass').css({"border":"2px solid #0061f2"});
           }
           else {
               $('#passcheck').css({"border":"2px solid #ff2221"});
               $('#pass').css({"border":"2px solid #ff2221"});
           }
       }
   }

</script>

<!-- 콘텐츠 -->
<div id="layoutSidenav_content">

  
   <main width="1000px">
                <div class="container-xl px-4">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-9">
                            <!-- Social registration form-->



<div class="card my-5">
     <header class="page-header page-header-light bg-withcolor pb-10">
		<div class="container-xl px-4">
			<div class="page-header-content pt-4">
				<img src="/image/header/header_dog_12.png" class="headerdog">
					<div class="row align-items-center justify-content-between">
						<div class="col-auto mt-4">
							<h1 class="page-header-title">
								<div class="page-header-icon"><i data-feather="user"></i></div>
										회원가입
									</h1>
						<div class="page-header-subtitle">With Dog</div>
					</div>
				</div>
			</div>
		</div>
	</header>
<div class="container-xl px-4 mt-n10">	
    <div class="card-body p-5">
        <!-- Login form-->
        <form enctype="multipart/form-data" method="POST" action="login1.wd">
            <!-- Form Row-->
            <div class="row gx-3">
                <div class="col-md-6">
                    <!-- Form Group (first name)-->
                    <div class="mb-3">
                        <label class="text-gray-600 small" for="firstNameExample">Your Name</label>
                        <input class="form-control form-control-solid" type="text" placeholder="이름을 입력해 주세요" 
                        aria-label="First Name" aria-describedby="firstNameExample" name="mname" required />
                    <!-- Form Group (last name)-->
                         <label class="text-gray-600 small" for="lastNameExample">Your Id</label>
                        <input class="form-control form-control-solid" type="text" placeholder="Id를 입력해 주세요" 
                        aria-label="Last Name" aria-describedby="lastNameExample" name="mid" id="mid" required>
                    <!-- 중복확인 버튼 -->
                    </div>
                </div>
                  <div class="col-md-6" style="position:relative;">
                    <div class="mb-3" style="position:absolute;left:-100px;top:92px;">
                          <a class="btn btn-withcolor" id="idcheck" name="idcheck">중복 확인</a>
                    </div>
                </div>
            </div>
            <!-- Form Group (email address)-->
            
            <!-- Form Row-->
            <div class="row gx-3" id="show">
                <div class="col-md-6">
                    <!-- Form Group (choose password)-->
                    <div class="mb-3">
                        <label class="text-gray-600 small" for="passwordExample">Password</label>
                        <input class="form-control form-control-solid" type="password" placeholder="Password를 입력해 주세요" 
                        aria-label="Password" aria-describedby="passwordExample" name="mpw" id="pass" onchange="isSame()"
                        v-model="num01" required />
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Form Group (confirm password)-->
                    <div class="mb-3">
                        <label class="text-gray-600 small" for="confirmPasswordExample">Confirm Password</label>
                 <input class="form-control form-control-solid" type="password" placeholder="Password를 입력해 주세요" 
                 aria-label="Confirm Password" aria-describedby="confirmPasswordExample" id="passcheck" onchange="isSame()"
                 v-model="num02" required />
                 
                  <!-- <a class="btn btn-primary" href="auth-login-social.html" id="pwcheck" name="pwcheck">Pw Check</a> -->
                    </div>
                </div>
                
                <div class="mb-3">
                <label class="text-gray-600 small" for="emailExample">Email Address</label>
                <input class="form-control form-control-solid" type="text" placeholder="Email을 입력해 주세요" 
                aria-label="Email Address" aria-describedby="emailExample" name="memail" required/>
            </div>
            </div>
             <div class="mb-3">
                <label class="text-gray-600 small" for="emailExample">Date of Birth</label>
                <input class="form-control form-control-solid" style="line-height:18px;" type="date" placeholder="Ex)1993.05.08" 
                aria-label="Birth Address" aria-describedby="birthExample" name="mbirth" required/>
            </div>
            <div class="mb-3">
                <label class="text-gray-600 small" for="emailExample">우편번호</label>
                <input class="form-control form-control-solid" type="text" placeholder="Ex)10052" aria-label="Address" 
                aria-describedby="addressExample" name="mzonecode" id="mzonecode" required readonly/>
            </div>
            <!--  우편번호 찾기 버튼 -->
            <div style="position:relative;">
               <div style="position:absolute;left:305px;top:-60px;">
                  <button class="btn btn-withcolor" style="width:180px;" type="button" id="addfinde" name="addfind">우편번호 찾기</button>
               </div>
            </div>
            <div class="mb-3">
                <label class="text-gray-600 small" for="emailExample"></label>
                <input class="form-control form-control-solid" type="text" placeholder="도로명주소" 
                aria-label="Address" aria-describedby="addressExample" id="mroadaddress" name="mroadaddress" required/>
            </div>
             <div class="mb-3">
                <label class="text-gray-600 small" for="emailExample"></label>
                <input class="form-control form-control-solid" type="text" placeholder="도로명 상세주소" 
                aria-label="Address" aria-describedby="addressExample" id="detailroad" name="detailroad" required/>
            </div>
        <div class="mb-3">
                <label class="text-gray-600 small" for="emailExample"></label>
                <input class="form-control form-control-solid" type="text" placeholder="지번 주소" 
                aria-label="Address" aria-describedby="addressExample" id="mjibunaddress" name="mjibunaddress" required/>
            </div>
            <br>
            
            <input class="btn btn-withcolor" id="btnMphoto" type="button" value="프로필 사진 선택">
                                          
             <input type="file" name="mphoto" id="inputImage" style="display:none;" />
            <!-- Form Group (form submission)-->
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="form-check">
                                                <input class="form-check-input" id="checkTerms" type="checkbox" value="" />
                                                <label class="form-check-label" for="checkTerms">
                                                  	 이용약관 동의
                                                    <a href="#!">이용약관 상세보기</a>
                                                    .
                                                </label>
                                            </div>
                                            <input type="submit" class="btn btn-withcolor" value="회원 가입" name="submitbtn" id="submitbtn">
                                        </div>
                                        <sec:csrfInput/>
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