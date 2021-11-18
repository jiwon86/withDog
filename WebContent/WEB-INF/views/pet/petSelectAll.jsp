<%@page import="java.util.ArrayList"%>
<%@page import="a.b.c.com.pet.vo.PetVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	 
	
	
	$(document).ready(function(){	
		
		// pnoCheck 체크박스 체크 확인하기
		$(document).on("click", "#pno", function(){
			//alert("chkInSbnum >>> : ");		
			if($(this).prop('checked')){			 
				//$('input[type="checkbox"][name="sbnum"]').prop('checked',false);
				$('.pno').prop('checked',false);
				$(this).prop('checked',true);
			}
		});
		
		//  I
		$(document).on("click", "#I", function(){
			location.href="smemForm.bdm";
		});
		
		// SALL
		$(document).on("click", "#SALL", function(){
			console.log("눌러짐 테스트 >>>>");
			$("#petSelectAllForm").attr({"method":"GET", "action":"petSelectAll.bdm"}).submit();		
		});
				
		//  U
		$(document).on("click", "#U", function(){	
			if ($('.pno:checked').length == 0){
				alert("수정할 글번호 하나를 선택하세요!!");
				return;
			}
			$("#petSelectAllForm").attr({ "method":"GET","action":"smemSelect.bdm"}).submit();
		});
		//  D
		$(document).on("click", "#D", function(){	
			if ($('.pno:checked').length == 0){
				alert("삭제할 글번호 하나를 선택하세요!!");
				return;
			}
			$("#petSelectAllForm").attr({ "method":"GET", "action":"smemSelect.bdm"}).submit();
		});
	});

</script>	

</head>
<body>
<h3>TEST PAGE</h3>
<h3>나의 댕댕이 입장 성공</h3>
<h3>나의 댕댕이 리스트 조회</h3>
<input type="button" value="등록" id="I">
<input type="button" value="조회" id="SALL">
<input type="button" value="수정" id="U">
<input type="button" value="삭제" id="D">
<%
request.setCharacterEncoding("UTF-8");

Object obj = request.getAttribute("listAll");
if (obj == null) return;

ArrayList<PetVO> aList =(ArrayList<PetVO>)obj;
int nCnt = aList.size();
out.println(":::: 전체 조회 건수  " + nCnt + " 건");	
%>


<form name ="petSelectAllForm" id="petSelectAllForm">
<table border = "1">
<thead>
<tr>
	<td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
	<td class="tt">순번</td>
	<td class="tt">반려견번호</td>
	<td class="tt">이름</td>
	<td class="tt">종</td>
	<td class="tt">성별</td>
	<td class="tt">중성화여부</td>
	<td class="tt">몸무게</td>
	<td class="tt">병원</td>
	<td class="tt">참조사항</td>
	<td class="tt">생년월일</td>
	<td class="tt">회원번호</td>	
</tr>
</thead>
<%
for(int i=0; i<nCnt; i++){
	PetVO pvo = aList.get(i);

%>
<tbody>
	<tr>
		<td class="tt">
		<input type="checkbox" id="pnum" name="pnum" class="pnum" value=<%= pvo.getPno() %> >
	</td>		
	<td class="tt"><%=i+1%></td>
	<td class="tt"><%=pvo.getPno()%></td>
	<td class="tt"><%=pvo.getPname()%></td>
	<td class="tt"><%=pvo.getPtype()%></td>
	<td class="tt"><%=pvo.getPneutral()%></td>
	<td class="tt"><%=pvo.getPgender()%></td>
	<td class="tt"><%=pvo.getPweight()%></td>
	<td class="tt"><%=pvo.getPhospital()%></td>
	<td class="tt"><%=pvo.getPmemo()%></td>
	<td class="tt"><%=pvo.getPages()%></td>
	<td class="tt"><%=pvo.getPphoto()%></td>
	<td class="tt"><%=pvo.getMno()%></td>
	</tr>
	<% } %>
	<tr>
	<td colspan="20" align="right">				
		<input type="button" value="등록" id="I">
		<input type="button" value="조회" id="SALL">
		<input type="button" value="수정" id="U">
		<input type="button" value="삭제" id="D">									
	</td>
</tr>
</tbody>
</table>
</form>
</body>
</html>