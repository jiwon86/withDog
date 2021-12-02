<%@page import="a.b.c.com.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
	jsp:include : 내 서버내의 jsp파일만 가능
	c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<html lang="ko">

	<!-- 헤드 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$(document).on("click", "#nbtn", function(){
			console.log("nbtn >>> : ");
			$('#noticeForm').attr({
				'action':'noticeDelete.wd',
				'method':'POST'
			}).submit();
		});
	});
</script>
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
            
            
<main style="width:960px; margin:0 auto;">
<form name="noticeForm" id="noticeForm">
	<table border="1" align="center">
	    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
	        <div class="container-fluid px-4">
	            <div class="page-header-content">
	                <div class="row align-items-center justify-content-between pt-3">
	                    <div class="col-auto mb-3">
	                        <h1 class="page-header-title">
	                            <div class="page-header-icon"><i data-feather="file-text"></i></div>
	                            	공지사항 작성
	                        </h1>
	                    </div>
	                    <div class="col-12 col-xl-auto mb-3">
	                        <a class="btn btn-sm btn-light text-primary" href="noticeSelectPaging.wd">
	                            <i class="me-1" data-feather="arrow-left"></i>
	                          	  공지사항 전체목록
	                        </a>
	                    </div>
	                </div>
	            </div>
	        </div>
	<!--   <button class="btn btn-primary me-2 my-1" type="button" style="float:right">공지사항 작성완료</button>-->
	       
	       <!--  <button class="btn btn-primary me-2 my-1" type="button" style="float:right">파일 업로드</button></a> -->
	    </header>
	    <!-- Main page content-->
	    <div class="container-fluid px-4">
	        <div class="row gx-4">
	            <div class="col-lg-8">
	            	
	          	</div>
	<%
	List<NoticeVO> listS = (List<NoticeVO>)request.getAttribute("listS");
	int nCnt = listS.size();
	
	for(int i=0; i<nCnt; i++){
		NoticeVO nvo = listS.get(i);
	%>          	
				   <input type="hidden" id="nnum" name="nnum" value="<%=nvo.getNnum()%>">
	               <div class="card mb-4" style="width:900px;">
	                    <div class="card-header" style="width:900px;" style="height:40px;line-height:15px;">공지사항 제목</div>
	                    <div class="card-body" style="width:900px;"><input class="form-control" id="nsubject" name="nsubject" type="text" placeholder="" value="<%= nvo.getNsubject() %>"  style="height:10px;" readonly/></div>
	                </div>
	                
	               <div class="card mb-4" style="width:900px;">
	                    <div class="card-header" style="width:900px;" style="height:40px;line-height:15px;">작성자</div>
	                    <div class="card-body">
	                    	<p><%= nvo.getNwriter() %></p>
	                    </div>
	                	
	                </div>
	                
	                <div class="card card-header-actions mb-4" style="width:900px;">
	                    <div class="card-header">공지사항 내용</div>
	                    <div class="card-body"><textarea class="lh-base form-control" type="text" id="ncontents" name="ncontents" placeholder="" rows="4" style="height:200px;" readonly><%= nvo.getNcontents() %></textarea></div>
	                </div>
	                
	                <div class="card mb-4" style="width:900px;">
	                    <div class="card-header" style="width:900px;" style="height:40px;line-height:15px;">파일 업로드</div>
	                    <div class="card-body">
		                     <div class="mb-3">
							  <label for="formFile" class="form-label">업로드된 파일명</label>
							  <div class="form-control" type="file" id="nfile" name="nfile" readonly><%= nvo.getNfile() %></div>
								<!-- <input class="form-control" type="file" id="nfile" name="nfile" readonly> --> 
							</div>
	                    </div>
	                </div>
			<%
					}
			%>             
	            <input class="btn btn-danger me-2 my-1" type="button" value="공지사항 삭제하기" id="nbtn">
	            </div>
	            
	        </div>
	
	</table>
</form>
</main>
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />
                <!-- /바닥글 -->
                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>