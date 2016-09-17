<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//자바 일반 로직 소스 작성 구역을 의미함 : 스크립트릿(scriptlet) 태그
	String code = (String)request.getAttribute("code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice error</title>
</head>
<body>
	<h1>공지글 관련 에러 페이지</h1>
	<%
		String message = null;
		switch(code){
		case "nlist" : message = "공지글 조회서비스가 실패하였습니다."; break;
		case "ndetail" : message = "공지글 상세조회 서비스가 실패하였습니다."; break;
		case "ndelete" : message = "공지글 삭제가 실패하였습니다."; break;
		case "nupdate" : message = "공지글 수정이 실패하였습니다."; break;
		case "ninsert" : message = "새 공지글 등록이 실패하였습니다."; break;
		default : message = "공지서비스에서 에러가 발생하였습니다."; break;
		}
	%> 
	<h2>에러 : <%= message%><%-- <% out.print(message); %> --%></h2>
	<a href="/HereThere/index.jsp">시작페이지로 이동</a>
</body>
</html>