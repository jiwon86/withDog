<%@page import="a.b.c.com.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<
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
				width : 17%;
				height : 200px;
				left : 63%
			}
		</style>

		<jsp:include page="/head.wd" />
	</head>
	<!-- /헤드 -->
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript">

		// 검색버튼
		$(document).on("click", "#searchBtn", function(){
			// alert("searchBtn >>> : ");
			$("#noticeList").attr({ "method":"GET"
		        					,"action":"noticeSelectAll.wd"}).submit();
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
<!-- Main page content-->
<main style="width:960px; margin:0 auto;">
	<header class="page-header page-header-light bg-withcolor pb-10">
		<div class="container-xl px-4">
			<div class="page-header-content pt-4">
				<img src="/image/header/header_dog_8.png" class="headerdog">
					<div class="row align-items-center justify-content-between">
						<div class="col-auto mt-4">
							<h1 class="page-header-title">
								<div class="page-header-icon"><i data-feather="user"></i></div>
										공지 사항
									</h1>
						<div class="page-header-subtitle">서비스이용에 불편함이 없도록 항시 공지사항 확인을 부탁드립니다! </div>
					</div>
				</div>
			</div>
		</div>
	</header>
<div class="container-xl px-4 mt-n10">	


        <div class="card mb-4">
            <div class="card-header">공지사항 전체목록</div>
            <div class="card-body">
                <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                <div class="dataTable-top">
                                  
                 	<!-- 
                 	<tr>
						<td colspan="10" align="left">
						<button class="btn btn-primary me-2 my-1 float-end" type="button" id="searchBtn" >검색</button>
						<input class="dataTable-search float-end" style="width:300px; height:48px; border-radius: 15px;" type="text" id="keyword" name="keyword" placeholder="검색어 입력"  align="right" >   
						<select class="dataTable-search float-end" id="keyfilter" name="keyfilter" style="height:48px; border-radius: 15px;">
							<option value="key1">제목</option>
							<option value="key2">작성자</option>
						</select>
						</td>
					</tr> 
                </div>
                 -->
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listAll");
	List<NoticeVO> list = (List) obj;
	int nCnt = 0;
	if (list != null) {
		nCnt = list.size();
		System.out.println("nCnt >>> : " + nCnt);
	}
%>
                 <form action="/notice/search" method="GET">
                 <!-- <form id="keyfilter" name="keyfilter"> -->
                 		<!-- <input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br> -->
                 		<button class="btn btn-primary" style="float:right" id="searchBtn">검색하기</button>
				    <div style="float:right">
				        <input name="keyword" type="text" placeholder="검색할 제목을 입력해주세요" style="border-radius: 15px; height:40px;">
				    </div>
				   
				    <br><br>
				</form>
                 <br>
               <form name="boardList" id="boardList">
                <div class="dataTable-container">
                <table id="datatablesSimple" class="dataTable-table">
                    <thead>
                        <tr>
                         <th data-sortable="" style="width: 5.0092%;">
                         	<a href="#" class="dataTable-sorter">순 번</a>
                         </th>
                         <th data-sortable="" style="width: 14.8758%;">
                         	<a href="#" class="dataTable-sorter">제 목</a>
                         </th>
                         <th data-sortable="" style="width: 5.576%;">
                         	<a href="#" class="dataTable-sorter">작 성 자</a>
                         </th>
                         <th data-sortable="" style="width: 1.576%;">
                         	<a href="#" class="dataTable-sorter">-</a>
                         </th>
                         <th data-sortable="" style="width: 1.576%;">
                            	<a href="#" class="dataTable-sorter">-</a>
                            </th>
                           </tr>
                       </thead>
                       
<%
if (nCnt > 0) {
for(int i=0; i<nCnt; i++){
	NoticeVO nvo = list.get(i);
%>
                       <tbody>
							<tr>
                               <td><%= nvo.getNnum() %></td>
                               <td><%= nvo.getNsubject() %></td>
                               <td><%= nvo.getNwriter() %></td>
                               <td>
                               	<a href="noticeSelect.wd?nnum=<%= nvo.getNnum()%>"><div class="badge bg-primary text-white rounded-pill">상세조회</div></a>
                               </td>
                               <sec:authorize access="hasRole('ROLE_ADMIN')">
                               <td>
                               <!-- <a href="noticeDelete.wd?nnum=<%= nvo.getNnum() %>"><button class="btn btn-datatable btn-icon btn-transparent-dark"><i data-feather="trash-2"></i></button></a> -->
                               <a href="noticeDelete.wd?nnum=<%= nvo.getNnum() %>" button class="btn btn-datatable btn-icon btn-transparent-dark"><i data-feather="trash-2"></i></button></a>
                               </td>
                               </sec:authorize>
                           </tr>                          
					  </tbody>				  
<%
					} // end if
				} // end for
%>
                   </table>
                   </div>
                    <div class="dataTable-bottom">
                    	<div class="dataTable-info">
                      <nav class="dataTable-pagination">
                       <ul class="dataTable-pagination-list">
                        <li class="active"><a href="#" data-page="1">1</a></li>
                        <li class=""><a href="#" data-page="2">2</a></li>
                        <li class=""><a href="#" data-page="3">3</a></li>
                        <li class=""><a href="#" data-page="4">4</a></li>
                        <li class=""><a href="#" data-page="5">5</a></li>
                        <li class=""><a href="#" data-page="6">6</a></li>
                        <li class="pager"><a href="#" data-page="2">›</a></li>
                       </ul>
                      </nav>
                     </div>
                    </div>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
	                    <a href="noticeInsertForm.wd">
	                    	<button class="btn btn-primary me-2 my-1 float-end" type="button">작성하기</button>
	                    </a>
                    </sec:authorize>
                   </div>
               </div>
           </div>
           <div class="card card-icon mb-4">
               <div class="row g-0">
                   <div class="col-auto card-icon-aside bg-primary">
                  
                   <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                   <line x1="12" y1="9" x2="12" y2="13"></line>
                   <line x1="12" y1="17" x2="12.01" y2="17"></line>
                   
                   </div>
                   <div class="col">
                       <div class="card-body py-5">
                           <h5 class="card-title">공지사항 및 서비스기본 이용방법</h5>
                           <p class="card-text">WithDog 가족 여러분 안녕하세요!<br> 여러분의 원활한 서비스이용을 위해 반려동물 정보와 돌봄이 및 반려주인의 인적사항내용을 명확하게 작성부탁드리며, 항상  가족같은 마음으로 이웃의 반려동물도 따뜻하게 볼돔 부탁드립니다!<br>항상 저희 WithDog 서비스를 이용해주고 많은 관심 가져주셔서 감사합니다!^^</p>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       </div>
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