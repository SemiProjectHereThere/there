<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, member.model.vo.Member"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%>
<html>
<head>
<meta charset="UTF-8">
<title>member list</title>
</head>
<body>
	<h1>회원 목록</h1>
	<table border="1" width="700">
		<tr><th>아이디</th><th>이름</th><th>이메일</th><th>성별</th><th>전화번호</th><th>가입날짜</th><th>관리자여부</th></tr>
		<%
			for(Member m : list){
		%>
		<tr>
			<td><%= m.getMemberId() %></td>
			<td><%= m.getMemberName() %></td>
			<td><%= m.getEmail() %></td>
			<td>
				<%
					 if(m.getGender() == 'M'){
				 %> 남자
				 <% }else if(m.getGender() == 'F'){ %>
				 	여자
				 <% } %>
			</td>
			<td><%= m.getPhone() %></td>
			<td><%= m.getJoinDate() %></td>
			<form action="/managerUp" method="post">
			<td><input type="checkbox" name="manager" value="check"
			<% if(m.getManagerYN() == 'Y'){ %>
				checked>
			<% } %>
			</tr>
		<% } %>
			<input type="submit" value="수정하기">
			</form>
	</table>
</body>
</html>