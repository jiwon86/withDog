<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="a.b.c.com.qna.vo.QnaVO" %>
<%@ page import="java.util.List" %>
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
	
	
	$(document).ready(function(){
		
		//U
		$(document).on("click", "#Updatebtn", function(){
			alert("U >>> : ");
			$("#qnaUpdateForm").attr({"method":"GET",
									  "action":"qnaMyUpdate.wd"}).submit(); //cotroller qnaMyUpdate로이동
		});
		
		//D
		$(document).on("click", "#Deletebtn", function(){
			alert("D >>> : ");
			$("#qnaUpdateForm").attr({"method":"GET",
									  "action":"qnaMyDelete.wd"}).submit(); //cotroller qnaMyDelete로 이동
		});
	});

</script>
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
				<main>
					
				</main>
				<!--  
					===================================
					<main> 내용 </main> 부분을 복사해서 

					[주요내용 주석] 안에 붙혀넣기 하면 됩니다. 
					===================================
				--> 
				<!-- ** 주요 내용 **  -->
<main>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<QnaVO> list = (List)obj;
	QnaVO qvo = null;
	if(list.size() > 0){
		qvo = list.get(0);
	};
%>
 <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
     <div class="container-xl px-4">
         <div class="page-header-content">
             <div class="row align-items-center justify-content-between pt-3">
                 <div class="col-auto mb-3">
                     <h1 class="page-header-title">
                         <div class="page-header-icon"><i data-feather="user"></i>&nbsp&nbsp<h2>Q&A</h2></div>
                     </h1>
                 </div>
             </div>
         </div>
     </div>
 </header>
 <!-- Main page content-->
<div class="container-xl px-4 mt-4">
<!-- Account page navigation-->
<nav class="nav nav-borders">
    <a class="nav-link active" href="account-security.html">sd</a>
</nav>
<hr class="mt-0 mb-4" />
<div class="row">
    <div class="col-lg-8">
        <!-- Change password card-->
<div class="card mb-4" style="margin:0 auto;">
 <div class="card-header">Q&A 글수정</div>
 <div class="card-body">

     <form name="qnaUpdateForm" id="qnaUpdateForm">
         <!-- Form Group (qnanum)-->
         <div class="mb-3">
             <label class="small mb-1" for="qnanum">글 번호</label>
             <input class="form-control" id="qnanum" name="qnanum" type="text" value=<%=qvo.getQnanum()%> readonly/>
         </div>
         <!-- Form Group (qnatitle)-->
         <div class="mb-3">
             <label class="small mb-1" for="qnatitle">글 제목</label>
             <input class="form-control" id="qnatitle" name="qnatitle" type="text" value=<%=qvo.getQnatitle()%> placeholder="Please enter title" />
         </div>
         <!-- Form Group (qnawriter)-->
         <div class="mb-3">
             <label class="small mb-1" for="qnawriter">작성자</label>
             <input class="form-control" id="qnawriter" name="qnawriter" type="text" value=<%=qvo.getQnawriter()%> placeholder="Please enter your name" />
         </div>
         <!-- Form Group (qnacon)-->
         <div class="mb-3">
             <label class="small mb-1" for="qnacon">글 내용</label>
             
         </div><textarea class="form-control" id="qnacon" name="qnacon" rows="10" cols="65" style="height:200px" placeholder="Please enter your question"><%=qvo.getQnacon()%></textarea>
         <div class="mb-3">
         	 <label class="small mb-1" for="qnafile">첨부파일</label>
         	 <input class="form-control" id="qnafile" name="qnafile" type="file" value=<%=qvo.getQnafile()%> >
         </div>
            <!-- Form Group (qnapw)-->
         <div class="mb-3">
             <label class="small mb-1" for="qnapw">비밀번호(숫자 4개)</label>
             <input class="form-control" readonly id="qnapw" name="qnapw" style="width: 300px;line-height:20px;" type="password" value=<%=qvo.getQnapw()%> placeholder="Please enter the password in 4 digits." />
         </div>
         <br> 
         
         <div style="text-align:right">
            <button class="btn btn-primary" type="button" align="right" id="Updatebtn" name="Updatebtn">Update</button>
         	<button class="btn btn-primary" type="button" align="right" id="Deletebtn" name="Deletebtn">Delete</button>
         </div>
        
        </form>
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