<%@page import="a.b.c.com.member.vo.MemberVO"%>
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
                                    <div class="col-12 col-xl-auto mb-3">
                                        <a class="btn btn-sm btn-light text-primary" href="user-management-groups-list.html">
                                            <i class="me-1" data-feather="users"></i>
                                            Manage Groups
                                        </a>
                                        <a class="btn btn-sm btn-light text-primary" href="user-management-add-user.html">
                                            <i class="me-1" data-feather="user-plus"></i>
                                            Add New User
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                       <%
               				Object obj = request.getAttribute("listAll");
              				List<MemberVO> listall = (List<MemberVO>)obj;
                    				
                			int nCnt = listall.size();
                    		System.out.println("list.size() >>> :" + listall.size());
                    		System.out.println();
                   		%>
                   
                    <script type="text/javascript">
                    
                    
                    </script>
                    <!-- Main page content-->
                    <div class="container-fluid px-4">
                        <div class="card">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                    		<th>유저 이미지</th>
                                            <th>유저 아이디</th>
                                            <th>유저 이름</th>
                                            <th>주소</th>
                                            <th>펫 정보</th>
                                            <th>최종 수정 일</th>
                                        </tr>
                                    </thead>
                                    
                                    <%
                                    	for(int i=0; i<nCnt; i++){
                                    		MemberVO member = listall.get(i);
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
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar me-2"><img class="avatar-img img-fluid" src="assets/img/illustrations/profiles/profile-1.png" /></div>
                                                </div>
                                                   
                                            </td>
                                            <td><%=mid %>
                                            <td><%=mname %></td>
                                            <td><%=mroadaddress %></td>
                                            <td>
                                                <span class="badge bg-green-soft text-green">포메라니안</span>
                                                <span class="badge bg-blue-soft text-blue">성별 : 남자</span>
                                                <span class="badge bg-red-soft text-red">성별 : 여자</span>
                                                <span class="badge bg-purple-soft text-purple">중성화 수술 : 유</span>
                                                <span class="badge bg-yellow-soft text-yellow">중성화수술 : 무(자연)</span>
                                            </td>
                                            <td><%=updatedate %></td>
                                            <td>
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark me-2" href="adminpro.wd?mid=<%=mid %>"> <i data-feather="edit"></i></a>
                                                
                                          
                                                
                                                <a class="btn btn-datatable btn-icon btn-transparent-dark" href="AdminDelete.wd?mno=<%=mno %>"><i data-feather="trash-2"></i></a>
                                            </td>
                                        </tr>
                                        <%
                                        }
                                        %>
                                    </tbody>
                                </table>
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