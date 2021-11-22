<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE DELETE</title>
</head>
<body>
NOTICE DELETE 중~
<hr>
<%
	String nnum = (String)request.getAttribute("nnum");
%>
<script>
	location.href="/noticeSelectAll.wd?nnum=<%=nnum%>";
</script>

</body>
</html>