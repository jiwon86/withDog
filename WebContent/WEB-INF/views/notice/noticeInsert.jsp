<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE INSERT</title>
</head>
<body>
NOTICE INSERT 중~
<hr>
<% String nnum = (String)request.getAttribute("nnum"); %>
<script>
	location.href="/noticeSelect.wd?nnum=<%=nnum%>";
</script>

</body>
</html>