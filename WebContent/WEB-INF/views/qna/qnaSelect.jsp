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
	$('input[type=radio][name=qnaanswer]').on('click',function(){
		var chkValue = $('input[type=radio][name=qnaanswer]:checked').val();
		
		if(chkValue == '01'){
			$('#answer01').css('display','block');
			$('#answer02').css('display','none');
		}else if(chkValue == '02'){
			$('#answer01').css('display','red');
			$('#answer02').css('display','yellow');
		}
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
<main style="width:960px; margin:0 auto;">
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<QnaVO> list = (List)obj;
	QnaVO qvo = null;
	
	String qnaanswer = "";
	String qnanum = "";
	String qnawriter = "";
	
	if(list.size() > 0){
		qvo = list.get(0);
		qnaanswer = qvo.getQnaanswer();
		qnawriter = qvo.getQnawriter();
	};
	
	
%>

<script>
	function compCheck(){
		console.log("compCheck 진입 >>> : ");
		
		var qnaanswer = '<%= qnaanswer %>';
		console.log("qnaanswer >>> : " + qnaanswer);
		if('01' == qnaanswer){
			document.getElementsById("qnaanswer")[0].checked=true;
		}
		if('02' == qnaanswer){
			document.getElementsById("qnaanswer")[1].checked=true;
		}
	}

</script>

 <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
     <div class="container-xl px-4">
         <div class="page-header-content">
             <div class="row align-items-center justify-content-between pt-3" >
                 <div class="col-auto mb-3">
                     <h1 class="page-header-title">
                         <div class="page-header-icon"><i data-feather="user"></i>&nbsp&nbsp<h2>Q&A</h2></div>
                     </h1>
                 </div>
             </div>
         </div>
     </div>
 </header>
<div class="container-xl px-4 mt-4">
<nav class="nav nav-borders">
    <a class="nav-link active" href="account-security.html">sd</a>
</nav>
<hr class="mt-0 mb-4" />
<div class="row" style="margin:0 auto;">
   
<div class="card mb-4" style="margin:0 auto;">
 <div class="card-header">Q&A 글수정</div>
 <div class="card-body">

     <form name="qnaUpdateForm" id="qnaUpdateForm">
        <!-- Form Group (qnanum)-->
         <div class="mb-3">
             <label class="small mb-1" for="qnanum">글 번호</label>
             <input class="form-control" id="qnanum" name="qnanum" type="text" value= <%= qvo.getQnanum() %> readonly />
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
         
         <input type="radio" name="qnaanswer" id="qnaanswer" value="01" checked /> 예정
         <input type="radio" name="qnaanswer" id="qnaanswer" value="02"/> 완료
         <div id="answer01"><p>예쩡</p></div>
         
         <div id="answer02"><p>완려</p></div>

         <br> 
         
         <div style="text-align:right">
            <button class="btn btn-primary" type="button" align="right" id="Updatebtn" name="Updatebtn">Update</button>
         	<button class="btn btn-primary" type="button" align="right" id="Deletebtn" name="Deletebtn">Delete</button>
         </div>
        
        </form>
    </div>
</div>

<sec:authorize access="hasRole('ROLE_ADMIN')"> <!-- 관리자 이외 x -->
 <!-- url붙여서 댓글 가져오기 -->
 <c:import url="/rqnaForm.wd">
	<c:param name="qnanum" value="<%=qvo.getQnanum()%>"></c:param>
</c:import>	
</sec:authorize>       
           
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