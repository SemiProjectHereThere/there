<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member member = (Member)session.getAttribute("member");
%>

<html>
<head>
  <title> YOGI JOGI </title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  	<link rel="shortcut icon" href="../image/111.png.ico">
	<link rel="stylesheet" type="text/css" href="../css/common.css" />
	<link rel="stylesheet" type="text/css" href="../css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
 </head>

 <body onload="hi();">
		<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="../index.jsp" title="여기저기">여기저기 here there</a>
			</h1>
			<%
				if(member == null){
			%>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/login.html'">로그인</div>
			
				<!-- 로그인 정보 입력 -->
			
				<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/join.html'">회원가입</div>
				
				<!-- 회원가입 정보 입력 -->
				
				<div class="col-lg-4 pull-left" onclick="location.href='HereThere/member/helpPage.jsp'">도움말</div>
				
				<!-- 도움말 페이지 -->
				
			</div>
			<%
				}else if(member.getManagerYN() != 'Y'){
			%>
			<div class="pull-right lnb">
								<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/MyBoardList?memberId=<%= member.getMemberId() %>&mySelect=0'"><%= member.getMemberName() %></a></div>
				<!-- 마이페이지로 이동 -->
			
				<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/logout'">로그아웃</div>
				<!-- 로그아웃 -->
				
				<div class="col-lg-4 pull-left menubar1">더보기
					<ul class="submenu">
						<li><a href="/HereThere/nlist?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&pg=1&manageryn=<%= member.getManagerYN() %>">공지사항</a></li>
						<li><a href="/HereThere/mupView?username=<%= member.getMemberName() %>&userId=<%= member.getMemberId() %>">내 정보 수정</a></li>
						<li><a href="/HereThere/member/helpPage.jsp?username=<%= member.getMemberName() %>&userId=<%= member.getMemberId() %>">도움말</a></li>
					</ul>
				</div>
			</div>
			<%
				}else{
			%>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left" onclick="location.href='MyBoardList?memberId=<%= member.getMemberId() %>&mySelect=0'"><%= member.getMemberName() %></a></div>
				<!-- 마이페이지로 이동 -->
			
				<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/logout'">로그아웃</div>
				<!-- 로그아웃 -->
				
				<div class="col-lg-4 pull-left menubar1">더보기
				<!-- 더보기 메뉴 -->
					<ul class="submenu">
						<li><a href="/HereThere/admin/adminMainModifyView.jsp?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&manageryn=<%= member.getManagerYN() %>">메인관리</a></li>
						<li><a href="/HereThere/mall?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&pg=1&manageryn=<%= member.getManagerYN() %>">회원관리</a></li>
						<li><a href="/HereThere/nlist?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&pg=1&manageryn=<%= member.getManagerYN() %>">공지사항</a></li>
						<li><a href="/HereThere/mupView?username=<%= member.getMemberName() %>&userId=<%= member.getMemberId() %>">내 정보 수정</a></li>
						<li><a href="/HereThere/member/helpPage.jsp?username=<%= member.getMemberName() %>&userId=<%= member.getMemberId() %>">도움말</a></li>
					</ul>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<!-- header End -->
		<!-- contant Start -->
		
		
<style>
	.container9{
	padding-top:115px;

	}

dl{
	width:800px;
	margin:50px auto;
	
}
dt{
	width:800;
	margin: auto;
	height:60px;
	padding:20px; 
	
	border-bottom: solid #f57115;
	)
}
dd{
	margin-top:5px;

	padding:5px;
	height:50px;
	border-bottom: solid   #e8e8e8;
}
dd p{

	text-indent:2em;
	
}

</style>
		<script type="text/javascript">
 		$(function hi(){
			$("dd").hide();
		}); 
		
 		 $(document).ready(function () {
		 $("#t1").click(function () {
			$("#d1").toggle();
	    });    
 		   }); 
 		 
 		 $(document).ready(function () {
 			 $("#t2").click(function () {
 				$("#d2").toggle();
 		    });    
 	 		   });     
 		 
 		 $(document).ready(function () {
 			 $("#t3").click(function () {
 				$("#d3").toggle();
 		    });    
 	 		   });   
 		 
 		 $(document).ready(function () {
 			 $("#t4").click(function () {
 				$("#d4").toggle();
 		    });    
 	 		   });   
 		 
 		 $(document).ready(function () {
 			 $("#t5").click(function () {
 				$("#d5").toggle();
 		    });    
 	 		   });   
 		 $(document).ready(function () {
 			 $("#t6").click(function () {
 				$("#d6").toggle();
 		    });    
 	 		   });  
		</script>

	
<div class="container9">
		<section id="content">
	     
		<dl>
		<h1>>>FAQ</h1>
			<dt id="t1">Q1.회원가입은 어떻게 할수 있나요?</dt>
				<dd id="d1" ><p>A.우측상단에 회원관리 탭을 클릭후 회원가입을 하시면 됩니다 </p></dd>
			<dt id="t2">Q2.회원탈퇴는 어떻게 해야하나요?</dt>
				<dd id="d2"><p>A.로그인을 한뒤에 정보수정메뉴에가서 회원탈퇴 버튼을 클릭하면 회원탈퇴가 이루어집니다. </p></dd>
			<dt id="t3">Q3.자주 가고 싶은 곳을 저장하고 싶은데 어떻게 해야하나요?</dt>
				<dd id="d3"><p>A.우리 사이트는 찜하기 메뉴가 있습니다 다시보고싶은곳에서 찜하기 버튼을 클릭하면 마이페이지에 저장이 됩니다.</p></dd>
			<dt id="t4">Q4.게시글을 올리고 싶은데 어디에서 올려야하나요?</dt>
				<dd id="d4"><p>A.마이페이지에 가신후 게시물올리기를 통하여 올리실수있습니다.</p></dd>
			<dt id="t5">Q5.프로필사진을 변경하고 싶은데 어떻게 바꿀수 있나요?</dt>
				<dd id="d5"><p>A.마이페이지에 가신후 프로필사진 변경을 클릭하신수 첨부하실 사진을 선택하시고 변경하기를 누르시면 완료됩니다.</p></dd>
			<dt id="t6">Q6.가고싶은 곳을 찾고 싶은데 쉽게 찾을수 있는 방법은 없나요?</dt>
				<dd id="d6"><p>A.메인화면의 사진을 클릭후 검색바에서 지역별 , 맛집별, 코스별, 별점순, 등록일자별로 검색하시면 쉽게 찾으실수있습니다.</p></dd>
			
		</dl>
		
		
			</section>
				</div>
		
		
		
		
		
		
		<!-- contant End -->
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
