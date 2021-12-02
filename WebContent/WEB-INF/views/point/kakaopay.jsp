<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String obj = (String)request.getAttribute("sname");
	String obj1 = (String)request.getAttribute("price");
%>
<script>
alert("결제가 성공 했습니다.");
alert(obj);
location.href="point.wd";
</script>
</body>
</html>