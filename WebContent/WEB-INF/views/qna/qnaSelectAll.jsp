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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		/*
		CSS 선택자 우선순위 점수
		직접기입  : styl='' : 1000 점 
		id : #sbnum : 100점
		class : .sbnum : 10점
		속성 : [name="sbnum"] : 10점
		*/
		
		//I
		$(document).on("click", "#I", function(){
			alert("I >>>");
			location.href="qnaForm.wd";
		});
		
		//U
		$(document).on("click","#U", function(){
			alert("마이페이지 내 자기글 조회 등으로 글 수정하기");
		});
		
		//D
		$(document).on("click","#D", function(){
			alert("마이페이지 내 자기글 조회 등으로 글 삭제하기");
		});
	})

</script>

    <body class="nav-fixed">
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
	Object obj = request.getAttribute("listAll");
	List<QnaVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("nCnt >>> : " + nCnt);
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
<header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
    <div class="container-xl px-4">
        <div class="page-header-content">
            <div class="row align-items-center justify-content-between pt-3">
                <div class="col-auto mb-3">
                    <h1 class="page-header-title">
                        <div class="page-header-icon"><i data-feather="user"></i></div>
                        Q&A
                    </h1>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Main page content-->
<div class="container-xl px-4 mt-4">

    <hr class="mt-0 mb-4" />
    <div class="row">
        <div class="col-lg-4 mb-4" align="right">
        
        <div class="col-12 col-xl-auto mb-3">
          <button class="btn btn-sm btn-light text-primary active me-2" id="I">글쓰기</button>
          <button class="btn btn-sm btn-light text-primary me-2" id="U">글수정</button>
          <button class="btn btn-sm btn-light text-primary" id="D">글삭제</button>
      </div>
        </div>
<div class="col-lg-4 mb-4">
</div>
<div class="col-lg-4 mb-4">
</div>

<!-- Billing history card-->
<div class="card mb-4">
  <div class="card-header">Q&A : 문의사항을 남겨주시면 친절하게 답변해드립니다.</div>
  <div class="card-body p-0">

      <!-- Billing history table-->
      <div class="table-responsive table-billing-history">
          <table class="table mb-0">
              <thead>
                  <tr>
                      <th class="border-gray-200" scope="col">글번호</th>
                      <th class="border-gray-200" scope="col">제목</th>
                       <th class="border-gray-200" scope="col">글쓴이</th>
                      <th class="border-gray-200" scope="col">작성일</th>
                      <th class="border-gray-200" scope="col">답변</th>
                  </tr>
              </thead>
       <%
       for(int i=0; i<nCnt; i++){
    	   QnaVO qvo = list.get(i);
       %>
			<tbody>
			<%-- <tr>
				<td class="tt"><%= qvo.getQnanum() %></td>	
				<td class="tt"><%= qvo.getQnatitle() %></td>
				<td class="tt"><%= qvo.getQnawriter() %></td>			
				<td class="tt"><%= qvo.getQnainsertdate() %></td>
				<td class="tt"><span class="badge bg-success">예정</span></td> 	
			</tr> --%>
		<%
       }//end of for
		%>
             <tr>
                 <td>0001(채번)</td>
                 <td>제목</td>
                 <td>김민정</td>
                 <td>작성일자(sysdate:yyyy-mm-dd)</td>
                 <td><span class="badge bg-light text-dark">완료</span></td>
             <tr>
                 <td>0002(채번)</td>
                 <td>제목2</td>
                 <td>이다희</td>
                 <td>작성일자(sysdate:yyyy-mm-dd)</td>
                 <td><input type="hidden" name="qnaans" id="qnaans" value="<span class="badge bg-success">" />
                 <span class="badge bg-success">예정</span></td>
             </tr>
             
              <tr>
                 <td>0003(채번)</td>
                 <td>제목3</td>
                 <td>fwefwef</td>
                 <td>작성일자(sysdate:yyyy-mm-dd)</td>
                 <td><span class="badge bg-success">예정</span></td>
             </tr>
              </tbody>
          </table>
      </div>
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