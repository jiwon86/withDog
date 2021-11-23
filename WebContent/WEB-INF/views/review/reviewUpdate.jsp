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
		ReviewVO rvo = null;
		if (list.size() == 1) {
			rvo = list.get(0);
		};
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
			
		// U 업데이트 부분
		$(document).on("click", "#U", function(){
			
			alert("U");
			
			$("#RevieList").attr({
									"method":"GET",
									"action":"reviewUpdateForm.wd"
			}).submit();
			
		});
			
		});
	
	</script>
	<!-- /헤드 -->

    <body class="nav-fixed">
	<%-- <% request.setCharacterEncoding("UTF-8"); %>
	<%
	
		Object obj = request.getAttribute("listAll");
		List<ReviewVO> list = (List)obj;
		
		int nCnt = list.size();
		System.out.println("nCnt >>> : " + nCnt);
	
	%> --%>
	
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
                                	<input type="hidden" id="cnum" name="cnum" />
                                    <div class="card-header">제목</div>
                                    <div class="card-body">
                             			<div class="lh-base form-control"><%=rvo.getCrsubject() %></div>
                                    </div>
                                    <div class="card-header">작성자</div>
                                    <div class="card-body">
                             			<div class="lh-base form-control"><%=rvo.getCrwriter() %></div>
                                    </div>
                                    <div class="card-header">평점</div>
                                    <span class="strcon">
                                    <%
                                    	int starCount = Integer.parseInt(rvo.getCrscore());
                                    
                                    	for(int i=0; i<starCount; i++) {
                                    %>
	                                    
											<span name="crscore" id="crscore" ><span class="star1">&#9733;</span></span>
										
									<% } %>
									</span>
                                    <div class="card-header">후기내용</div>
                                    <div class="card-body">
                                    	<div class="lh-base form-control" name="crmemo" id="crmemo" style="height:100%;" ><%=rvo.getCrmemo() %></div>
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
                                	<button class="btn btn-primary" type="submit" id="U" style="width:49.6%;float:left;margin-right:5px;">수정하기</button>
                                	<button class="btn btn-primary" type="submit" id="D" style="width:49.6%;float:left;">삭제하기</button>
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
				<%@ include file="/WEB-INF/views/fragment/footer.jsp" %>
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>