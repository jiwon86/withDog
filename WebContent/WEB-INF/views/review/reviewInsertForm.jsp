<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<style type="text/css">
	
		.star-rating {
					  display:flex;
					  flex-direction: row-reverse;
					  font-size:50px;;
					  justify-content:space-around;
					  margin:0 auto;
					  text-align:center;
					  width:5em;
					}

		.star-rating input {
		  display:none;
		}

		.star-rating label {
		  color:#ccc;
		  cursor:pointer;
		}

		.star-rating :checked ~ label {
		  color:#fc0;
		}
		
		.star-rating label:hover,
		.star-rating label:hover ~ label {
		  color:#fc0;
		}
		
		.col-lg-8{width:50%;}
		
		
		
	</style>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
				$("#subbtn").click(function(){
					
					console.log("subbtn >>> : ");
					
					$("#ReviewInsertForm").attr({
						"action":"reviewInsert.wd",
						"method":"POST",
						"enctype":"multipart/form-data"
					}).submit();
					
				})
		});
		
	</script>
	<!-- 헤드 -->
	<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
	<!-- /헤드 -->

    <body class="nav-fixed">

	

		<!-- 헤더 -->
		<%@ include file="/WEB-INF/views/fragment/header.jsp" %>
		<!-- /헤더 -->

		
        <div id="layoutSidenav">
			<!-- 사이드바 -->
			<%@ include file="/WEB-INF/views/fragment/sidebar.jsp" %>
			<!-- /사이드바 -->

			<!-- 콘텐츠 -->
            <div id="layoutSidenav_content">
				
				<main>
                    <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="layout"></i></div>
                                           	 돌봄후기 작성
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
                                            <div class="page-header-icon">
                                            	<i data-feather="file-text"></i>
                                            </div>
                                                                                                   후기작성
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <form id="ReviewInsertForm" name="ReviewInsertForm">
	                    <div class="container-fluid px-4" >
	                        <div class="row gx-4">
	                            <div class="col-lg-8" >
	                                <div class="card mb-4">
	                                    <div class="card-header">평점</div>
	                                    <div class="card-body">
	                             			<div class="star-rating">
											  <input type="radio" id="5-stars" name="rating" value="5" />
											  <label for="5-stars" class="star">&#9733;</label>
											  <input type="radio" id="4-stars" name="rating" value="4" />
											  <label for="4-stars" class="star">&#9733;</label>
											  <input type="radio" id="3-stars" name="rating" value="3" />
											  <label for="3-stars" class="star">&#9733;</label>
											  <input type="radio" id="2-stars" name="rating" value="2" />
											  <label for="2-stars" class="star">&#9733;</label>
											  <input type="radio" id="1-star" name="rating" value="1" />
											  <label for="1-star" class="star">&#9733;</label>
											</div>
	                                    </div>
	                                    <div class="card-header">후기내용</div>
	                                    <div class="card-body">
	                                    	<textarea class="lh-base form-control" type="text" placeholder="Enter your post preview text..." rows="10" ></textarea>
	                                    </div>
	                                </div>
	                                <div>
	                                	<button class="btn btn-primary" type="button" id="subbtn" name="subbtn" style="width:100%;">작성완료</button>
                                		<a href="reviewSelectAll.wd"><button class="btn btn-primary mt-2" type="button" style="width:100%;">목록보기</button></a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </form>
                </main>
				<!-- ** 주요 내용 **  -->
				
				<!-- ** /주요 내용 ** -->
				
				<!-- 바닥글 -->
				<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>