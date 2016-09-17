<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = (String)request.getAttribute("code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board error</title>
</head>
<body>
	<h1>게시글 에러 페이지</h1>
	<%
		String message = null;
		switch(code){
		case "binsert" : message = "게시글 추가 실패"; break;
		case "bdelete" : message = "게시글 삭제 실패"; break;
		case "bupdate" : message = "게시글 수정 실패"; break;
		default : message = "게시글 서비스에서 에러 발생";
		}
	%>
	<h3><%= message %></h3>
	<a href="/HereThere/index.jsp">시작페이지로 이동</a>
</body>
</html>