<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="a.b.c.com.review.vo.ReviewVO" %>

<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
	<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
	
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		Object obj = request.getAttribute("listS");
		List<ReviewVO> list = (List)obj;
		System.out.println("list >>> " + list);
		ReviewVO rvo = null;
		if (list.size() == 1) {
			rvo = list.get(0);
		};
	%>
	<% request.setCharacterEncoding("UTF-8"); 
		String mid = (String)request.getAttribute("mid");
		System.out.println(mid);
	%>
	<style>
	
	/*.str{background:url('/image/review/star.png');width:500px;height:500px;}*/
		
		.strcon {
					  margin:0 auto;
					  display:flex;
					  flex-direction: row-reverse;
					  font-size:70px;
					  justify-content:space-around;
					  
					  text-align:center;
					  width:50%;
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
	
	.brs{border-bottom:1px solid #d3d3d3;}
	.brsr{border-right:1px solid #d3d3d3;}
	
	.star1{color:#fc0;line-height:5px}
	
	</style>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
		
		// 별점 체크 유지
		var starCount = <%=rvo.getCrscore()%>;
		$(`#${"${starCount}"}-stars`).prop("checked", true);
			
			
		// 업데이트 부분
		$("#U").click(function(){
			
			if(!review_Form())
				return;
			
			alert('후기 수정이 완료 됐습니다.');
			console.log("subbtn >>> : ");	
			
			$("#RevieList").attr({
				"method":"GET",
				"action":"reviewUpdate_1.wd"
			}).submit();
			
		});
			
		});
		
		function review_Form(){

			if( ! $("input[name='crscore']:checked").val()){
				alert('수정할 평점을 입력해주세요.');
				return false;
			}
	        if($("#crmemo").val()==""){
	            alert('수정할 내용을 입력해주세요');
	            return false;
	         }

			return true;
		}
	
	</script>
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
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title"><div class="page-header-icon"><i data-feather="filter"></i></div>후기 게시판</h1>
                                        <div class="page-header-subtitle">소중한 반려동물을 위해 후기를 작성해보세요</div>
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
                                            <div class="page-header-icon"><i data-feather="file-text"></i>후기내용</div>
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
                            <form name="RevieList" id="RevieList">
                                <div class="card mb-4" >
                                	<input type="hidden" id="crnum" name="crnum" value=<%=rvo.getCrnum() %> />
                                	<input type="hidden" id="cnum" name="cnum"/>
                                	<input type="hidden" id="mno" name="mno" value="" disabled/>
                                    <div class="card-header">제목</div>
                                    <div class="card-body">
                             			<input class="lh-base form-control" style="background:#fff;" value="<%=rvo.getCrsubject() %>" />
                                    </div>
                                    <div class="card-header">돌봄이</div>
                                    <div class="card-body">
                             			<input class="lh-base form-control" id="mid" name="mid" value="<%=rvo.getMid() %>" disabled/>
                                    </div>
                                    <div class="card-header">작성자</div>
                                    <div class="card-body">
                             			<input type="text" id="rwriter" name="rwriter" class="lh-base form-control" style="width:100%" value="<%=rvo.getRwriter() %>" />
                                    </div>
                                    <div class="card-header">평점</div>
                                    <div class="strcon">
                                    <!-- <span class="str"></span> -->
									  <input type="radio" class="5-stars" name="crscore" value="5" />
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
                                    <div class="card-header">후기내용</div>
                                    <div class="card-body">
                                    	<textarea class="lh-base form-control" type="text" name="crmemo" id="crmemo" rows="10" ><%=rvo.getCrmemo() %></textarea>
                                    </div>
                                    <!-- 
                                    <div class="card-body">
                                    	<div style="margin-top:-25px;">
                                    		<span style="float:right;">신고하기</span>
                                    		<input type="checkbox" value="신고하기" name="crreport" id="crreport" style="float:right;margin-top:3px;margin-right:5px;width:15px;height:15px;">
                                    	</div>
                                    </div>
                                     -->
                                </div>
                                <div>
                                	<button class="btn btn-primary" type="submit" id="U" style="width:100%;float:left;">수정하기</button>
                                	
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