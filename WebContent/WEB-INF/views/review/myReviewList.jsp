<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="a.b.c.com.review.vo.ReviewVO" %>
<%@ page import="a.b.c.com.member.vo.MemberVO"%>

<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
	<%@ include file="/WEB-INF/views/fragment/head.jsp" %>
	
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
	
		Object obj = request.getAttribute("listAll");
		String mid = (String)request.getAttribute("mid");
		List<ReviewVO> list = (List)obj;
		
		int nCnt = list.size();
		System.out.println("nCnt >>> : " + nCnt);

	%>

	<style>
	
	a{text-decoration:none;}
	
	.brs{border-bottom:1px solid #d3d3d3;color:#69707a;}
	.brs>a{color:#69707a;}
	.brsr{border-right:1px solid #d3d3d3;}
	
	.trcon:hover{background:#d3d3d3;}
	
	.headerdog  {
		position : absolute;
		width : 20%;
		height : 200px;
		left : 60%
}
	
	</style>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		 
		// 검색버튼
		
		$(document).on("click", "#searchBtn", function(){
			alert("searchBtn >>> : ");
			$("#RevieList").attr({"method":"GET"
								 ,"action":"reviewSelectAll.wd"}).submit();
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
				
				<main style="margin:0 auto; width:960px;height:900px;background:#fff;">
				<form name="RevieList" id="RevieList">
				
                      <header class="page-header page-header-light bg-withcolor pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                            	<img src="/image/header/header_dog_7.png" class="headerdog">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title"><div class="page-header-icon"><i data-feather="filter"></i></div><%=mid %> 님의 돌보미 활동 후기</h1>
                                        <div class="page-header-subtitle">소중한 반려동물을 위해 후기를 작성해보세요</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">돌봄의 후기들</div>
                            <div class="card-body">
                                <input type="hidden" id="crnum" name="crnum"/>
                                <table id="datatablesSimple" style="width:100%;text-align:center;border:1px solid #d3d3d3;border-radius: 100px;">

                                    <thead>
                                        <tr style="background:#FFE082;">
                                            <th  style="color:black;">글번호</th>
                                            <th  style="color:black;">제목</th>
                                            <th  style="color:black;">돌봄이</th>
                                            <th  style="color:black;">후기 작성자</th>
                                            <th  style="color:black;">작성일</th>
                                        </tr>
                                    </thead>
                                   <%
                                   if(nCnt >= 0 ){
									for(int i=0; i<nCnt; i++){		
										ReviewVO rvo = list.get(i);	

									%>		
                                    <tbody>
                                    	
                                        <tr class="trcon">
                                        	<!-- 번호 -->
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getCrnum() %></a></td>
                                            <!-- 제목 -->
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getCrsubject() %></a></td>
                                            
                                            <!-- 돌봄이 -->
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getMid() %></a></td>
                                           	
                                            <!-- 이름 -->
                                            <td class="brs brsr"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getRwriter() %></a></td>
                                            <!-- 입력날짜 -->
                                            <td class="brs"><a href="reviewSelect.wd?crnum=<%= rvo.getCrnum() %>" ><%= rvo.getInsertdate() %></a></td>
                                        </tr>
                                    
                                   <%
											
                                    		//} // end of for
										} 
                                   }
                                   %>
                                   </tbody>
                                </table>
                               
                            </div>
                        </div>
                    </div>
                    </form>
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