<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member, member.model.service.MemberService"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page view</title>
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
</head>
<body>
	<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="#" title="여기저기">여기저기 here there</a>
			</h1>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left"><%= member.getMemberName() %></div>
				<div class="col-lg-4 pull-left menubar1">더보기
					<ul class="submenu">
						<li><a href="/HereThere/logout">로그아웃</a></li>
						<li><a href="/HereThere/myInfo?userid=<%= member.getMemberId() %>">마이페이지</a></li>
						<li><a href="/HereThere/nlist?userid=<%= member.getMemberId() %>">공지사항</a></li>
						<li><a href="#">내 정보 수정</a>
						<li><a href="/HereThere/nlist">공지사항</a></li>
						<li><a href="/HereThere/help.html">도움말</a></li>
					</ul>
				</div>
			</div>
		</div> 
		<!-- header End -->

		<!-- Container Start -->
		<div class="container pt-80">
			<!-- 첫번째 라인 -->
			<div class="col-lg-12 first-line-400">
				<%-- <% System.out.println(member.getRenameCoverName()); %>
				<% System.out.println(request.getContextPath());%> --%>
				
				<% if(member.getRenameCoverName() == null){ %>
				<img class="cover-pic" src="uploadfiles/cover.jpg">
				<% }else{ %>
				<img class="cover-pic" src="<%=request.getContextPath()%>\uploadfiles\<%= member.getMemberId() %>cover.png">
				<% } %>
				
				<% if(member.getRenameProfileName() == null){ %>
				<img class="profile-pic" src="uploadfiles/profile.jpg">
				<% }else{ %>
				<img class="profile-pic" src="<%=request.getContextPath()%>\uploadfiles\<%= member.getMemberId() %>profile.png">
				<% } %>
				<div class="name-div">
					<%= member.getMemberName() %>
				</div>
				<div class="pic-change-btns">
					<div class="button"><a href="#covermodal" id="modaltrigger">커버사진 변경</a></div> &nbsp; &nbsp;
					<div id="covermodal" style="display:none;">
					<form method="post" action="/HereThere/coverUp" name="coverform" enctype="multipart/form-data">
					<h3>COVER 사진 변경</h3> <br>
					<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
					<input type="hidden" name="memberid" value=<%= member.getMemberId() %>>
					<input type="button" value="사진 삭제" onclick="location.href='coverdel?memberid=<%= member.getMemberId() %>'">
					<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
					</form>
					</div>

			<!--모달윈도우부분-->
			<script type="text/javascript">
				 $(function(){
					/* $('#coverform').submit(function(e){
						return true;
					}); */
  
					$('#modaltrigger').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
				});
			</script>
			<!--//모달윈도우부분-->

					<div class="button"><a href="#profilemodal" id="modaltrigger1">프로필사진 변경</a></div>
					<div id="profilemodal" style="display:none;">
					<form method="post" action="/HereThere/profileUp" enctype="multipart/form-data" name="profileform">
					<h3>PROFILE 사진 변경</h3> <br>
					<input type="file" id="theFileInput2" accept=".png" size="40" name="profilefile">
					<input type="hidden" name="memberid" value=<%= member.getMemberId() %>>
					<input type="button" value="사진 삭제" onclick="location.href='profiledel?memberid=<%= member.getMemberId() %>'">
					<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
					</form>
					</div>
			<!--모달윈도우부분-->
			<script type="text/javascript">
				$(function(){
					/* $('#profileform').submit(function(e){
						return true;
					}); */
  
					$('#modaltrigger1').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
				});
			</script>
			<!--//모달윈도우부분-->
				</div>
			</div>
			<!-- 첫번째 라인 End -->
			<!-- 두번째 라인 Start -->
			<div class="col-lg-12 first-line">
				<div class="select-local col-lg-6">
					<select>
						<option value="">전체보기</option>
						<option value="">찜한 게시물</option>
						<option value="">내가 올린 게시물</option>
					 </select>
				</div>
				<div class="select-local col-lg-6">
					<button type="button" class="btn2" onclick="location.href='/HereThere/board/boardWriteForm.jsp'"> 
						게시물 올리기
					</button>
				</div>
			</div>
			<!-- 두번째 라인 End -->
		</div>
		<!-- container End -->

		<!-- container2 컨텐츠 내용시작 -->
		<div class="bg-color">
			<div class="container wrapper">
			<!-- contant Start -->
				<div class="col-lg-12 photo-link">
					<div class="col-lg-12">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img1.png" class="img-rounded center-block" alt="금촌역_모산목장사진" />
					</div>
				</div>
				<div class="col-lg-12 photo-link">
					<div class="col-lg-12">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img2.png" class="img-rounded center-block" alt="남한산성사진" />
					</div>
				</div>
				<div class="col-lg-12 photo-link">
					<div class="col-lg-12">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img3.png" class="img-rounded center-block" alt="금촌역_모산목장사진" />
					</div>
				</div>
				<div class="col-lg-12 photo-link">
					<div class="col-lg-12">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img4.png" class="img-rounded center-block" alt="남한산성사진" />
					</div>
				</div>
			<!-- contant End -->
			</div>
		</div>
		<!-- container2 컨텐츠 내용END -->
</body>
</html>