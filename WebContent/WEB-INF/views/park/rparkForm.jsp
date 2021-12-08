<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rqnaForm : 댓글</title>

</head>
<body>

<hr>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	String inum = request.getParameter("inum");
	System.out.println("rparkForm inum >>> : " + inum);
	String rinum = request.getParameter("rinum");
	System.out.println("rparkForm rinum >>> : " + rinum);
	
%>
<div id="rparkwriterdiv">
<!-- <form name="rparkForm" id="rparkForm"> -->
<table>
<tr style="float:left;">
	<td><sec:authentication property="principal.member.mid" />
	<td>
		<!-- <input type="text" name="rparktitle" id="rparktitle"/> -->
		

		<!-- <input type="hidden" name="rinum" id="rinum"> -->
	</td>
	
</tr>

<tr style="float:left;">
	<td>
		<!-- <textarea name="ricontent" id="ricontent" rows=5 cols="50" style="resize: none"></textarea>-->
		<input type="text" name="ricontent" id="<%=inum %>comment">
		<!-- 
		<div><span class="bytes">0</span>bytes</div>
		 -->
		<div style="text-align:right">
			<input type="hidden" name="inum" class="inum" id="inum" value="<%=inum %>">
			<input type="hidden" name="riname" class="riname" id="riname" value="<%=rinum%>">
            <div class="btn btn-warning" align="right" id="SAVEbtn" onclick="rparkInsert(this)">올리기</div>
         </div>
	</td> 
</tr>
<div style="clear:both;"></div>
</table>
<hr>
<ul name="rparklist" id="<%=inum %>">
	<!-- 동적 생성 요소가 들어오는 곳 -->
</ul>
<!-- </form> -->
</div>
</body>
</html>