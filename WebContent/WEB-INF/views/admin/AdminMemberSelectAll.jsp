<%@page import="a.b.c.com.pet.vo.PetVO"%>
<%@page import="a.b.c.com.member.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
	jsp:include : 내 서버내의 jsp파일만 가능
	c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<style>
/* #photodiv.d-flex.align-items-center{
	position: absolute !important;
	right : 90% !important;
}  */

.bor{border:1px solid #d3d3d3;}

<!-- trashform.btn.btn-datatable.btn-icon.btn-transparent-dar-->
<!-- editform.btn.btn-datatable.btn-icon.btn-transparent-dar-->
</style>
<html lang="ko">
	<!-- 헤드 -->
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
				 <main>
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="user"></i></div>
                                            Users List
                                        </h1>
                                    </div>
                                    <!-- <div class="col-12 col-xl-auto mb-3">
                                        <a class="btn btn-sm btn-light text-primary" href="user-management-groups-list.html">
                                            <i class="me-1" data-feather="users"></i>
                                            Manage Groups
                                        </a>
                                        <a class="btn btn-sm btn-light text-primary" href="user-management-add-user.html">
                                            <i class="me-1" data-feather="user-plus"></i>
                                            Add New User
                                        </a>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </header>
                       <%
               				Object obj = request.getAttribute("listAll");
              				List<Member> listall = (List<Member>)obj;
              				
              				/* Object obj1 = request.getAttribute("listAll1");
              				List<PetVO> listall1 = (List<PetVO>)obj1; */
                    				
                			int nCnt = listall.size();
                    		System.out.println("list.size() >>> :" + listall.size());
                    		
                    		/* int nCnt1 = listall1.size();
                    		System.out.println("listall1.size() >>> : " + listall1.size()); */
                   		%>
                   
                    <script type="text/javascript">
                    
                    
                    </script>
                    <!-- Main page content-->
                    
                    <div class="container-fluid px-4">
                        <div class="card">
                            <div class="card-body" align="center">
                                <table id="datatablesSimple"style="width:100%;">
                                    <thead>
                                    	<tr class="bor">
                                    		<th class="bor">유저 이미지</th>
                                            <th class="bor">유저 아이디</th>
                                            <th class="bor">유저 이름</th>
                                            <th class="bor" style="text-align:center;">주소</th>
                                            <th class="bor" style="text-align:center;">펫 정보</th>
                                            <th class="bor">최종 수정 일</th>
                                        </tr>
                                    </thead>
                                    <%
                              /*       String pname = "";
                                    String ptype= "";
                                    String pgender ="";
                                    String natural = "";
                                    
                                    	for(int j=0; j<nCnt1; j++){
                                    		PetVO pvo = listall1.get(j);
                                    		pname = pvo.getPname();
                                    		ptype = pvo.getPtype();
                                    		pgender = pvo.getPgender();
                                    		natural = pvo.getPneutral();
                                    	}
                                  */
                                    	for(int i=0; i<nCnt; i++){
                                    		Member member = listall.get(i);
                                    		
                                    		String mno = member.getMno();
                                    		String mphoto = member.getMphoto();
                                    		String mid = member.getMid();
                                    		String mname = member.getMname();
                                    		String mroadaddress = member.getMroadaddress();
                                    		String updatedate = member.getUpdatedate();
                                    		System.out.println(mno);
                                    %>
                                    <tbody>
                                        <tr>
                                        	<!--  -->
                                            <td align="center" class="bor">
                                            <!-- photodiv.d-flex.align-items-center -->
                                                <div class="d-flex align-items-center" id="photodiv" name="photodiv" >
                                                    <div class="avatar me-2"style="left:50%; top:50%; margin-left:-16px;"><img class="avatar-img img-fluid" src="/img/member/<%=mphoto %>"/></div>
                                                </div>
                                                   
                                            </td>
                                            <td class="bor"><%=mid %>
                                            <td class="bor"><%=mname %></td>
                                            <td class="bor"><%=mroadaddress %></td>
                                            <td  class="bor">
                                                <span class="badge bg-green-soft text-green">펫 이름 :포메라니안</span>
                                                <span class="badge bg-red-soft text-red"> 견종 : 포메라니안</span>
                                                <span class="badge bg-blue-soft text-blue">성별 : 포메라니안</span>
                                                <span class="badge bg-purple-soft text-purple">중성화 수술 : 포메라니안</span>
                                            </td>
                                            <td id="insertdateform" name="insertdateform" class="bor"><%=updatedate %></td>
                                            <td class="bor">
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark me-2" href="adminpro.wd?mid=<%=mid %>" id="editform" name="editform"> <i data-feather="edit"></i></a>
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark" href="AdminDelete.wd?mno=<%=mno %>"><i data-feather="trash-2" id="trashform" name="trashform"></i></a>
                                                
                                            </td>
                                        </tr>
                                        <%
                                        }
                                        %>
                                        <div class="dataTable-top">
                                        	<div class="dataTable-dropdown">
                                        	<label>
                                        		<select class="dataTable-selector">
                                        			<option value="5">5</option>
                                        			<option value="10" selected="">10</option>
                                        			<option value="15">15</option>
                                        			<option value="20">20</option>
                                        			<option value="25">25</option></select> entries per page</label></div>
                                        			<div class="dataTable-search">
                                        			<input class="dataTable-input" placeholder="Search..." type="text"></div>
                                        			</div>
                                    </tbody>
                                   <div class="dataTable-bottom">
                                   <div class="dataTable-info">Showing 21 to 30 of 57 entries</div>
                                   <nav class="dataTable-pagination"><ul class="dataTable-pagination-list">
                                   	<li class="pager"><a href="#" data-page="2">‹</a></li>
                                   	<li class=""><a href="#" data-page="1">1</a></li>
                                   	<li class=""><a href="#" data-page="2">2</a></li>
                                   	<li class="active"><a href="#" data-page="3">3</a></li>
                                   	<li class=""><a href="#" data-page="4">4</a></li>
                                   	<li class=""><a href="#" data-page="5">5</a></li>
                                   	<li class=""><a href="#" data-page="6">6</a></li>
                                   	<li class="pager"><a href="#" data-page="4">›
                                   	</a></li></ul></nav></div>
                                </table><br>
                           
                            </div>
                        </div>
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