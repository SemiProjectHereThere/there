<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, admin.model.vo.Admin"%>
<%
	Member member = (Member)session.getAttribute("member");
	Admin admin = (Admin)request.getAttribute("admin");
%>

<html>
<head>
  <title> YOGI JOGI </title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  	<link rel="shortcut icon" href="image/111.png.ico">
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link href="css/jquery.bxslider.css" rel="stylesheet" type="text/css"/>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
	
	<!-- scr -->
    <meta name="author" content="www.mattvarone.com">
    <link rel="stylesheet" media="screen,projection" href="/HereThere/sksmatt-UItoTop-jQuery-Plugin-14d6f09/css/ui.totop.css" />
    <meta name="viewport" content="width=device-width; initial-scale=1"/>
	
	<style>
#s_banner_wrap {width:100%; height:400px; position: relative; margin:10px 0}

/* 사용자 페이징 위치와 모양을 자유롭게 변형 */
#bx-pager1 {position: absolute; bottom:10px;}
#bx-pager1 a{float:left; margin:0 5px;display: block; width:20px; height:20px; font-size:12px; line-height:18px; text-align:center; background:#999; color:#333}
#bx-pager1 a:hover, .bx-pager1 a:active{ background: #000; color: #CCC;}

/* 엑티브상태에 대한 속성값 지정 */
#bx-pager1 a.active{ background: #000; color: #CCC;}
</style>
 </head>

 <body>
		<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="indexAction" title="여기저기">여기저기 here there</a>
			</h1>
			<%
				if(member == null){
			%>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/login.html'">로그인</div>
			
				<!-- 로그인 정보 입력 -->
			
				<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/join.html'">회원가입</div>
				
				<!-- 회원가입 정보 입력 -->
				
				<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/member/helpPage.jsp'" >도움말</div>
				
				<!-- 도움말 페이지 -->
				
			</div>
			<%
				}else if(member.getManagerYN() != 'Y'){
			%>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left" onclick="location.href='MyBoardList?memberId=<%= member.getMemberId() %>&mySelect=0'"><%= member.getMemberName() %></div>
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
						<li><a href="/HereThere/AdminMainModify?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&manageryn=<%= member.getManagerYN() %>">메인관리</a></li>
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

		<!-- Container Start -->
		<div class="container pt-80">
			<!-- 전체보기 사진 라인 Start -->
			<!-- <div class="col-lg-6-1">
				<p class="naming">클릭해서 멋진 장소들을 확인해 보세요!</p>
				<a href="/HereThere/BoardList"><img src="image/img10.jpg" class=""/></a> -->
				<div id="s_banner_wrap">
					<ul class="bxslider">
      					<% if(admin.getRenameSeoulName() == null){ %>
      					<img style="height:400px;" src="MainPguploadfiles/question.jpg">
      					<% }else{ %>
      					<img style="height:400px;" src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>main.png">
      					<% } %>
      					
      					<% if(admin.getRenameSeoulName() == null){ %>
      					<img style="height:400px;" src="MainPguploadfiles/question.jpg">
      					<% }else{ %>
      					<img style="height:400px;" src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>main2.png">
      					<% } %>
    				</ul>
				</div>
				<script>
					$(document).ready(function(){
						var slider = $('.bxslider').bxSlider({
							auto: true, mode:'fade', captions:true,
						});
					// 클릭시 멈춤 현상 해결 //
						$(document).on('click','.bx-next, .bx-prev, bx-pager, #bx-pager1',function() {
							slider.stopAuto();
							slider.startAuto();;
					});	
					});
				</script>
			<!-- </div> -->
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
							<% if(admin.getRenameSeoulName() == null){ %>    
							<a href="boardselect?boardVLocation=1"><img src="MainPguploadfiles/question.jpg" class="img-rounded center-block" alt="금촌역_모산목장사진" /></a>
							<% }else{ %>
							<a href="boardselect?boardVLocation=1"><img src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>seoul.png" class="img-rounded center-block" alt="금촌역_모산목장사진" /></a>
							<% } %>
					</div>  
					<div class="col-lg-6-2">  
						<p class="naming">Daejeon</p>    
							<% if(admin.getRenameDaejeonName() == null){ %>  
							<a href="boardselect?boardVLocation=6"><img src="MainPguploadfiles/question.jpg" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% }else{ %>
							<a href="boardselect?boardVLocation=6"><img src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>daejeon.png" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% } %>  
					</div>  
  					<div class="col-lg-6-2">  
 						<p class="naming">Gwangju</p>    
							<% if(admin.getRenameGwangjuName() == null){ %>     
							<a href="boardselect?boardVLocation=7"><img src="MainPguploadfiles/question.jpg" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% }else{ %>
							<a href="boardselect?boardVLocation=7"><img src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>gwangju.png" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% } %>  
    				</div>  
    				<div class="col-lg-6-3">  
   						<p class="naming">Busan</p>    
							<% if(admin.getRenameBusanName() == null){ %>   
							<a href="boardselect?boardVLocation=3"><img src="MainPguploadfiles/question.jpg" class="img-rounded center-block" alt="금촌역_모산목장사진" /></a>
							<% }else{ %>
							<a href="boardselect?boardVLocation=3"><img src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>busan.png" class="img-rounded center-block" alt="금촌역_모산목장사진" /></a>
							<% } %>  
    				</div>  
 					<div class="col-lg-6-4">  
    					<p class="naming">Ulsan</p>    
							<% if(admin.getRenameUlsanName() == null){ %>   
							<a href="boardselect?boardVLocation=4"><img src="MainPguploadfiles/question.jpg" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% }else{ %>
							<a href="boardselect?boardVLocation=4"><img src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>ulsan.png" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% } %>  
   					</div>  
    				<div class="col-lg-6-5">  
    					<p class="naming">Daegu</p>   
							<% if(admin.getRenameDaeguName() == null){ %>  
							<a href="boardselect?boardVLocation=5"><img src="MainPguploadfiles/question.jpg" class="img-rounded center-block" alt="금촌역_모산목장사진" /></a>
							<% }else{ %>  
							<a href="boardselect?boardVLocation=5"><img src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>daegu.png" class="img-rounded center-block" alt="금촌역_모산목장사진" /></a>
							<% } %>  
   					</div>  
    				<div class="col-lg-6-5">  
 						<p class="naming">Jeju</p>   
							<% if(admin.getRenameJejuName() == null){ %>   
							<a href="boardselect?boardVLocation=16"><img src="MainPguploadfiles/question.jpg" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% }else{ %>  
							<a href="boardselect?boardVLocation=16"><img src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>jeju.png" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% } %>  
    				</div>  
   					<div class="col-lg-6-5">  
    					<p class="naming">Incheon</p>    
							<% if(admin.getRenameIncheonName() == null){ %> 
							<a href="boardselect?boardVLocation=2"><img src="MainPguploadfiles/question.jpg" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% }else{ %>   
							<a href="boardselect?boardVLocation=2"><img src="<%=request.getContextPath()%>\MainPguploadfiles\<%= admin.getAdminId() %>Incheon.png" class="img-rounded center-block" alt="남한산성사진" /></a>
							<% } %>  
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
		<!-- easing plugin ( optional ) -->
	    <script src="/HereThere/sksmatt-UItoTop-jQuery-Plugin-14d6f09/js/easing.js" type="text/javascript"></script>
	    <!-- UItoTop plugin -->
	    <script src="/HereThere/sksmatt-UItoTop-jQuery-Plugin-14d6f09/js/jquery.ui.totop.js" type="text/javascript"></script>
	    <!-- Starting the plugin -->
	    <script type="text/javascript">
	        $(document).ready(function() {
	            /*
	            var defaults = {
	                containerID: 'toTop', // fading element id
	                containerHoverID: 'toTopHover', // fading element hover id
	                scrollSpeed: 1200,
	                easingType: 'linear'
	            };
	            */
				
	            $().UItoTop({ easingType: 'easeOutQuart' });
	
	        });
	    </script>
	</body>
</html>
