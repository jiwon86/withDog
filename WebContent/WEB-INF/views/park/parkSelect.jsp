<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>   
<%@ page import="a.b.c.com.park.vo.ParkVO"%>
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	//U
	$(document).on("click", "#icontentbtn", function(){
		 $("#move").attr({ "method":"POST"
			              ,"action":"parkUpdate.wd"}).submit();
	}); 
</script>

<body class="nav-fixed">

	<%
		Object obj = request.getAttribute("list");
		List<ParkVO> list = (List)obj;
		ParkVO svo = null;
		if(list.size() > 0) {
			svo = list.get(0);
		}
	%>
	<!-- 헤더 -->
	<jsp:include page="/header.wd" />
	<!-- /헤더 -->

	<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="/sidebar.wd" />
		<!-- /사이드바 -->

		<!-- 콘텐츠 -->
		<div id="layoutSidenav_content">
			<main style="width: 960px; margin:0 auto;">
			
			<header class="page-header page-header-light bg-withcolor pb-10">
		<div class="container-xl px-4">
			<div class="page-header-content pt-4">
				<!-- <img src="/image/header/header_pe_1.png" class="headerdog"> -->
				<!-- <img src="/image/header/header_dog_11.gif" class="headerdog2"> -->

					<div class="row align-items-center justify-content-between">
						<div class="col-auto mt-4">
							<h1 class="page-header-title">
								<div class="page-header-icon"><i data-feather="fab fa-instagram"></i></div>
						
								<img src="image/park/deng.png">
									<button class="btn btn-warning" style="margin-left:380px;"type="button" id="icontentbtn">수정완성</button>
                    
						</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
				<div class="container-xl px-4 mt-n10" >	
				
			
		
			<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 

					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				-->
			<!-- ** 주요 내용 **  -->
		<div>
		
			<!-- <form name="move" id="move"> -->
					
				
				<div style="width:760px; margin:0 auto; margin-top:-130px;"">
					
					
					 <form name="move" id="move">
					<div> 
					
						<!-- <a href="parkForm.wd" class="btn btn-primary float-end">수정완성</a> -->
					</div>
					<br><br>
					
					<div class="card card-header-actions mx-auto mb-3 mt-3" style="clear:both;">
					    <div class="card-header">
					    	<div class="avatar avatar-xl" style="margin-left:305px;">
								<img class="avatar-img img-fluid me-2" src="img/park/<%= svo.getIphoto() %>">
								<!--<img class="avatar-img img-fluid me-2" >-->
								<span class="tt mr-4"><%= svo.getIid() %> </span>
								<!-- 수정/삭제 -->
								
								
								<div class="float-end" style="margin-left:570px;">
									<div class="dropdown">
									    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									    </div>
									</div>
								</div>
								
							</div>
					    </div>
						    <div class="card-body">
						         <img class="avatar-img img-fluid" src="img/park/<%= svo.getIupload() %>" style="width:100%;"> 
						    </div>
					    <div class="card-footer">
					    	
					    	<div class="float-end" style="margin-right:620px;">
					    		
					            <button class="btn btn-pink btn-icon mr-2 mb-2"  style="margin-right:50px;">
					                <i data-feather="heart"></i>
					            </button>
					        </div>
					        <!-- 내용들어가는 곳 -->
					         <!-- 내용-->
					         
                                <div class="mb-3">
                                    <!-- <label class="small mb-1" for="inputConfirmPassword">내용</label> -->
                                    <input type="hidden" name="inum" value="<%= svo.getInum() %>">
                                    <input class="form-control" id="icontent" name="icontent" type="text" value="<%= svo.getIcontent() %>" placeholder="<%= svo.getIcontent() %>">
                                </div>
                              </form>
					        <!-- 오른쪽으로 옮기기 -->
					     	<span style="margin-left:620px;"><%= svo.getIinsert()%> </span>
					    </div>
					    <div style="clear:both;"></div>
					</div>
					
					<!-- /카드 -->
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