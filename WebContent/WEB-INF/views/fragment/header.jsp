<%@page import="java.util.List"%>
<%@page import="a.b.c.com.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
  intent="WELCOME"
  chat-title="WithDog"
  agent-id="882aca03-f941-4ce4-8bc8-24bfd4043555"
  language-code="ko"
></df-messenger>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var info = "<h2>웹 브라우저 정보 확인</h2><br>"; 
	info += "<p>브라우저 이름 : " + navigator.appName + "</p>"; 
	info += "<p>브라우저 코드명 : " + navigator.appCodeName + "</p>"; 
	info += "<p>플랫폼 정보 : " + navigator.platform + "</p>"; 
	info += "<p>사용자 정보 : " + navigator.userAgent + "</p>"; 
	info += "<p>브라우저 버전 : " + navigator.appVersion + "</p><br>"; 
	console.log(navigator.userAgent);
	
	function isMobile() { 
		var user = navigator.userAgent; 
		var is_mobile = false; 
		
		if( user.indexOf("iPhone") > -1 || user.indexOf("Android") > -1 ) {
		 	is_mobile = true; 
		} 
		return is_mobile; 
	}
	
	$(document).ready(function() {
		var is_mobile = isMobile(); 
		if( is_mobile ) { 
			console.log("모바일로 접속하셨습니다."); 
			$("#browser").html("<i class='fas fa-circle fa-sm ms-3 text-teal'></i>&nbsp; 모바일 접속");
		} else { 
			console.log("PC로 접속하셨습니다. (" + isBrowserCheck() + ")");
			$("#browser").html("<i class='fas fa-circle fa-sm ms-3 text-teal'></i>&nbsp; PC 접속 (" + isBrowserCheck() + ")");
		}
	});
	
	function isBrowserCheck(){ 
		const agt = navigator.appVersion.toLowerCase(); 
		if (agt.indexOf("opera") != -1) return 'Opera'
		if (agt.indexOf("edg") != -1) return 'Edge'
		if (agt.indexOf("whale") != -1) return 'Whale'
		if (agt.indexOf("chrome") != -1) return 'Chrome'
		if (agt.indexOf("staroffice") != -1) return 'Star Office'
		if (agt.indexOf("webtv") != -1) return 'WebTV'
		if (agt.indexOf("beonex") != -1) return 'Beonex'
		if (agt.indexOf("chimera") != -1) return 'Chimera'
		if (agt.indexOf("netpositive") != -1) return 'NetPositive'
		if (agt.indexOf("phoenix") != -1) return 'Phoenix'
		if (agt.indexOf("firefox") != -1) return 'Firefox'
		if (agt.indexOf("safari") != -1) return 'Safari'
		if (agt.indexOf("skipstone") != -1) return 'SkipStone'
		if (agt.indexOf("netscape") != -1) return 'Netscape'
		if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla'
		if (agt.indexOf("msie") != -1) { 
	    	let rv = -1; 
			if (navigator.appName == 'Microsoft Internet Explorer') { 
				let ua = navigator.userAgent; var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})")
			if (re.exec(ua) != null) 
				rv = parseFloat(RegExp.$1)
			} 
			return 'Internet Explorer '+rv
		} 
	}
</script>

<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
    <!-- Sidenav Toggle Button-->
    <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle">
    	<i data-feather="menu"></i>
    </button>

    <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="/withmap.wd">WITH DOG</a>

    <!-- Navbar Items-->
    <ul class="navbar-nav align-items-center ms-auto">

        <!-- Alerts Dropdown-->
        <sec:authorize access="isAuthenticated()">
        <li class="nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications">
            <div class="text-md-end small" id="browser">
                           브라우저 체크
            </div>
            
            <%--  
            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownAlerts" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            	<i data-feather="bell"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownAlerts">
                <h6 class="dropdown-header dropdown-notifications-header">
                    <i class="me-2" data-feather="bell"></i>
                    	알림
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
            --%>
        </li>
        </sec:authorize>

        <!-- User Dropdown-->
        <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
        	
        	<%

        	       MemberVO member = (MemberVO)request.getAttribute("member");
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
            	<a href="/register.wd" class="btn btn-green btn-sm">회원가입</a>
            	<a href="/login.wd" class="btn btn-withcolor btn-sm">로그인</button>
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
	                        <div class="dropdown-user-details-email">
	                        	<sec:authorize access="isAuthenticated()">
	                        		<%=member.getMpoint()%>&nbsp;포인트
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