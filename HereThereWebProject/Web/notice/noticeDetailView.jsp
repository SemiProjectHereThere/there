<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.Notice, member.model.vo.Member"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice detailView</title>
</head>
<body>
	<center>
		<h1><%= notice.getNoticeNo() %>번글 상세보기 페이지</h1>
		<form action="/HereThere/nupdate" method="post">
			<table border="1" cellspacing="0" width="600">
				<tr><th>글 번 호</th><td><input type="text" readonly name="noticeno" value="<%= notice.getNoticeNo() %>"></td></tr>
				<tr><th>글 제 목</th><td><input type="text" name="noticetitle" value="<%= notice.getNoticeTitle() %>"></td></tr>
				<tr><th>작 성 자</th><td><input type="text" name="noticewriter" value="<%= notice.getNoticeWriter() %>" readonly></td></tr>
				<tr><th>올린날짜</th><td><input type="text" name="noticedate" value="<%= notice.getNoticeDate() %>" readonly></td></tr>
				<tr><th>글 내 용</th><td><textarea rows="5" cols="50" name="noticecontent"><%= notice.getNoticeContent() %></textarea></td></tr>
				<tr><th colspan="2">
				<%
					Member member = (Member)session.getAttribute("member");
					if(member.getMemberId().equals(notice.getNoticeWriter())){
						//로그인한 사용자와 공지글 작성자 아이디가 같을 경우
				%>
					<input type="submit" value="수정하기"> &nbsp; &nbsp;
					<a href="/HereThere/ndelete?noticeno=<%= notice.getNoticeNo() %>">삭제하기</a> &nbsp; &nbsp;
				<% } %> 
					<a href="/HereThere/nlist">목록으로</a> &nbsp; &nbsp;
					<a href="/HereThere/index.jsp">시작페이지로</a>
				</th></tr>
			</table>
		</form>
	</center>
</body>
</html>