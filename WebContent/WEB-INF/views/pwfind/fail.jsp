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
	Object obj = (Object)request.getAttribute("num");
	Object memail = (Object)request.getAttribute("memail");
	System.out.println("obj >>> : " + obj);
	System.out.println("memail >>> : " + memail);

%>



<form action="/pw_auth.wd" id="aa" name="aa">
	<input type="hidden" id ="num"name ="num" value="<%=obj %>">
	<input type="hidden" id ="memail"name ="memail" value="<%=memail %>">
</form>

<script type="text/javascript">
	alert("인증번호가 틀렸습니다");
	let formdata = document.getElementById("aa");

	console.log("<%=obj %>");
	formdata.submit();
</script>

	
</body>
</html>