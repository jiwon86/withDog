<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="a.b.c.com.map.vo.MapTradeVO"%>
<%-- 
	jsp:include : 내 서버내의 jsp파일만 가능
	c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<html lang="ko">
	<!-- 헤드 -->
<head>
<link rel="stylesheet" href="css/map/trade.css">
<%
	Object obj = request.getAttribute("mvo");
	String loginid = (String)request.getAttribute("loginid");
	if (obj == null) return;
	boolean myContent = false;
	boolean waitPropose = false;
	MapTradeVO mvo = (MapTradeVO)obj;
	String writer = mvo.getTwriter();
	String propose = mvo.getPropose();
	System.out.println("writer : " + writer + "id : " + loginid);
	if (loginid.equals(writer)) {
		myContent = true;
	}
	if (loginid.equals(propose)) {
		waitPropose = true;
	}
	
%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$('#submit').click(function(){
		console.log("신청");
		$("#aaa").attr({
			"action":"/mapTradeUpdate.wd",
			"method":"POST",
			"enctype":"application/x-www-form-urlencoded"
		}).submit();
	});
	
	$('#waiting').click(function(){
		alert("아직 신청 대기중 입니다!");
	});
	
	$('#waitingPu').click(function(){
		 if (confirm("승인 대기중 입니다. 취소 하시겠습니까?") == true){    //확인

		 }else{   //취소

		     return false;
		 }
	});
	
}); // end ready
</script>
</head>
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
				 	<header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="github"></i></div>
                                            	돌봄 신청하기
                                        </h1>
                                        <div class="page-header-subtitle">ID : </div>
                                    </div>
                                    <div class="col-12 col-xl-auto mt-4">WITH DOG</div>
                                </div>
                            </div>
                        </div>
                    </header>
                    
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                        <div class="card">
                            <div class="card-header"></div>
                            <div class="card-body">
	                            
	                            	<img src="/img/map/<%=mvo.getTphoto() %>" class="dogimg">
	                            
	                            	<ul class="list">돌봄 상세 사항
	                            		<li class="textcon"><textarea class="form-control" rows="3" disabled></textarea></li>
	                            		<li>돌봄 기간  : </li>
	                            		<li><img src="/image/map/coin.png" class="icons"> /li>
	                            		<li><img src="/image/map/doghouse.png" class="icons"> 주소</li>
	                            	</ul>
	                            	
	                            
	                        	<% if(myContent == true) { %>
	                        		<button class="btn btn-warning" id="waiting" type="button">돌봄이<br>구하는 중...</button>
                           		<% }else if (waitPropose == true){ %>
                           			<button class="btn btn-warning" id="waitingPu" type="button">승인 <br>대기중...</button>
                           		<% } else { %>
                           			<button class="btn btn-success" id="submit" type="button">신청하기</button>
                           		<% } %>
                            <form id="aaa">
                            	<input type="hidden" value="" name="TNO">
                            </form>
                            
                            </div>
                        </div>
                    </div>
					
					
				</main>
			
				
				<!-- 바닥글 -->
				<jsp:include page="/footer.wd" />

                
            </div>
			<!-- /콘텐츠 -->
        </div>
		
    </body>
</html>