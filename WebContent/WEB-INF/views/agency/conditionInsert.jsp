<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>conditionInsert</title>
</head>
<body>
<h2>conditionInsert</h2>
<%
	String cno = (String)request.getAttribute("cno");
%>

<script type="text/javascript">
	location.href=`/myConditionSelect.wd?cno=${cno}`;
</script>

</body>
</html>