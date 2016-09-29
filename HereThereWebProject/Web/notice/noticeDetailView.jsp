<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.Notice, member.model.vo.Member"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
	int noticeNo = (Integer)request.getAttribute("noticeno");
	int pg = (Integer)request.getAttribute("pg");
	int endPg = (Integer)request.getAttribute("endpg");
	String userId = (String)request.getAttribute("userid");
	String userName = (String)request.getAttribute("username");
	String managerYN = (String)request.getAttribute("manageryn");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> YOGI JOGI </title>
<link rel="stylesheet" type="text/css" href="/HereThere/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/HereThere/css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="/HereThere/css/bootstrap.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- 페이지 탭부분 -->
	<link rel="shortcut icon" href="image/111.png.ico">
	<style type="text/css">
	.bd{
		margin: 0 100px 0 200px;
	}
	</style>
	
 </head>
<body>
<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="/HereThere/indexAction" title="여기저기">여기저기 here there</a>
			</h1>
			<div class="pull-right lnb">
				<% if(!managerYN.equals("Y")){ %>
				<div class="col-lg-4 pull-left"><a href="myInfo?memberId=<%= userId %>"><%= userName %></a></div>
				<% }else{ %>
				<div class="col-lg-4 pull-left"><%= userName %></div>
				<% } %>
			
				<!-- 로그인 정보 입력 -->
			
				<div class="col-lg-4 pull-left"><a href="/HereThere/logout">로그아웃</a></div>
				
				<!-- 회원가입 정보 입력 -->
				
				<% if(!managerYN.equals("Y")){ %>
				<div class="col-lg-4 pull-left menubar1">더보기
					<ul class="submenu">
						<li><a href="/HereThere/nlist?username=<%= userName %>&userid=<%= userId %>&pg=1&manageryn=<%= managerYN %>">공지사항</a></li>
						<li><a href="/HereThere/mupView?username=<%= userName %>&userId=<%= userId %>">내 정보 수정</a></li>
						<li><a href="/HereThere/member/helpPage.jsp?username=<%= userName %>&userId=<%= userId %>">도움말</a></li>
					</ul>
				</div>
				<% }else{ %>
				<div class="col-lg-4 pull-left menubar1">더보기
				<!-- 더보기 메뉴 -->
					<ul class="submenu">
						<li><a href="/HereThere/mall?username=<%= userName %>&userid=<%= userId %>&pg=1">회원관리</a></li>
						<li><a href="/HereThere/nlist?username=<%= userName %>&userid=<%= userId %>&pg=1&manageryn=<%= managerYN %>">공지사항</a></li>
						<li><a href="/HereThere/mupView?username=<%= userName %>&userId=<%= userId %>">내 정보 수정</a></li>
						<li><a href="/HereThere/help.html?username=<%= userName %>&userId=<%= userId %>">도움말</a></li>
					</ul>
				</div>
				<% } %>
				<!-- 도움말 페이지 -->
				
			</div>
		</div> 
		<!-- header End -->
		<!-- container2 컨텐츠 내용시작 -->
		<div class="container">
				<!-- 게시판 페이지 -->
				<table class="bd">
				  <tr>
				   <td>
				    <table width="100%" cellpadding="0" cellspacing="0" border="0">
				    <tr height="100"><td width="5"></td>
				    <td width="" bgcolor=""></td></tr>
				     <tr style="background:url('/HereThere/image/table_mid.gif') repeat-x; text-align:center;">
				      <td width="5"><img src="/HereThere/image/table_left.gif" width="5" height="30" /></td>
				      <td><%= n.getNoticeTitle() %></td>
				      <td width="5"><img src="/HereThere/image/table_right.gif" width="5" height="30" /></td>
				     </tr>
				    </table>
				   <table width="764">
				     <tr>
				      <td align="center" width="76">글번호</td>
				      <td width="319"><%= n.getNoticeNo() %></td>
				      <td width="0">&nbsp;</td>
				     </tr>
					 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
				    <tr>
				      <td align="center" width="76">아이디</td>
				      <td width="319"><%= n.getNoticeWriter() %></td>
				      <td width="0">&nbsp;</td>
				     </tr>
					 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
				    <tr>
				      <td align="center" width="76">작성일</td>
				      <td width="319"><%= n.getNoticeDate() %></td>
				      <td width="0">&nbsp;</td>
				     </tr>
				     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
				    <tr>
				      <td align="center" width="76">조회수</td>
				      <td width="319"><%= n.getCountView() %></td>
				      <td width="0">&nbsp;</td>
				     </tr>
				     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
				                <tr>
				      <td width="0"></td>
				                   <td width="399" colspan="2" height="200"><%= n.getNoticeContent() %>
				                </tr>
				     <tr height="1" bgcolor="#f58218"><td colspan="4" width="407"></td></tr>
				     <tr height="1" bgcolor="#f58218"><td colspan="4" width="407"></td></tr>
				     <tr align="center">
				      <td width="120">&nbsp;</td>
				      <td colspan="2" width="399" height="50" >
					  <input type=button value="목록" OnClick="javascript:document.location.href='/HereThere/nlist?pg=<%= pg %>&userid=<%= n.getNoticeWriter() %>&username=<%= userName %>&manageryn=<%= managerYN %>';">
					  <% if(managerYN.equals("Y")) { %>
					  <input type=button value="글쓰기"  OnClick="javascript:document.location.href='/HereThere/notice/noticeWriteForm.jsp?pg=<%= endPg %>&userid=<%= n.getNoticeWriter() %>&username=<%= userName %>&manageryn=<%= managerYN %>';">
					  <input type=button value="수정" OnClick="javascript:document.location.href='/HereThere/nmodify?noticeno=<%= noticeNo %>&pg=<%= pg %>&userid=<%= n.getNoticeWriter() %>&username=<%= userName %>&manageryn=<%= managerYN %>';">
					  <input type=button id="Btn" value="삭제" OnClick="javascript:document.location.href='/HereThere/ndelete?noticeno=<%= noticeNo %>&pg=<%= pg %>&userid=<%= n.getNoticeWriter() %>&username=<%= userName %>&manageryn=<%= managerYN %>&delete=9999';" >
					  <% } %>
				      <td width="0">&nbsp;</td>
				     </tr>
				    </table>
				   </td>
				  </tr>
				 </table>
				</div>
		
		<!-- container2 컨텐츠 내용END -->
	</body>
</html>