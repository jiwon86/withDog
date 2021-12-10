<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>   
<%@page import="a.b.c.com.park.vo.ParkVO"%>
<%@page import="a.b.c.com.member.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
	jsp:include : 내 서버내의 jsp파일만 가능
	c:import : 외부 jsp 파일 접근 가능
--%>
<!DOCTYPE html>
<html lang="ko">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
$( document ).ready( function() {
    AOS.init();
 } );
</script>
<!-- 헤드 -->
<head>
<style>
.headerdog  {
		position : absolute;
		width : 15%;
		height : 250px;
		left : 65%
	}
.headerdog2  {
		position : absolute;
		width : 10%;
		height : 130px;
		left : 62%;
		top : 100px;	
	}
	
.btn.btn-sm.btn-light.text-primary {
	width : 165px;
	heigth : 100px;
	font-size : 20px;
}
</style>
<link rel="stylesheet" href="css/park/park.css">
<jsp:include page="/head.wd" />
</head>
<!-- /헤드 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

let mid = "${member.mid}";
console.log(mid);
		//U
		$(document).on("click", "#U", function(){
			 $(".movement").attr({ "method":"GET"
				                   ,"action":"parkSelect.wd"}).submit();
		}); 
		//  D
		$(document).on("click", "#D", function(){
			confirm("삭제하시겠습니까?");
			
			$(".movement").attr({ "method":"POST"
				                  ,"action":"parkDelete.wd"}).submit();
		});
		
		function emptyHeartBtn(e) {
			alert("빈하트 클릭");
			
			let fullHeartTag = `
	            <button class="btn btn-pink btn-icon mr-2  full-heart" style="margin-right:50px;" onclick="fullHeartBtn(this)">
	            
	                <!--  <i data-feather="heart"></i> -->
	            </button>
	            <div style="width:30px;position:relative" class="like" id="like">
	            	<div style="position:absolute;top:-500px; left:-80px;">
	            		<img src="../../image/park/like.gif">
	            	</div>
	            </div>
			`;
			$(e).parent().html(fullHeartTag);
			let likeg = document.getElementById("like");
			likeg.addEventListener("animationend" ,likeend);
			
		}
		
		function fullHeartBtn(e) {
			alert("풀하트 클릭");
			
			let emptyHeartTag = `
	            <button class="btn btn-pink btn-icon mr-2 empty-heart " style="margin-right:50px;" onclick="emptyHeartBtn(this)">
	            	
	                <!--  <i data-feather="heart"></i> -->
	            </button>		
			`;
			
			$(e).parent().html(emptyHeartTag);
		}
		
		function likeend () {
			this.classList.add("hidden");
		}
		
	$(document).ready(function(){

		selectAll();

		//댓글 삭제
		$(document).on("click", ".deleteBtn", function(){
			//alert("D >>> : ");
			
			var rinum = $(this).parents("li").attr("dataNum");
			var target = $(this).parents(".rbmemoItem");
			console.log("target >>> : " + target);
			
			let selectURL = "rparkDelete.wd";
			let method="POST";
			let dataParam = {
					rinum : rinum,
			};
			
			//dataParam = $("#jsonTestForm").serialize();
			//alert("dataParam >>> : " + dataParam);
			
			$.ajax({
				url : selectURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){
				//alert("resData >>> : " + resData);
				console.log("resData >>> : " + resData);
				if("GOOD" == resData){
					alert("댓글이 삭제되었습니다.");
					target.remove();
				}
			}
			function whenError(e){
				//alert("e >>> : " + e.responseText);
			}
		});
	});
	
	//게시글 번호로 댓글 전체조회
	function selectAll(){
		
		//alert("SALL >>> : ");
		
		let selectAllURL = "rparkSelectAll.wd";
		let method="POST";
		let dataParam = {
			inum: $("#inum").val(),
		};
		//dataParam = $("#jsonTestForm").serialize();
		//alert("dataParam >>> : " + dataParam);
		
		$.ajax({
			url: selectAllURL,
			type: method,
			data: dataParam,
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){
			//alert("resData >>> : " + resData);
			console.log("whenSuccess rparkSelectAll resData >>> : " + resData);
			
			if(isEmpty(resData)){
				return false;
			}
			
			let v = resData.split("&");
			for(let i=0; i<v.length-1; i++){
				console.log(v[i]);
				let vv = v[i].split(",");
				let j=0;
				for(; j<vv.length-1; j++){
					console.log("vv[j] >>> : " + vv[j]);
				}
				addNewItem(vv[0], vv[1], vv[2], vv[3], vv[4]);
			}
		}
		function whenError(e){
			alert("e >>> : " + e.responseText);
		}
	}
	
	function rparkInsert(e) {
		let inum = $(e).parent().find(".inum").val();

		console.log(e);

		
		let insertURL = "rparkInsert.wd";
		let method = "POST";
		let dataParam = {
				inum : inum,

	            ricontent : $("#"+inum+"comment").val(),
	            riname : mid

		};
		
		//dataParam = $("#rparkForm").serialize();
		//alert("dataParam >>> : " + dataParam);
		
		$.ajax({
			url : insertURL,
			type : method,
			data : dataParam,
			success : whenSuccess,
			error : whenError
		});
		
		function whenSuccess(resData){
			alert("resData >>> :" +resData);
			if("GOOD" == resData){
				rparkFormData();
				location.reload();
			}
		}
		
		function whenError(e){
			alert("e >>> : " + e.responseText);
			console.log("e >>> :  + e.responseText");
		}
	};
	
	//새로운 글 화면에 추가
	function addNewItem(num, writer, con, datetime, inum){
		
		console.log("inum >>> : " + inum);
		console.log("writer" + writer);
		
		//데이터 체크
		if(isEmpty(num)) return false;
		
		//새로운 글이 추가될 li태그
		var newLi = $("<li>");
		newLi.attr("dataNum", num);
		newLi.addClass("rbmemoItem");
		//작성자 정보가 지정될 <p> 태그
		var writerP = $("<p>");
		writerP.addClass("writer");
		//작성자 정보의 이름
		var nameSpan=$("<span>");
		nameSpan.addClass("name");
		nameSpan.html(decodeURIComponent(writer) + "님");
		//작성일시
		var dateSpan = $("<span>");
		dateSpan.html(" / " + datetime + " ");
		//삭제버튼
		var delInput = $("<input>");
		delInput.attr({"type":"button", "value":"삭제하기"});
		delInput.addClass("deleteBtn");
		//내용
		var contentP = $("<p>");
		
		contentP.html(decodeURIComponent(con));
		
		//조립하기
		writerP.append(nameSpan).append(dateSpan).append(delInput);
		newLi.append(writerP).append(contentP);
		

		 $("#"+inum).append(newLi);
	}
	
	//댓글길이 체크--------------------------------------
	//한글 포함 문자열 실이
	function getTextLength(s){
		var len =0;
		for(var i=0; i<s.length; i++){
			if(escape(s.charAt(i)).length == 6){
				len++;
			}
			len++;
		}
		return len;
	}
	function cut_200(obj){
		var t = $(obj).val();
		var l = t.length;
		while(getTextLength(t) > 200){
			l--;
			t= t.substring(0,1);
		}
		$(obj).val(t);
		$('.bytes').text(getTextLength(t));
	}
	
	//댓글 길이 체크------------------------------
	// 댓글 등록 후 입력창 초기화 (*오타)
	function rparkFormData() {
		$("#riname").val("");
		$("#ricontent").val("");
	}
	
	//데이터 체크
	function isEmpty(val){
		if(typeof val=="undefined" || val==null || val==""){
			return true;
		}else{
			return false;
		}
	}
</script>

<body class="nav-fixed">
<%
	Object obj = request.getAttribute("listAll");
	List<ParkVO> list = (List)obj;  
	
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
<main style="width: 960px; margin:0 auto;">		
	<header class="page-header page-header-light bg-withcolor pb-10">
		<div class="container-xl px-4">
			<div class="page-header-content pt-4">
				<!-- <img src="/image/header/header_pe_1.png" class="headerdog"> -->
				<!-- <img src="/image/header/header_dog_11.gif" class="headerdog2"> -->

					<div class="row align-items-center justify-content-between">
						<div class="col-auto mt-4">
							<h1 class="page-header-title">
								<div class="page-header-icon"><i data-feather="fab fa-instagram"></i></div>
								
								<img src="image/park/deng.png">
                       <a href="parkInsert.wd" style="text-decoration:none;"><button class="btn btn-warning" type="button" style="margin-left:380px;">사진 업로드</button></a>
						</h1>
					</div>
				</div>
			</div>
		</div>
	</header>	<div class="container-xl px-4 mt-n10">	
				<div style="width:760px; margin:0 auto;">
				
					<!-- 카드 -->
					<% 
						for(int i=0; i<nCnt; i++) {
							ParkVO svo = list.get(i);
							//svo.get
					%>
					
					<div class="card card-header-actions mx-auto mb-3 mt-3" style="clear:both;">
					    <div class="card-header">
					    	<div class="avatar avatar-xl" style="margin-left:330px;">
								<img class="avatar-img img-fluid me-2" src="img/park/<%= svo.getIphoto() %>">
								<!--<img class="avatar-img img-fluid me-2" >-->
								<span class="tt mr-4"><%= svo.getIid() %> </span>
								<!-- 수정/삭제 -->
								<div class="float-end" style="margin-left:570px;">
									<div class="dropdown">

								    	<button class="btn btn-transparent-dark" id="dropdownMenuButton" class="btn btn-primary dropdown-toggle" id="dropdownMenuButton" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									    	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical text-primary">
												<circle cx="12" cy="12" r="1"></circle>
												<circle cx="12" cy="5" r="1"></circle>
												<circle cx="12" cy="19" r="1"></circle>
											</svg>
								    	</button>
									    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									        <form name="movement" class="movement">
									        	<input type="hidden" name="inum" value="<%= svo.getInum() %>">
										        <input type="submit" class="dropdown-item" value="수정" id='U'>
										        <input type="submit" class="dropdown-item" value="삭제" id='D'>
									        </form>
									    </div>
									</div>
								</div>
							</div>
					    </div>
					    <div class="card-body">
					        <img class="avatar-img img-fluid" src="img/park/<%= svo.getIupload() %>" style="width:100%;">
					        
					    </div>
					    <div class="card-footer">
					    	
					    	<div class="float-end" style="margin-right:620px;">
					    		
					            <button class="btn btn-pink btn-icon mr-2 empty-heart" style="margin-right:50px;" onclick="emptyHeartBtn(this)">
					            	<i class="far fa-heart"></i>
					            </button>
					        </div>
					        <!-- 아이디/내용들어가는 곳 -->
					        <div style="margin-top:60px;">
						        <label class="miduam mb-1" for="inputNotificationSms">
						       		 <%= svo.getIid() %> -
						        </label>
						        <label class="small mb-1" for="inputNotificationSms">
						       		<%= svo.getIcontent() %>
						        </label>
						        
						        <!-- 댓글들어갈곳 -->
						         <!-- url붙여서 댓글 가져오기 -->
								 <c:import url="/rparkForm.wd">
								   <c:param name="inum" value="<%=svo.getInum()%>"></c:param>
								 </c:import>   
					        </div>
					        <!-- 오른쪽으로 옮기기 -->
					     	<span style="margin-left:620px;"><%= svo.getIinsert()%> </span>
					    </div>
					    <div style="clear:both;"></div>
					</div>
					
					 
					<%
						}
					%>
					<!-- /카드 -->
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