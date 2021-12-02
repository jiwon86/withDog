<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="a.b.c.com.qna.vo.QnaVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaSelectPaging</title>
<style type="text/css">
	.tt{
		text-align: center;
		font-weight: bold;
	}
	
</style>
<link rel="stylesheet" 
href="/common/datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/common/datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		/*
		CSS 선택자 우선순위 점수
		직접기입  : styl='' : 1000 점 
		id : #sbnum : 100점
		class : .sbnum : 10점
		속성 : [name="sbnum"] : 10점
		*/
		
		// sbnum
		$(document).on("click","#qnanum", function(){
			//alert("chkInSbnum >>> : ");
			if($(this).prop('checked')){
				//$('input[type="checkbox"][name="sbnum"]').prop('checked',false);
				$('.qnanum').prop('checked', false);
				$(this).prop('checked', true);
			}
		});
		
		//검색버튼
		// U
		$(document).on("click", "#searchBtn", function(){
			alert("searchBtn >>> : ");
			$("#qnaList").attr({"method":"GET",
								  "action":"qnaSelectAll.kmj"
								  }).submit();
		});
		
		//datepicker:from~to기간조회
		$("#startdate").datepicker({
			showOn: "button",    // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage: "/springKmj/img/cal_0.gif",
			buttonImageOnly: true,
			buttonText: "날짜선택",
			dateFormat: "yy-mm-dd",
			changeMonth: true,
			onClose: function(selectedDate){
				$("#enddate").datepicker("option", "minDate", selectedDate);
			}
		});
		
		$("#enddate").datepicker({
			showOn: "button",
			buttonImage: "/springKmj/img/cal_0.gif",
			buttonImageOnly: true,
			buttonText: "날짜선택",
			dateFormat: "yy-mm-dd",
			changeMonth: true,
			onClose: function(selectedDate){
				$("#startdate").datepicker("option", "maxDate", selectedDate);
			}
		});
	
		// I
		$(document).on("click", "#I", function(){
			//alert("I >>> : ");
			location.href="qnaForm.kmj";
		});
		
		// U
		$(document).on("click", "#U", function(){
			//alert("U >>> : ");
			if($('.sbnum:checked').length==0){
				alert("수정할 글번호 하나를 선택하세요!!");
				return;
			}
			$("#qnaList").attr({"method":"POST",
								  "action":"qnaSelect.kmj"
								}).submit();
		});
		
		// D
		$(document).on("click", "#D", function(){
			//alert("D >>> : ");
			if($('.sbnum:checked').length==0){
				alert("삭제할 글번호 하나를 선택하세요!!");
				return;
			}
			$("#qnaList").attr({"method":"POST",
								  "action":"qnaSelect.kmj"
								}).submit();
		});
	
	});
	
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	//페이징 변수 세팅
	int pageSize=0;	
	int groupSize=0;
	int curPage=0;
	int totalCount=0;
	
	Object objPaging = request.getAttribute("pagingQVO");
	QnaVO pagingQVO = (QnaVO)objPaging;
	
	Object obj = request.getAttribute("listAll");
	List<QnaVO> list = (List)obj;
	
	int nCnt = list.size();
	
	System.out.println("nCnt >>> : " + nCnt);
%>
<form name="qnaList" id="qnaList">
<table border="1" align="center">
<thead>
	<tr>
		<td colspan="10" align="center">
			<h2>Q&A 게시판</h2>
		</td>
	</tr>
	
	<tr>
		<td colspan="10" align="left">
		<select id="keyfilter" name="keyfilter">
			<option value="key1">제목</option>
			<option value="key2">내용</option>
			<option value="key3">제목+내용</option>
			<option value="key4">작성자</option>
			<option value="key5">글번호</option>
		</select>
		<input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br>
		<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일"><br>
		<input type="text" id="enddate" name="enddate" size="12" placeholder="종료일"><br>
		<input type="text" id="searchBtn" name="searchBtn">검색<br>
		</td>
	</tr>
	
	<tr>
		<td class="tt">체크</td>
		<td class="tt">글번호</td>
		<td class="tt">제목</td>
		<td class="tt">이름</td>
		<td class="tt">내용</td>
		<td class="tt">최종작성일</td>
		<td class="tt">사진</td>
	</tr>
</thead>

<%
	for(int i=0; i<nCnt; i++){
		QnaVO qvo = list.get(i);
		QnaVO.printVO(qvo);
		System.out.println("pagingQVO.getPageSize() :" + pagingQVO.getPageSize());
		pageSize = Integer.parseInt(pagingQVO.getPageSize()); //받아오는 거 가져옴
		
		System.out.println("pagingQVO.getGroupSize() :" + pagingQVO.getGroupSize());
		groupSize = Integer.parseInt(pagingQVO.getGroupSize());

		System.out.println("pagingQVO.getCurPage() :" + pagingQVO.getCurPage());
		curPage = Integer.parseInt(pagingQVO.getCurPage());
		
		System.out.println("qvo.getTotalCount() :" + qvo.getTotalCount());
		totalCount = Integer.parseInt(qvo.getTotalCount());//조회된 거 가져옴
		
		//totalCount = 6;
		
		
%>
<tbody>
	<tr>	
		<td align="center">
		<input type="checkbox" name="sbnum" id="sbnum" class="sbnum" value=<%=qvo.getQnanum() %>>
		</td>
		<td class="tt"><%= qvo.getQnanum() %></td>
		<td class="tt"><%= qvo.getQnatitle() %></td>
		<td class="tt"><%= qvo.getQnawriter() %></td>
		<td class="tt"><%= qvo.getQnacon() %></td>
		<td class="tt"><%= qvo.getQnaupdatedate() %></td>
		<td class="tt"><img src="/WithDog_kmj_work/fileupload/qna/sm_<%= qvo.getQnafile() %>"></td>
	</tr>
	
<%
	}//end of for
%>
<tr>
	<td colspan="7" align="right">
	<input type="button" value="글쓰기" id='I'>
	<input type="button" value="글수정" id='U'>	
	<input type="button" value="글삭제" id='D'>
	</td>
</tr>

<tr>
	<td colspan="7">
	<jsp:include page="qnaPaging.jsp" flush="true">
		<jsp:param name="url" value="qnaSelectPaging.kmj"/>
		<jsp:param name="str" value=""/>
		<jsp:param name="pageSize" value="<%=pageSize %>"/>
		<jsp:param name="groupSize" value="<%=groupSize %>"/>
		<jsp:param name="curPage" value="<%=curPage %>"/>
		<jsp:param name="totalCount" value="<%=totalCount %>"/>
	</jsp:include>
	</td>
</tr>
</tbody>
</table>
</form>
</body>
</html>