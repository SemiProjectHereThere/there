<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice list</title>
<link rel="stylesheet" type="text/css" href="/HereThere/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/HereThere/css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="/HereThere/css/bootstrap.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 </head>

 <body>
		<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="index.jsp" title="여기저기">여기저기 here there</a>
			</h1>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left"><a href="/HereThere/login.html">로그인</a></div>
			
				<!-- 로그인 정보 입력 -->
			
				<div class="col-lg-4 pull-left"><a href="/HereThere/join.html">회원가입</a></div>
				
				<!-- 회원가입 정보 입력 -->
				
				<div class="col-lg-4 pull-left">도움말</div>
				
				<!-- 도움말 페이지 -->
				
			</div>
		</div> 
		<!-- header End -->
		<!-- container2 컨텐츠 내용시작 -->
		<div class="container">
				<!-- 게시판 페이지 -->
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
				   <tr height="30"><td width="5"></td></tr>
				   <tr style="background:url('../image/table_mid.gif') repeat-x; text-align:center;">
				   <td width="5"><img src="../image/table_left.gif" width="5" height="30" /></td>
				   <td width="73">번호</td>
				   <td width="379">제목</td>
				   <td width="73">작성자</td>
				   <td width="164">작성일</td>
				   <td width="58">조회수</td>
				   <td width="7"><img src="../image/table_right.gif" width="5" height="30" /></td>
				   </tr>
					 	<tr align="center" bgcolor="#FFFFFF" height="30">
					 	<td colspan="6">등록된 글이 없습니다.</td>
					 	</tr>
					<tr height="25" align="center">
					<td align="center">&nbsp;</td>
					<td align="center"></td>
					<td align="left"><a href=""></a></td>
				    <td align="center"></td>
				    <td align="center"></td>
				    <td align="center"></td>
				    <td align="center">&nbsp;</td>
				    <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
				    <tr height="1" bgcolor="#f58218"><td colspan="6" width="752"></td></tr>
			</table><!-- #f58218 --><!-- #82B5DF -->
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			  <tr><td colspan="4" height="5"></td></tr>
			  <tr>
				<td align="center">
					
					</td>
					</tr>
				<tr align="center">
			   <td><input type=button value="글쓰기" OnClick="javascript:document.location.href='/HereThere/notice/noticeWriteForm.jsp';"></td>
			  </tr>
			 </table>
		</div>
		<!-- container2 컨텐츠 내용END -->
		
		<!-- footer Start -->
		
		<!-- footer End -->
	</body>
</html>