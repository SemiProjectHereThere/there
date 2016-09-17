<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,notice.model.vo.Notice, member.model.vo.Member" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice list</title>
</head>
<body>
<center>
	<h1>공지 서비스</h1>
	<p/>
	<!-- 버튼은 관리자 경우에만 보이도록 설정 -->
	<%
		if(member.getManagerYN() == 'Y'){
	%>
	<button onclick="javascript:document.location.href='/HereThere/notice/noticeWriteForm.jsp'">글쓰기</button>
	<% } %>
	<p/><p/>
	<table border="1" width="800" cellspacing="0" cellpadding="3">
		<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th><tr>
		<%
			for(Notice n : list){
		%>
			<tr><td><%= n.getNoticeNo() %></td>
				<td><a href="/HereThere/ndetail?noticeno=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a></td>
				<td><%= n.getNoticeWriter() %></td>
				<td><%= n.getNoticeDate() %></td>
				<td><%= n.getCountView() %></td>
			</tr>
		<% } %>
	</table>
	<p/>
	<a href="/HereThere/nlist">전체 목록 보기</a> &nbsp; &nbsp;
	<a href="/HereThere/index.jsp">시작 페이지로</a>
</center>
</body>
</html>