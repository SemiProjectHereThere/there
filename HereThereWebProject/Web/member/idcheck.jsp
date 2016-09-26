<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member" %>
<%
 	int count = Integer.parseInt((String)request.getAttribute("count"));
	String memberId = (String)request.getParameter("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크 </title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="shortcut icon" href="image/111.png.ico">
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link href="css/layout.css" rel="stylesheet" type="text/css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
	<script>
		function confirmIdCheck(){
			window.opener.document.writeForm.idCheck.value = 1;
			self.close();
		}
	</script>
</head>

<body>
<%
	if( count > 0 ){
%>
	<span> <%=memberId %> 는 이미 사용중인 아디입니다.</span>
	<input button value="닫기" onclick="self.close();">
<%
	}else {
%>
	<span> <%=memberId %> 은 사용가능한 아이디입니다.</span>
	<input button value="사용" onclick="confirmIdCheck();">
	<input button value="닫기" onclick="self.close();">

<%
	}
%>
</body>
</html>