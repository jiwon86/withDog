<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page import="a.b.c.com.qna.vo.QnaVO"%>
<%@ page import="java.util.List"%>
<%@ page import="a.b.c.com.common.CodeUtil"%>

<%-- 
	jsp:include : 내 서버내의 jsp파일만 가능
	c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<html lang="ko">
<!-- 헤드 -->
<head>
	<style>
		.headerdog  {
			position : absolute;
			width : 20%;
			height : 250px;
			left : 60%
		}
	</style>
<jsp:include page="/head.wd" />
</head>

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
			//alert("I >>>");
			
			location.href="qnaForm.wd";
		});
	})
	
</script>

<body class="nav-fixed">

	<jsp:include page="/header.wd" />
	<!-- /헤더 -->


	<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="/sidebar.wd" />
		<!-- /사이드바 -->

		<!-- 콘텐츠 -->
		<div id="layoutSidenav_content">

			
<% request.setCharacterEncoding("UTF-8"); %>
<%
	//페이징 변수 세팅
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;

	Object objPaging = request.getAttribute("pagingQVO");
	QnaVO pagingQVO = (QnaVO)objPaging; 
	
	Object obj = request.getAttribute("listAll");
	List<QnaVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("nCnt >>> : " + nCnt);
	
%>



<!-- Main page content-->
<main style="width:960px; margin:0 auto;">
	<header class="page-header page-header-light bg-withcolor pb-10">
		<div class="container-xl px-4">
			<div class="page-header-content pt-4">
				<img src="/image/header/header_qna_1.png" class="headerdog">
					<div class="row align-items-center justify-content-between">
						<div class="col-auto mt-4">
							<h1 class="page-header-title">
								<div class="page-header-icon"><i data-feather="user"></i></div>
										Q & A
									</h1>
						<div class="page-header-subtitle">운영시간  - 09:00 ~ 18:00 </div>
					</div>
				</div>
			</div>
		</div>
	</header>
<div class="container-xl px-4 mt-n10">	

<div class="row">
	<div class="col-lg-4 mb-4" align="right">

		<div class="col-12 col-xl-auto mb-3">
		</div>
	</div>
	<div class="col-lg-4 mb-4"></div>
	<div class="col-lg-4 mb-4"></div>
	
<!-- Billing history card-->
<div class="card mb-4">
	<div class="card-header">로그인 후 문의사항을 남겨주시면 친절하게 답변해드립니다.
	
	<sec:authorize access="isAuthenticated()">
	<button class="btn btn-withcolor" id="I" style=" float:right;">글쓰기</button> 
	</sec:authorize>
	</div>
	
	<div class="card-body p-0">

		<!-- Billing history table-->
		<div class="table-responsive table-billing-history">
			<table class="table mb-0">
				<thead>
					<tr>
						<th class="border-gray-200" scope="col">글번호</th>
						<th class="border-gray-200" scope="col">제목</th>
						<th class="border-gray-200" scope="col">글쓴이</th>
						<th class="border-gray-200" scope="col">내용</th>
						<th class="border-gray-200" scope="col">작성일</th>
						<th class="border-gray-200" scope="col">답변</th>
						<sec:authorize access="hasRole('ROLE_ADMIN')"> <!-- 관리자 이외 수정, 삭제x -->
						<th class="border-gray-200" scope="col">수정</th>
						<th	class="border-gray-200" scope="col">삭제</th>
						</sec:authorize>
					</tr>
				</thead>
<%
	//String qnaanswer = "";
	

if(nCnt > 0) {
   for(int i=0; i<nCnt; i++){
	   QnaVO qvo = list.get(i);
	   String qnanum = qvo.getQnanum();
	   String qnatitle = qvo.getQnatitle();
	   String qnawriter = qvo.getQnawriter();
	   String qnacon = qvo.getQnacon();
	   String qnafile = qvo.getQnafile();
	   String qnainsertdate = qvo.getQnainsertdate();
	   String qnaupdatedate = qvo.getQnaupdatedate();
	   //String qnaanswer = qvo.getQnaanswer();
	   //String qnaanswer = CodeUtil.answer(qvo.getQnaanswer());
	   
	   System.out.println("qvo.getQnanum >>>> : " + qvo.getQnanum());
	   System.out.println("qvo.getQnatitle >>>> : " + qvo.getQnatitle());
	   System.out.println("qvo.getQnawriter >>>> : " + qvo.getQnawriter());
	   System.out.println("qvo.getQnacon >>>> : " + qvo.getQnacon());
	   System.out.println("qvo.getQnafile >>>> : " + qvo.getQnafile());
	   System.out.println("qvo.getQnaanswer >>>> : " + qvo.getQnaanswer());
	   System.out.println("qvo.getQnainsertdate >>>> : " + qvo.getQnainsertdate());
	   
/* 	   System.out.println("pagingQVO.getPageSize >>> : " + pagingQVO.getPageSize());
	   System.out.println("pagingQVO.getGroupSize >>> : " + pagingQVO.getGroupSize());
	   System.out.println("pagingQVO.getCurPaging >>> : " + pagingQVO.getCurPage());
	   System.out.println("qvo.getTotalCount() >>> : " + qvo.getTotalCount()); */
	   
	   pageSize = Integer.parseInt(pagingQVO.getPageSize());
	   groupSize = Integer.parseInt(pagingQVO.getGroupSize());
	   curPage = Integer.parseInt(pagingQVO.getCurPage());
	   totalCount = Integer.parseInt(qvo.getTotalCount());

   %>


<tbody>
	<tr>
<!-- WEB-INF안에 있는 jsp 파일 안에는 접근이 안되기 때문에 Controller 통해서 접근해줘야됨 그래서 index를 WEB-INF에 안 넣고 밖으로 빼둔거임 -->
	
		<td><a class="tt" href="qnaSee.wd?qnanum=<%= qvo.getQnanum() %>"><%= qvo.getQnanum() %></a></td>
		<td><a class="tt" href="qnaSee.wd?qnanum=<%= qvo.getQnanum() %>"><%= qvo.getQnatitle() %></a></td>
		<td><a class="tt" href="qnaSee.wd?qnanum=<%= qvo.getQnanum() %>"><%= qvo.getQnawriter() %></a></td>
		<td><a class="tt" href="qnaSee.wd?qnanum=<%= qvo.getQnanum() %>"><%= qvo.getQnacon() %></a></td>
		<td><a class="tt" href="qnaSee.wd?qnanum=<%= qvo.getQnanum() %>"><%= qvo.getQnainsertdate() %></a></td>
		
		<td class="tt"><!-- <span class="badge bg-success">예정</span> -->
		<%=qvo.getQnaanswer() %>
		
		</td>	
		
<sec:authorize access="hasRole('ROLE_ADMIN')"> <!-- 관리자 이외 수정, 삭제x -->
<!-- <td>
		<select name="qnaanswer" id="qnaanswer" >
			<option value="1">예정</option>
			<option value="2">완료</option>
		</select>
</td>	 -->

<td><a class="btn btn-datatable btn-icon btn-transparent-dark me-2" href="qnaSelect.wd?qnanum=<%=qvo.getQnanum() %>"> <i data-feather="edit"></i></a>
</td>            					
<!-- 글삭제-->
<td><a class="btn btn-datatable btn-icon btn-transparent-dark" href="qnaMyDelete.wd?qnanum=<%=qvo.getQnanum() %>"> <i data-feather="trash-2"></i></a>
</td>  
</sec:authorize>          					
</tr>
<%
   		} // end of if
   }//end of for
%>
<tr>
<% if (nCnt > 0) { %>
	 <td colspan="7"> 
	<jsp:include page="qnaPaging.jsp" flush="true">
		<jsp:param name="url" value="qnaSelectAllPaging.wd"/>
		<jsp:param name="str" value=""/>
		<jsp:param name="pageSize" value="<%=pageSize %>"/>
		<jsp:param name="groupSize" value="<%=groupSize %>"/>
		<jsp:param name="curPage" value="<%=curPage %>"/>
		<jsp:param name="totalCount" value="<%=totalCount %>"/>
	</jsp:include>
	<% } %>
	</td>
</tr>
</tbody>
				</table>
					</div>
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