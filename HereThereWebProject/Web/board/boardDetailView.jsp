<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, member.model.vo.Member, board.model.vo.Comment, java.util.ArrayList" %>
<% 
	Board b = (Board)request.getAttribute("board"); 
	Member m = (Member)session.getAttribute("member");
	ArrayList<Comment> list = (ArrayList<Comment>)request.getAttribute("cmlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail View</title>
<script type="text/javascript" src="/HereThere/js/jquery-3.1.0.min.js"></script>
</head>
<body>
	<div>제목<%=b.getBdTitle() %></div>
	<div>글쓴이<%=b.getBdWriter() %></div>
	<div>내용<%=b.getBdContent() %></div>
	<div>지도<%=b.getBdMap() %></div>
	<br>
	<a href="/HereThere/BoardUpView?bno=<%=b.getBdNo()%>">수정</a>
	<a href="/HereThere/BoardDelete?bno=<%=b.getBdNo()%>">삭제</a>
	<% if(list != null){ %>
			<% for(Comment c : list){ %>
	<% } %>
	<div>
		
	</div>
	<div>
		<form action="" method="get">
			<input type="hidden" name="bno" value="<%=b.getBdNo()%>">
			<input type="hidden" name="writer" value="">
			<textarea name="comment" cols="20" rows="4"></textarea>
			<input type="submit" value="댓글달기">
		</form>
	</div>
	
</body>
</html>