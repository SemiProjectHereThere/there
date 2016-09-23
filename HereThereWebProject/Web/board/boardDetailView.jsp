<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board" %>
<% Board b = (Board)request.getAttribute("board"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail View</title>
</head>
<body>
	<div>제목<%=b.getBdTitle() %></div>
	<div>글쓴이<%=b.getBdWriter() %></div>
	<div>내용<%=b.getBdContent() %></div>
	<div>지도<%=b.getBdMap() %></div>
	<br><br>
	<% 
		String s = b.getBdContent();
		String k = s.substring(s.indexOf("/HereThere/SE2"), s.indexOf("&#10;&#10;"));
	%>
	<%=k %>
	<br>
	<a href="/HereThere/board/BoardUpView?bno=<%=b.getBdNo()%>">수정</a>
	<a href="/HereThere/board/BoardDelete?bno=<%=b.getBdNo()%>">삭제</a>
	<div>댓글라인</div>
</body>
</html>