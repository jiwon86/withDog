<%@page import="a.b.c.com.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
    <!-- Sidenav Toggle Button-->
    <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle">
    	<i data-feather="menu"></i>
    </button>

    <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="/">WITH DOG</a>

    <!-- Navbar Items-->
    <ul class="navbar-nav align-items-center ms-auto">

        <!-- Alerts Dropdown-->
        <sec:authorize access="isAuthenticated()">
        <li class="nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications">
            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownAlerts" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            	<i data-feather="bell"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownAlerts">
                <h6 class="dropdown-header dropdown-notifications-header">
                    <i class="me-2" data-feather="bell"></i>
                    Alerts Center
                </h6>
                <!-- Example Alert 1-->
                <a class="dropdown-item dropdown-notifications-item" href="#!">
                    <div class="dropdown-notifications-item-icon bg-warning"><i data-feather="activity"></i></div>
                    <div class="dropdown-notifications-item-content">
                        <div class="dropdown-notifications-item-content-details">December 29, 2021</div>
                        <div class="dropdown-notifications-item-content-text">This is an alert message. It's nothing serious, but it requires your attention.</div>
                    </div>
                </a>
                <!-- Example Alert 2-->
                <a class="dropdown-item dropdown-notifications-item" href="#!">
                    <div class="dropdown-notifications-item-icon bg-info"><i data-feather="bar-chart"></i></div>
                    <div class="dropdown-notifications-item-content">
                        <div class="dropdown-notifications-item-content-details">December 22, 2021</div>
                        <div class="dropdown-notifications-item-content-text">A new monthly report is ready. Click here to view!</div>
                    </div>
                </a>
                <!-- Example Alert 3-->
                <a class="dropdown-item dropdown-notifications-item" href="#!">
                    <div class="dropdown-notifications-item-icon bg-danger"><i class="fas fa-exclamation-triangle"></i></div>
                    <div class="dropdown-notifications-item-content">
                        <div class="dropdown-notifications-item-content-details">December 8, 2021</div>
                        <div class="dropdown-notifications-item-content-text">Critical system failure, systems shutting down.</div>
                    </div>
                </a>
                <!-- Example Alert 4-->
                <a class="dropdown-item dropdown-notifications-item" href="#!">
                    <div class="dropdown-notifications-item-icon bg-success"><i data-feather="user-plus"></i></div>
                    <div class="dropdown-notifications-item-content">
                        <div class="dropdown-notifications-item-content-details">December 2, 2021</div>
                        <div class="dropdown-notifications-item-content-text">New user request. Woody has requested access to the organization.</div>
                    </div>
                </a>
                <a class="dropdown-item dropdown-notifications-footer" href="#!">View All Alerts</a>
            </div>
        </li>
        </sec:authorize>

        <!-- User Dropdown-->
        <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
        	
        	<%
        	Member member = (Member)request.getAttribute("member");
	        	
        	%>
        	
        	<!-- 로그인 -->
        	<sec:authorize access="isAuthenticated()">
	            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" 
	               role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            	<sec:authorize access="isAuthenticated()">
		            	<% if(member.getMphoto() != null) { %>
		            		<img class="img-fluid" style="width:100%; height:100%;" src="/img/member/<%=member.getMphoto()%>" />
		            	<% } else { %>
		            		<img class="img-fluid" style="width:100%; height:100%;" src="/img/member/default.jpg" />
		            	<% } %>
	            	</sec:authorize>
	            </a>
	        </sec:authorize>
            
            <!-- 비로그인 -->
            <sec:authorize access="isAnonymous()">
            	<a href="/register.wd" class="btn btn-primary">회원가입</a>
            	<a href="/login.wd" class="btn btn-primary">로그인</button>
            </sec:authorize>
            
            <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                <h6 class="dropdown-header d-flex align-items-center">
                
                	<sec:authorize access="isAuthenticated()">
	                	<% if(member.getMphoto() != null) { %>
	                    	<img class="dropdown-user-img" src="/img/member/<%=member.getMphoto()%>" />
	                    <% } else { %>
	                    	<img class="dropdown-user-img" src="/img/member/default.jpg" />
	                    <% } %>
                    </sec:authorize>
                    
                    <div class="dropdown-user-details">
                    	<sec:authorize access="isAuthenticated()">
	                        <div class="dropdown-user-details-name">
	                        	<sec:authorize access="isAuthenticated()">
	                        		<%=member.getMname()%>
	                        	</sec:authorize>
	                        </div>
	                        <div class="dropdown-user-details-email">
	                        	<sec:authorize access="isAuthenticated()">
	                        		<%=member.getMid()%>
	                        	</sec:authorize>
	                        </div>
                        </sec:authorize>
                    </div>
                </h6>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/profile.wd">
                    <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                                     내 프로필
                </a>

				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a class="dropdown-item" href="/admin.wd">
	                    <div class="dropdown-item-icon"><i data-feather="lock"></i></div>
	                                     관리자 모드
	                </a>
                </sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<form action="/logout.wd" method="post">
		                <button class="dropdown-item">
		                    <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
		                                     로그아웃              
		                </button>
		                <sec:csrfInput/>
		         	</form>
				</sec:authorize>
            </div>
            
        </li>
    </ul>
</nav>