<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
    <nav class="sidenav shadow-right sidenav-light">
        <div class="sidenav-menu">
            <div class="nav accordion" id="accordionSidenav">
            	
            	<div class="sidenav-menu-heading nanum">메인기능</div>
                <a class="nav-link" href="withmap.wd">
                    <div class="nav-link-icon"><i data-feather="map-pin"></i></div>
                    <span class="hahmlet">돌봄찾기</span>
                </a>
                
                <!-- 권한 테스트 -->
                   <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseUserService" aria-expanded="false" aria-controls="collapseUserService">
                    <div class="nav-link-icon"><i data-feather="lock"></i></div>
                    <span class="hahmlet">관리자 페이지</span>
                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                 <div class="collapse" id="collapseUserService" data-bs-parent="#accordionSidenavCustomerCenter">
                    <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavCustomerCenterPages">
                        <a class="nav-link hahmlet" href="AdminMemberSelectAll.wd">회원리스트</a>
                        <a class="nav-link hahmlet" href="dashboard-2.html">마커리스트</a>
                    </nav>
                </div>                     
       
                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseCareService" aria-expanded="false" aria-controls="collapseCareService">
                    <div class="nav-link-icon"><i data-feather="github"></i></div>
                    <span class="hahmlet">돌봄서비스</span>
                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseCareService" data-bs-parent="#accordionSidenavCareService">
                    <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavCareServicePages">
                        <a class="nav-link hahmlet" href="dashboard-1.html">돌봄신청</a>

                        <a class="nav-link hahmlet" href="/offerSelectAll.wd">내돌봄현황</a>
                        <a class="nav-link hahmlet" href="/offerSelectAllPaging.wd">돌봄현황(돌봄신청현황, 조건제시현황)</a>

                    </nav>
                </div>   
                 
                <div class="sidenav-menu-heading nanum">보조기능</div>
                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseCustomerCenter" aria-expanded="false" aria-controls="collapseCustomerCenter">
                    <div class="nav-link-icon"><i data-feather="headphones"></i></div>
                    <span class="hahmlet">고객센터</span>
                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseCustomerCenter" data-bs-parent="#accordionSidenavCustomerCenter">
                    <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavCustomerCenterPages">
                        <a class="nav-link hahmlet" href="reviewInsertForm.wd">돌봄후기</a>
                        <a class="nav-link hahmlet" href="dashboard-2.html">공지사항</a>
                        <a class="nav-link hahmlet" href="dashboard-1.html">이용후기</a>
                        <a class="nav-link hahmlet" href="noticeSelectPaging.wd">공지사항</a> 
                      <a class="nav-link hahmlet" href="qnaSelectAll.wd">Q&A</a>
                    </nav>
                </div>       
                
                <div class="sidenav-menu-heading nanum">SNS</div>
                     <a class="nav-link" href="/parkForm.wd">
                    <div class="nav-link-icon"><i data-feather="camera"></i></div>
                    <span class="hahmlet">산책스타그램</span>
                </a>    
            	
            	<%-- 
=======
	<nav class="sidenav shadow-right sidenav-light">
		<div class="sidenav-menu">
			<div class="nav accordion" id="accordionSidenav">

				<div class="sidenav-menu-heading nanum">메인기능</div>
				<a class="nav-link" href="withmap.wd">
					<div class="nav-link-icon">
						<i data-feather="map-pin"></i>
					</div> <span class="hahmlet">돌봄찾기</span>
				</a>

				<!-- 권한 테스트 -->
				<a class="nav-link collapsed" href="javascript:void(0);"
					data-bs-toggle="collapse" data-bs-target="#collapseUserService"
					aria-expanded="false" aria-controls="collapseUserService">
					<div class="nav-link-icon">
						<i data-feather="lock"></i>
					</div> <span class="hahmlet">관리자 페이지</span>
					<div class="sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseUserService"
					data-bs-parent="#accordionSidenavCustomerCenter">
					<nav class="sidenav-menu-nested nav accordion"
						id="accordionSidenavCustomerCenterPages">
						<a class="nav-link hahmlet" href="AdminMemberSelectAll.wd">회원리스트</a>
						<a class="nav-link hahmlet" href="dashboard-2.html">마커리스트</a>
					</nav>
				</div>

				<a class="nav-link collapsed" href="javascript:void(0);"
					data-bs-toggle="collapse" data-bs-target="#collapseCareService"
					aria-expanded="false" aria-controls="collapseCareService">
					<div class="nav-link-icon">
						<i data-feather="github"></i>
					</div> <span class="hahmlet">돌봄서비스</span>
					<div class="sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseCareService"
					data-bs-parent="#accordionSidenavCareService">
					<nav class="sidenav-menu-nested nav accordion"
						id="accordionSidenavCareServicePages">
						<a class="nav-link hahmlet" href="dashboard-1.html">돌봄신청</a> <a
							class="nav-link hahmlet" href="takerequest.wd">내돌봄현황</a> =======
						<a class="nav-link hahmlet" href="selectTrade.wd">내돌봄현황</a>
					</nav>
				</div>

				<div class="sidenav-menu-heading nanum">보조기능</div>
				<a class="nav-link collapsed" href="javascript:void(0);"
					data-bs-toggle="collapse" data-bs-target="#collapseCustomerCenter"
					aria-expanded="false" aria-controls="collapseCustomerCenter">
					<div class="nav-link-icon">
						<i data-feather="headphones"></i>
					</div> <span class="hahmlet">고객센터</span>
					<div class="sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseCustomerCenter"
					data-bs-parent="#accordionSidenavCustomerCenter">
					<nav class="sidenav-menu-nested nav accordion"
						id="accordionSidenavCustomerCenterPages">
						<a class="nav-link hahmlet" href="dashboard-1.html">이용후기</a> <a
							class="nav-link hahmlet" href="dashboard-2.html">공지사항</a> <a
							class="nav-link hahmlet" href="qnaSelectAllPaging.wd">Q&A</a> <a
							class="nav-link hahmlet" href="noticeSelectPaging.wd">공지사항</a> <!-- <a
							class="nav-link hahmlet" href="qnaSelectAll.wd">Q&A</a> -->
					</nav>
				</div>

				<div class="sidenav-menu-heading nanum">SNS</div>
				<a class="nav-link" href="/parkForm.wd">
					<div class="nav-link-icon">
						<i data-feather="camera"></i>
					</div> <span class="hahmlet">산책스타그램</span>
				</a>

				<%-- 
                <div class="sidenav-menu-heading d-sm-none">Account</div>
                <a class="nav-link d-sm-none" href="#!">
                    <div class="nav-link-icon"><i data-feather="bell"></i></div>
                    Alerts
                    <span class="badge bg-warning-soft text-warning ms-auto">4 New!</span>
                </a>
                --%>

				<%--  
                <div class="sidenav-menu-heading">Core</div>
                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">
                    <div class="nav-link-icon"><i data-feather="activity"></i></div>
                    Dashboards
                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseDashboards" data-bs-parent="#accordionSidenav">
                    <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                        <a class="nav-link" href="dashboard-1.html">
                            Default
                            <span class="badge bg-primary-soft text-primary ms-auto">Updated</span>
                        </a>
                        <a class="nav-link" href="dashboard-2.html">Multipurpose</a>
                        <a class="nav-link" href="dashboard-3.html">Affiliate</a>
                    </nav>
                </div>
                --%>

				<%--
                <div class="sidenav-menu-heading">Custom</div>

                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                    <div class="nav-link-icon"><i data-feather="grid"></i></div>
                    Pages
                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapsePages" data-bs-parent="#accordionSidenav">
                    <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPagesMenu">
                        <!-- Nested Sidenav Accordion (Pages -> Account)-->
                        <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAccount" aria-expanded="false" aria-controls="pagesCollapseAccount">
                            Account
                            <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="pagesCollapseAccount" data-bs-parent="#accordionSidenavPagesMenu">
                            <nav class="sidenav-menu-nested nav">
                                <a class="nav-link" href="account-profile.html">Profile</a>
                                <a class="nav-link" href="account-billing.html">Billing</a>
                                <a class="nav-link" href="account-security.html">Security</a>
                                <a class="nav-link" href="account-notifications.html">Notifications</a>
                            </nav>
                        </div>
                        <!-- Nested Sidenav Accordion (Pages -> Authentication)-->
                        <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                            Authentication
                            <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="pagesCollapseAuth" data-bs-parent="#accordionSidenavPagesMenu">
                            <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPagesAuth">
                                <!-- Nested Sidenav Accordion (Pages -> Authentication -> Basic)-->
                                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuthBasic" aria-expanded="false" aria-controls="pagesCollapseAuthBasic">
                                    Basic
                                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseAuthBasic" data-bs-parent="#accordionSidenavPagesAuth">
                                    <nav class="sidenav-menu-nested nav">
                                        <a class="nav-link" href="auth-login-basic.html">Login</a>
                                        <a class="nav-link" href="auth-register-basic.html">Register</a>
                                        <a class="nav-link" href="auth-password-basic.html">Forgot Password</a>
                                    </nav>
                                </div>
                                <!-- Nested Sidenav Accordion (Pages -> Authentication -> Social)-->
                                <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuthSocial" aria-expanded="false" aria-controls="pagesCollapseAuthSocial">
                                    Social
                                    <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseAuthSocial" data-bs-parent="#accordionSidenavPagesAuth">
                                    <nav class="sidenav-menu-nested nav">
                                        <a class="nav-link" href="auth-login-social.html">Login</a>
                                        <a class="nav-link" href="auth-register-social.html">Register</a>
                                        <a class="nav-link" href="auth-password-social.html">Forgot Password</a>
                                    </nav>
                                </div>
                            </nav>
                        </div>
                        <!-- Nested Sidenav Accordion (Pages -> Error)-->
                        <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                            Error
                            <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="pagesCollapseError" data-bs-parent="#accordionSidenavPagesMenu">
                            <nav class="sidenav-menu-nested nav">
                                <a class="nav-link" href="error-400.html">400 Error</a>
                                <a class="nav-link" href="error-401.html">401 Error</a>
                                <a class="nav-link" href="error-403.html">403 Error</a>
                                <a class="nav-link" href="error-404-1.html">404 Error 1</a>
                                <a class="nav-link" href="error-404-2.html">404 Error 2</a>
                                <a class="nav-link" href="error-500.html">500 Error</a>
                                <a class="nav-link" href="error-503.html">503 Error</a>
                                <a class="nav-link" href="error-504.html">504 Error</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="pricing.html">Pricing</a>
                        <a class="nav-link" href="invoice.html">Invoice</a>
                    </nav>
                </div>
                --%>

				<%-- 
                <!-- Sidenav Heading (Addons)-->
                <div class="sidenav-menu-heading">Plugins</div>
                <!-- Sidenav Link (Charts)-->
                <a class="nav-link" href="charts.html">
                    <div class="nav-link-icon"><i data-feather="bar-chart"></i></div>
                    Charts
                </a>
                <!-- Sidenav Link (Tables)-->
                <a class="nav-link" href="tables.html">
                    <div class="nav-link-icon"><i data-feather="filter"></i></div>
                    Tables
                </a>
                --%>

			</div>
		</div>
		<!-- Sidenav Footer-->
		<div class="sidenav-footer">
			<div class="sidenav-footer-content">
				<div class="sidenav-footer-subtitle" id="time">현재 시간</div>
				<div class="sidenav-footer-title" id="weather"></div>
				<script>
       const clock = document.getElementById("time");
       const weather = document.getElementById("weather");
       let weather_icon;
	   function getClock() {
		   const date = new Date();
		   const hours = String(date.getHours()).padStart(2,"0");
		   const minutes =  String(date.getMinutes()).padStart(2,"0");
		   const seconds =  String(date.getSeconds()).padStart(2,"0");
		   clock.innerText = "TIME : "+hours+":"+minutes+":"+seconds;
		}
	   
	   function getlocation () {
		 //HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		 	if (navigator.geolocation) {
		 	    
		 	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		 	    navigator.geolocation.getCurrentPosition(function(position) {
		 	        
		 	        var lat = position.coords.latitude, // 위도
		 	            lon = position.coords.longitude; // 경도
		 	            
		 	       const url = "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid=e4e122a0b207778f1b37f15db40470ad";
		 	      
		 	    	  
		 	    	    fetch(url)
		 	    	    .then((response) => response.json())
		 	    	    .then((data) => {
		 	    	        const name = data.name;
		 	   	        	const temp = data.main.temp;
		 	    	        const weather_main = data.weather[0].main;
		 	    	        weather_icon = document.createElement("img");
		 	    	        weather_icon.setAttribute('src','/image/weather/'+weather_main+'.png');
		 	    	        weather_icon.setAttribute('class','weather_icon');
		 	    	        weather_icon.setAttribute('width','60px');
		 	    	        weather.appendChild(weather_icon);
		 	    	      
		 	    	        console.log(weather_main);
     
		 	    	    });
		 	 
		 	            
		 	      });
		 	}else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		 	    alert("브라우저가 최신 버전이 아닙니다!");
		 	}
		 }
	
	getlocation();
	getClock();
	setInterval(getClock, 1000);
</script>
			</div>
		</div>
	</nav>
</div>