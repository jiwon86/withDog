<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="a.b.c.com.review.vo.ReviewVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<style>
	
		/*.str{background:url('/image/review/star.png');width:500px;height:500px;}*/
		
		.strcon {
					  margin:0 auto;
					  display:flex;
					  flex-direction: row-reverse;
					  font-size:70px;
					  justify-content:space-around;
					  
					  text-align:center;
					  width:60%;
					}
					
		.strcon input {
						  display:none;
						}
		
		.strcon label {
						  color:#ccc;
						  cursor:pointer;
						}
		
		.strcon :checked ~ label {
									  color:#fc0;
									}
									
		.strcon label:hover,
		.strcon label:hover ~ label {
										  color:#fc0;
										}



		article {
				  background-color:#ffe;
				  
				  color:#006;
				  margin:10px;
				  max-width:100%;
				  padding:10px;
				}
	
	</style>

		
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){ 
		
		$("#subbtn").click(function(){
			if(!review_Form())
				return;
			
			console.log("subbtn >>> : ");								
			$('#ReviewInsertForm').attr({
				'action':'reviewInsert.wd',
				'method':'POST',
			}).submit();
		});
		
		$("#crreport").change(function(){
			
			if($("#crreport").is(":checked")){
				
				alert("신고가 접수 됐습니다.")
				
			}else{
				
				alert("신고를 철회합니다.")
				
			}

		});
		 
	});
	
	function YnCheck(obj){
		
		var checked = obj.checked;
		if(checked){
			obj.value="Y";
		}else{
			obj.value="N";
		}
	};
	
	function review_Form(){

		if($("#crsubject").val()==""){
			alert('제목을 입력해주세요.');
			return false;
		}
		if($("#mid").val()==""){
			alert('돌봄이를 입력해주세요.');
			return false;
		}
		if($("#rwriter").val()==""){
			alert('작성자를 입력해주세요.');
			return false;
		}
		
		if( ! $("input[name='crscore']:checked").val()){
			alert('평점을 입력해주세요.');
			return false;
		}
        if($("#crmemo").val()==""){
            alert('내용을 입력해주세요');
            return false;
         }

		return true;
	};
	
	</script>
	
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
				
				<main style="margin:0 auto; width:960px;background:#fff;">
                    <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4" >
                                        <h1 class="page-header-title" >
                                            <div class="page-header-icon"><i data-feather="layout"></i></div> 돌봄후기 작성
                                        </h1>
                                        <div class="page-header-subtitle ms-5" >소중한 반려동물을 위해 돌봄의 후기를 작성해보세요</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                   <main>
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="file-text"></i></div>후기작성
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                   
                    <div class="container-fluid px-4" >
                        <div class="row gx-4">
                            <div class="col-lg-8" style="margin:0 auto;">
                            <form id="ReviewInsertForm" name="ReviewInsertForm">
                                <div class="card mb-4" >
                                	<input type="hidden" id="crnum" name="crnum" />
                                    <div class="card-header">제목</div>
                                    <div class="card-body">
                             			<input type="text" id="crsubject" name="crsubject" class="lh-base form-control" placeholder="제목을 입력하세요" style="width:100%"/>
                                    </div>
                                    <div class="card-header">돌봄이</div>
                                    <div class="card-body">
                             			<input type="text" id="mid" name="mid" class="lh-base form-control" style="width:100%"  placeholder="아이디를 입력해주세요"/>
                                    </div>
                                    <div class="card-header">작성자</div>
                                    <div class="card-body">
                             			<input type="text" id="rwriter" name="rwriter" class="lh-base form-control" style="width:100%"  placeholder="작성자를 입력해주세요"/>
                                    </div>
                                    <div class="card-header">평점</div>
                                    <div class="form-control">
                                    <div class="strcon">
									  <input type="radio" id="5-stars" name="crscore" value="5" />
									  <label for="5-stars" class="star">&#9733;</label>
									  <input type="radio" id="4-stars" name="crscore" value="4" />
									  <label for="4-stars" class="star">&#9733;</label>
									  <input type="radio" id="3-stars" name="crscore" value="3" />
									  <label for="3-stars" class="star">&#9733;</label>
									  <input type="radio" id="2-stars" name="crscore" value="2" />
									  <label for="2-stars" class="star">&#9733;</label>
									  <input type="radio" id="1-star" name="crscore" value="1" />
									  <label for="1-star" class="star">&#9733;</label>
									</div>
									</div>
                                    <div class="card-header">후기내용</div>
                                    <div class="card-body">
                                    	<textarea class="lh-base form-control" type="text" name="crmemo" id="crmemo" placeholder="후기를 입력해주세요" rows="10" ></textarea>
                                    </div>
                                    <div class="card-body">
                                    	<div style="margin-top:-25px;">
                                    		<span style="float:right;">신고하기</span>
                                    		<input type="checkbox" name="crreport" id="crreport" onchange="YnCheck(this);" style="float:right;margin-top:3px;margin-right:5px;width:15px;height:15px;">
                                    	</div>
                                    </div>
                                </div>
                                <div>
                                	<button class="btn btn-primary" type="submit" id="subbtn" name="subbtn" style="width:100%;">작성완료</button>
                                </div>
                                </form>
                                <a href="reviewSelectAll.wd"><button class="btn btn-primary mt-2" type="button" style="width:100%;">목록보기</button></a>
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