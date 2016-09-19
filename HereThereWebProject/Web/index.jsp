<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<<<<<<< HEAD
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
 </head>

 <body>
		<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="index.jsp" title="여기저기">여기저기 here there</a>
			</h1>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left">로그인</div>
			
				<!-- 로그인 정보 입력 -->
			
				<div class="col-lg-4 pull-left">회원가입</div>
				
				<!-- 회원가입 정보 입력 -->
				
				<div class="col-lg-4 pull-left">도움말</div>
				
				<!-- 도움말 페이지 -->
				
			</div>
		</div> 
		<!-- header End -->

		<!-- Container Start -->
		<div class="container pt-80">
			<!-- 첫번째 라인 -->
			<!-- <div class="col-lg-12 first-line"> 
				<div class="select-local col-lg-4">
					<select>
						<option value="">지역</option>
						<option value="">서울</option>
						<option value="">부산</option>
						<option value="">인천</option>
						<option value="">경기</option>
					 </select>
				</div>
				<div class="select-local col-lg-4">
					<button type="button" class="btn2"> 
						맛집
					</button>
				</div>
				<div class="select-local col-lg-4">
					<button type="button" class="btn2"> 
						코스
					</button>
				</div>
			</div> -->
			<!-- 첫번째 라인 End -->
			<!-- 두번째 라인 Start -->
			<!-- <div class="col-lg-12 seconde-line no-padder">
				<div class="col-lg-2-5">
					<a href="#" class="btn3">
						전체보기				
					</a>
				</div>
				<div class="col-lg-2-5">
					<a href="#" class="btn3">인기순</a>
				</div>
				<div class="col-lg-2-5">
 					<a href="#" class="btn3">별점순</a>
				</div>
				<div class="col-lg-2-5">
					<a href="#" class="btn3">등록일자순	</a>
				</div> 
				<div class="col-lg-2-5">
					<a href="#" class="btn3">댓글순</a>
				</div>
			</div> -->
			<!-- 두번째 라인 End -->
			<!-- 전체보기 사진 라인 Start -->
			<div class="col-lg-6-1">
				<p class="naming">클릭해서 멋진 장소들을 확인해 보세요!</p>
				<img src="image/img10.jpg" class=""/>
			</div>
			<!-- 전체보기 사진 라인 End -->
		</div>
		<!-- container End -->

		<!-- container2 컨텐츠 내용시작 -->
		<div class="bg-color">
			<div class="container wrapper">
			<!-- contant Start -->
				<div class="col-lg-12 photo-link">
					<div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img1.png" class="img-rounded center-block" alt="금촌역_모산목장사진" />
					</div>
					<div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img2.png" class="img-rounded center-block" alt="남한산성사진" />
					</div>
					
				</div>
				<div class="col-lg-12 photo-link">
					<div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img3.png" class="img-rounded center-block" alt="금촌역_모산목장사진" />
					</div>
					<div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img4.png" class="img-rounded center-block" alt="남한산성사진" />
					</div>
				</div>
				<div class="col-lg-12 photo-link">
					<div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img5.png" class="img-rounded center-block" alt="금촌역_모산목장사진" />
					</div>
					<div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img6.png" class="img-rounded center-block" alt="남한산성사진" />
					</div>
				</div>
				<div class="col-lg-12 photo-link">
					<div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img7.png" class="img-rounded center-block" alt="금촌역_모산목장사진" />
					</div>
					<div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<img src="image/img8.png" class="img-rounded center-block" alt="남한산성사진" />
					</div>
				</div>

			<!-- contant End -->
			</div>
		</div>
		<!-- container2 컨텐츠 내용END -->
		<!-- footer Start -->
		<div>

		</div>
		<!-- footer End -->
	</body>
=======
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<% if(member == null){%>
	<form action="login" method="post"><%//로그인을 위한 폼, loginServlet으로 넘어감 %>
	id : <input type="text" name="memberId">
	password : <input type="password" name="memberPwd">
	<input type="submit" value="로그인">
	</form>
	<a href="member/memberJoin.html">회원가입</a><%//회원가입을 위한 서블릿으로 넘어감 %>
	<%}else{ %>
		<%= member.getMemberName()%>님 환영합니다.&nbsp; &nbsp;<br>
		<ul>
		<li><a href="nlist">공지사항</a></li><%//공지사항 페이지로 이동%>
		<li><a href="mupView?mbid=<%= member.getMemberId()%>">정보수정</a></li><%//세션 아이디를 토대로 정보수정 페이지로 이동%>
		<li><a href="/herethere/notice/help.html">도움말</a></li><%//도움말 페이지로 이동%>
		<li><a href="mypage?">마이페이지</a></li><%//세션 아이디를 토대로 마이 페이지로 이동 %>
		<li><a href="logout">로그아웃</a></li><%//세션 아이디를 토대로 로그아웃 서블릿으로 이동%>
		<% if(member.getManagerYN() == 'Y'){ %>
		<li><a href="mall">전체 회원 정보</a></li>
		<% } %>
	</ul>
	<% } %>
	<a href="/HereThere/board/boardWriteForm.jsp">글쓰기 페이지</a>
</body>
>>>>>>> branch 'master' of https://github.com/SemiProjectHereThere/there
</html>