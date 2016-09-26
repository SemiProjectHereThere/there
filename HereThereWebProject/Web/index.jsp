<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member member = (Member)session.getAttribute("member");
%>

<html>
<head>
  <title> YOGI JOGI </title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
 </head>

 <body>
		<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="index.jsp" title="여기저기">여기저기 here there</a>
			</h1>
			<%
				if(member == null){
			%>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left"><a href="/HereThere/login.html">로그인</a></div>
			
				<!-- 로그인 정보 입력 -->
			
				<div class="col-lg-4 pull-left"><a href="/HereThere/join.html">회원가입</a></div>
				
				<!-- 회원가입 정보 입력 -->
				
				<div class="col-lg-4 pull-left">도움말</div>
				
				<!-- 도움말 페이지 -->
				
			</div>
			<%
				}else if(!member.getMemberId().equals("admin")){
			%>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left"><a href="myInfo?memberId=<%= member.getMemberId()%>"><%= member.getMemberName() %></a></div>
				<!-- 마이페이지로 이동 -->
			
				<div class="col-lg-4 pull-left"><a href="/HereThere/logout">로그아웃</a></div>
				<!-- 로그아웃 -->
				
				<div class="col-lg-4 pull-left menubar1">더보기
					<ul class="submenu">
						<li><a href="/HereThere/nlist?userid=<%= member.getMemberId() %>&pg=1">공지사항</a></li>
						<li><a href="/HereThere/mupView?userId=<%= member.getMemberId() %>">내 정보 수정</a></li>
						<li><a href="/HereThere/help.html">도움말</a></li>
					</ul>
				</div>
			</div>
			<%
				}else{
			%>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left"><a href="/HereThere/mall?userid=<%= member.getMemberId() %>"><%= member.getMemberName() %></a></div>
				<!-- 마이페이지로 이동 -->
			
				<div class="col-lg-4 pull-left"><a href="/HereThere/logout">로그아웃</a></div>
				<!-- 로그아웃 -->
				
				<div class="col-lg-4 pull-left">더보기</div>
				<!-- 더보기 메뉴 -->
			</div>
			<%
				}
			%>
		</div> 
		<!-- header End -->

		<!-- Container Start -->
		<div class="container pt-80">
			<!-- 전체보기 사진 라인 Start -->
			<div class="col-lg-6-1">
				<p class="naming">클릭해서 멋진 장소들을 확인해 보세요!</p>
				<a href="/HereThere/BoardList"><img src="image/img10.jpg" class=""/></a>
			</div>
			<!-- 전체보기 사진 라인 End -->
		</div>
		<!-- container End -->

		<!-- container2 컨텐츠 내용시작 -->
		<div class="bg-color">
			<div class="container wrapper">
			<!-- contant Start -->
				<div class="col-lg-12 photo-link">
					<div class="col-lg-6-2">
					<p class="naming">Seoul</p>
					<a href="BoardPartByLoc?loc=seoul"><img src="image/img1.png" class="img-rounded center-block" alt="금촌역_모산목장사진" /></a>
					</div>
					<div class="col-lg-6-2">
					<p class="naming">Daejeon</p>
					<a href="BoardPartByLoc?loc=daejeon"><img src="image/img2.png" class="img-rounded center-block" alt="남한산성사진" /></a>
					</div>
					<div class="col-lg-6-2">
					<p class="naming">Gwangju</p>
					<a href="BoardPartByLoc?loc=gwangju"><img src="image/img2.png" class="img-rounded center-block" alt="남한산성사진" /></a>
					</div>
					<div class="col-lg-6-3">
					<p class="naming">Busan</p>
					<a href="BoardPartByLoc?loc=busan"><img src="image/img1.png" class="img-rounded center-block" alt="금촌역_모산목장사진" /></a>
					</div>
					<div class="col-lg-6-4">
					<p class="naming">Ulsan</p>
					<a href="BoardPartByLoc?loc=ulsan"><img src="image/img2.png" class="img-rounded center-block" alt="남한산성사진" /></a>
					</div>
					<div class="col-lg-6-5">
					<p class="naming">Daegu</p>
					<a href="BoardPartByLoc?loc=daegu"><img src="image/img1.png" class="img-rounded center-block" alt="금촌역_모산목장사진" /></a>
					</div>
					<div class="col-lg-6-5">
					<p class="naming">Jeju</p>
					<a href="BoardPartByLoc?loc=jeju"><img src="image/img2.png" class="img-rounded center-block" alt="남한산성사진" /></a>
					</div>
					<div class="col-lg-6-5">
					<p class="naming">Incheon</p>
					<a href="BoardPartByLoc?loc=incheon"><img src="image/img2.png" class="img-rounded center-block" alt="남한산성사진" /></a>
					</div>

				</div>
				
			
			<!-- contant End -->
			</div>
			
		</div>
		<!-- container2 컨텐츠 내용END -->
		
		<!-- footer Start -->
		<div class="footer">
			<div class="cs">
			<ul>
				<li><h4>C/S Center 및 광고문의</h4></li>
				<li>전화: 02-1234-5678</li>
				<li>팩스: 02-1234-5555</li>
				<li>이메일 : Yogijogi@naver.com</li>
				<li>카카오톡ID : Yogijogi</li>
			</ul>
			</div>
			<div class="cs">
			<ul>
				<li><h4>회사정보</h4></li>
				<li>회사명 : KHCompany</li>
				<li>대표 : 홍길동</li>
				<li>주소 : 서울특별시 강남구 역삼동 KH빌딩 2층</li>
				<li>개인정보관리 책임자 : 홍길동 (Yogijogi@naver.com)</li>
			</ul>
			</div><br>
			<div class="cs2">
			Copyrightⓒ KHCompany. All Rights Reserved.
			</div>
			
		</div>
		<!-- footer End -->
	</body>
</html>
