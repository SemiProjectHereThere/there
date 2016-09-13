<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = (String)request.getAttribute("code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러</title>
</head>
<body>
	<h1>회원 관련 서비스 에러 페이지</h1>
	<%
		String message= null;
		switch(code){
		case "login" : message = "로그인이 실패하였습니다."; break;
		case "mjoin" : message = "회원가입이 실패하였습니다."; break;
		case "mupView" : message = "회원 정보 수정페이지로 이동이 실패하였습니다."; break;
		case "mupdate" : message = "회원 정보 수정이 실패하였습니다."; break;
		case "mdel" : message = "회원 탈퇴가 실패하였습니다."; break;
		case "mall" : message = "전체 회원 조회가 실패하였습니다."; break;
		default: message = "알 수 없는 에러가 발생하였습니다."; break;
		}
	%>
	에러 : <%= message %> <br>
	<a href="/HereThere/index.jsp">시작페이지로 이동</a>
</body>
</html>