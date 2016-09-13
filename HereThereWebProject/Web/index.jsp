<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<% 
	Member member = (Member)session.getAttribute("member");
%>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<% if(member == null){%>
	<form action="login" method="post"><%//로그인을 위한 폼, loginServlet으로 넘어감 %>
	id : <input type="text" name="memberId">
	password : <input type="password" name="memberPwd">
	<input type="submit" value="로그인">
	</form>
	<a href="member/memberJoin.html">회원가입</a><%//회원가입을 위한 서블릿으로 넘어감 %>
	<%}else{ %>
		<%= member.getMemberName()%>님 환영합니다.&nbsp; &nbsp;<br>
		<ul>
		<li><a href="/herethere/notice/notice.jsp">공지사항</a></li><%//공지사항 페이지로 이동%>
		<li><a href="mupView?mbid=<%= member.getMemberId()%>">정보수정</a></li><%//세션 아이디를 토대로 정보수정 페이지로 이동%>
		<li><a href="/herethere/notice/help.html">도움말</a></li><%//도움말 페이지로 이동%>
		<li><a href="mypage?">마이페이지</a></li><%//세션 아이디를 토대로 마이 페이지로 이동 %>
		<li><a href="logout">로그아웃</a></li><%//세션 아이디를 토대로 로그아웃 서블릿으로 이동%>
		<% if(member.getManagerYN() == 'Y'){ %>
		<li><a href="mall">전체 회원 정보</a></li>
		<% } %>
	</ul>
	<% } %>
</body>
</html>