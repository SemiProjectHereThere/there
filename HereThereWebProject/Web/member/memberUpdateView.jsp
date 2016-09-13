<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.sql.Date"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<html>
<head>
<meta charset="UTF-8">
<title>memberUpdateView</title>
</head>
<body>
<center>
	<form action="mupdate" method="post">
		<table width="700">
		<tr bgcolor="yellow">
		<th width="150">항 목</th><th width="550">내 용</th></tr>
		<tr><td bgcolor="#66ccff" align="center">아 이 디</td>
			<td><input type="text" id="mbid" name="mbid" readonly value="<%= member.getMemberId()%>"></td></tr>
		<tr><td align="center">이 &nbsp; 름</td>
			<td><input type="text" id="mbname" name="mbname" required value="<%= member.getMemberName()%>"></td></tr>
		<tr><td bgcolor="#66ccff" align="center">암 &nbsp; 호</td>
			<td><input type="password" id="mbpwd1" name="mbpwd" required value="<%= member.getMemberPwd()%>"></td></tr>
		<tr><td align="center">암호확인</td>
			<td><input type="password" id="userpwd2" required></td></tr>
		<tr><td align="center">이 메 일</td>
			<td><input type="email" name="email" id="email" value="<%= member.getEmail() %>"></td></tr>
		<tr><td bgcolor="#66ccff" align="center">성 &nbsp; 별</td>
			<td>
			<%
				if(member.getGender() == 'M'){
			%>
			<input type="radio" name="gender" value="M" checked> 남  &nbsp;
			<input type="radio" name="gender" value="F"> 여  
			<% }else if(member.getGender() == 'F'){ %>
			<input type="radio" name="gender" value="M" > 남  &nbsp;
			<input type="radio" name="gender" value="F" checked> 여 
			<% } %>
			</td></tr>
		<tr><td bgcolor="#66ccff" align="center">생 &nbsp; 일</td>
			<td><input type="date" name="birthdate" value="<%= member.getBirthday()%>"></td></tr>
		<tr><td align="center">전화번호</td>
			<td><input type="tel" name="phone" placeholder="- 포함 입력" value="<%= member.getPhone()%>"></td></tr>
		
		<tr><td bgcolor="#66ccff" colspan="2" align="center">
			<input type="submit" value="수정하기"> &nbsp;
			<a href="mdel?mbid=<%= member.getMemberId() %>">탈퇴하기</a> &nbsp;
			<input type="button" value="취소" onclick="javascript:history.go(-1);">
		</td></tr>
	</table>
	</form>
</center>
</body>
</html>