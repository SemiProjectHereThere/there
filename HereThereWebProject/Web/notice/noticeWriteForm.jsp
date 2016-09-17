<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<%
	Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice write</title>
</head>
<body>
	<center>
		<h1>새 공지글 작성</h1>
		<form action="/HereThere/ninsert" method="post">
			<table border="1" cellspacing="0" width="600">
				<tr><th>글 제 목</th><td><input type="text" name="noticetitle" size="70"></td></tr>
				<tr><th>작 성 자</th><td><input type="text" name="noticewriter" value="<%= member.getMemberId() %>" readonly></td></tr>
				<tr><th>글 내 용</th><td><textarea rows="5" cols="50" name="noticecontent"></textarea></td></tr>
				<tr><th colspan="2">
					<input type="submit" value="등록하기"> &nbsp; &nbsp;
					<a href="/HereThere/nlist">목록으로</a> &nbsp; &nbsp;
					<a href="/HereThere/index.jsp">시작페이지로</a>
				</th></tr>
			</table>
		</form>
	</center>
</body>
</html>