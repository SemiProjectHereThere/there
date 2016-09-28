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
		case "myinfo" : message = "내 정보 보기 실패"; break;
		case "bdView" : message = "게시글 상세 보기 실패"; break;
		case "bupView" : message = "게시글 수정페이지 불러오기 실패"; break;
		case "mylist" : message = "마이페이지 리스트 보기 실패"; break;
		case "mylistFavorite" : message = "마이페이지 찜게시물 보기 실패"; break;
		case "mylistMine" : message = "마이페이지 내 글 보기 실패"; break;
		case "favoriteDel" : message = "찜 삭제 실패"; break;
		default : message = "게시글 서비스에서 알 수 없는 에러 발생";
		}
	%>
	<h3><%= message %></h3>
	<a href="/HereThere/index.jsp">시작페이지로 이동</a>
</body>
</html>