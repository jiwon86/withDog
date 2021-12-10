<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="a.b.c.com.review.vo.ReviewVO" %>
<%@ page import="a.b.c.com.member.vo.MemberVO" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
	<% request.setCharacterEncoding("UTF-8"); 
		String mid = (String)request.getAttribute("mid");
		System.out.println(mid);
	%>
	<%
	MemberVO member = (MemberVO)request.getAttribute("member");
	
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
	
	.headerdog  {
			position : absolute;
			width : 17%;
			height : 200px;
			left : 63%
		}
	
	</style>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			// 업데이트 부분
			$(document).on("click", "#U", function(){
				
				let mid = "${mid}";
				console.log(mid);
				let rwriter = document.getElementById("rwriter").value;
				if (mid == rwriter ) {
					// 작성자와 로그인한 사람이 같을 시
					$("#RevieList").attr({
						"method":"GET",
						"action":"reviewUpdateForm.wd"
					}).submit();
				}else {
						alert("작성자가 아니면 수정 할 수 없습니다!");
					}
				
			});
			
			// 삭제 부분
			$(document).on("click", "#D", function(){
				
				let mid = "${mid}";
				console.log(mid);
				let rwriter = document.getElementById("rwriter").value;
				if (mid == rwriter ) {

					$("#RevieList").attr({
						"method":"GET",
						"action":"reviewDelete.wd"
					}).submit();
					alert("후기가 삭제됐습니다.");
				}else {
					alert("작성자가 아니면 삭제 할 수 없습니다!");
				}
				
			});
			
		});
	
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
				
<main style="width:960px; margin:0 auto; background:#fff;">
	<header class="page-header page-header-light bg-withcolor pb-10">
		<div class="container-xl px-4">
			<div class="page-header-content pt-4">
				<img src="/image/header/header_dog_5.png" class="headerdog">
					<div class="row align-items-center justify-content-between">
						<div class="col-auto mt-4">
							<h1 class="page-header-title">
								<div class="page-header-icon"><i data-feather="filter"></i></div>
										후기 작성
									</h1>
						<div class="page-header-subtitle">돌보미에 대한 후기를 작성 해주세요. </div>
					</div>
				</div>
			</div>
		</div>
	</header>
<div class="container-xl px-4 mt-n10">	
                            <form name="RevieList" id="RevieList">
                                <div class="card mb-4" >
                                	<input type="hidden" id="crnum" name="crnum" value=<%=rvo.getCrnum() %> />
                                    <div class="card-header">제목</div>
                                    <div class="card-body">
                             			<input class="lh-base form-control" style="background:#fff;" value="<%=rvo.getCrsubject() %>" disabled />
                                    </div>
                                    <div class="card-header">돌봄이</div>
                                    <div class="card-body">
                             			<input class="lh-base form-control" type="text" id="mid" name="mid" value="<%=rvo.getMid() %>" disabled/>
                                    </div>
                                     <div class="card-header">작성자</div>
                                    <div class="card-body">
                             			<input type="text" id="rwriter" name="rwriter" class="lh-base form-control" style="width:100%" value="<%=rvo.getRwriter() %>" disabled/>
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
                                    	<textarea class="lh-base form-control" type="text" name="crmemo" id="crmemo" rows="10" disabled style="background:#fff;"><%=rvo.getCrmemo() %></textarea>
                                    </div>
                                    
                                    
                                </div>
                               
                                </form>
                                
                               	<%-- <sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
                                <div>
                              
                                	<button class="btn btn-primary" type="submit" id="U" style="width:49.6%;float:left;margin-right:4px;">수정하기</button>
                                	<button class="btn btn-primary" type="submit" id="D" style="width:49.6%;float:left;">삭제하기</button>
                                
                                </div>
                                <%-- </sec:authorize> --%>
                                <a href="reviewSelectAll.wd"><button class="btn btn-primary mt-2" type="button" style="width:100%;">목록보기</button></a>

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