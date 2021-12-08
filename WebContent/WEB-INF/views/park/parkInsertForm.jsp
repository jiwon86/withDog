<%@page import="a.b.c.com.park.vo.ParkVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
	<jsp:include page="/head.wd" />
	<!-- /헤드 -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){ 
		$("#puppy").click(function() {
		      $("#iupload").click();
		});

		$(document).on("click","#upload",function(){
			console.log("upload >>> : ");
			$('#parkinsertform').attr({
				'action':'parkInsert.wd',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
		
		$("#iupload").change(function(){
			//alert("change");
			readURL(this);
		});

	});
	

	
	function readURL(input) {
		alert("readurl");
		if(input.value == "") {
			//alert("사진을 업로드 하세요");
			return;
		} else {
			alert("readurl2");
			var reader = new FileReader();
			reader.onload = function(e) {
				//alert("readurl2"+e.target.result);
				$("#iupload1").attr("src", e.target.result);
			}
		}
		
		if(input.files[0] != null) {
			console.log("input.files[0] : OK");
			reader.readAsDataURL(input.files[0]);
		}
	}

</script>
	<head>
	<meta charset="UTF-8">
	<title>업로드성공</title>
	</head>
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
				<main style="width:960px; margin:0 auto;">

				<div style="width:760px; margin:0 auto;">
					
					</div>

					<!-- 사진업로드 버튼성공(테이블만들기) -->
					
				</main>
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 

					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->

                <div class="card-body" style="width:760px; margin:0 auto;">
                <div style="width:760px; margin:0 auto;">
                <h2 class="mt-4">댕댕스타그램</h2>
                    <!-- Registration form-->
                    <form name="parkinsertform" id="parkinsertform">
                        <!-- Form Row-->
				         
                                <!-- 회원사진-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputFirstName">
                                    	<img src="/img/member/<sec:authentication property="principal.member.mphoto"/>" style="border-radius:50%; max-width:50px; max-height:50px;"/>
                                   		<input type="hidden" name="iphoto" id="iphoto" value="<sec:authentication property="principal.member.mphoto"/>">
                                    </label>
                                	<!-- 회원 아이디-->
                                    <label class="small mb-1" for="inputLastName">
                                  		<sec:authentication property="principal.username"/>
                                    </label>
                                    <input class="form-control" id="iid" name="iid" type="hidden" placeholder="회원아이디" value="<sec:authentication property="principal.username"/>">
                                </div>
                           
                        <!-- Form Row    -->
                        <div class="row gx-3">
                            <div class="col-md-6">
                                <!-- 댕댕이 사진-->
                                <div class="mb-3">
                                		<input class="btn btn-warning mb-1" id="puppy" type="button" value="댕댕이 사진선택"><br>
                                    	<img id="iupload1" class="img-account-profile mb-3 mt-3" 
                                      	 src="/img/park/default.jpg" alt="사진을 꼭 선택해 주세요" 
                                      	 style="max-width:300px; max-height:300px;" />
                                		<input type="file" id="iupload" name="iupload" style="display:none;" />
                                </div>
                            </div>
                        </div>
                            <div class="col-md-6">
                                <!-- 내용-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputConfirmPassword">내용</label>
                                    <input class="form-control" id="icontent" name="icontent" type="text" placeholder="댕댕이 자랑해주세요">
                                </div>
                            </div>
                        <input class="btn btn-warning mt-2" id="upload" type="button" value="업로드 완성하기">
                    </form>

                </div>
            	</div>
				<!-- ** /주요 내용 ** -->
				 <!-- url붙여서 댓글 가져오기 -->

				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>
