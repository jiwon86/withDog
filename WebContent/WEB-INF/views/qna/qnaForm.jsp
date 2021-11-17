<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA : 질문 게시판 : 글쓰기</title>
</head>
<body>
<form name="qnaFrom" id="qnaForm">
<table border = "1" align="center">
	<tr>
		<td colspan="2" align="center">Q&A 글쓰기</td>
	</tr>
	
	<tr>
		<td align="center">글 번호</td>
		<td><input type="text" name="qnanum" id="qnanum" size="20" readonly></td>
	</tr>
	
	<tr>
		<td align="center">제목</td>
		<td><input type="text" name="qnatitle" id="qnatitle" size="53"></td>
	</tr>
	
	<tr>
		<td align="center">작성자</td>
		<td><input type="text" name="qnawriter" id="qnawriter" size="53"></td>
	</tr>
	
	<tr>
		<td align="center">글 내용</td>
		<td><textarea name="qnacon" id="qnacon" size="50" rows="10"></textarea></td>
	</tr>
	
	<tr>
		<td align="center">이메일</td>
		<td><input type="text" name="qnaemail" id="qnaemail" size="50"></td>
	</tr>
	
	<tr>
		<td align="center">첨부 파일</td>
		<td><input type="file" name="qnafile" id="qnafile"></td>
	</tr>
	
	<tr>
		<td colspan="2" aling="center">
		<input type="button" value="글쓰기" id="qnabtn">
		</td>
	</tr>

</table>
</form>
</body>
</html>