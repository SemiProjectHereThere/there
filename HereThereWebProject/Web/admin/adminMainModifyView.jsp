<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	String userId = (String)request.getAttribute("userid");
	String userName = (String)request.getAttribute("username");
	String managerYN = (String)request.getAttribute("manageryn");
%>

<html>
<head>
  <title> YOGI JOGI </title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="/HereThere/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/HereThere/css/custom.css" />
	<link rel="stylesheet" type="text/css" href="/HereThere/css/custom2.css" />
	<Link rel="stylesheet" type="text/css" href="/HereThere/css/bootstrap.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/HereThere/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/HereThere/js/jquery.leanModal.min.js"></script>
 </head>

 <body class="bd">
		<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="index.jsp" title="여기저기">여기저기 here there</a>
			</h1>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left" onclick="location.href='MyBoardList?memberId=<%= userId %>&mySelect=0'"><%= userName %></div>
				<!-- 마이페이지로 이동 -->
			
				<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/logout'">로그아웃</div>
				<!-- 로그아웃 -->
				
				<div class="col-lg-4 pull-left menubar1">더보기
				<!-- 더보기 메뉴 -->
					<ul class="submenu">
						<li><a href="/HereThere/admin/adminMainModifyView.jsp?username=<%= userName %>&userid=<%= userId %>&manageryn=<%= managerYN %>">메인관리</a></li>
						<li><a href="/HereThere/mall?username=<%= userName %>&userid=<%= userId %>&pg=1&manageryn=<%= managerYN %>">회원관리</a></li>
						<li><a href="/HereThere/nlist?username=<%= userName %>&userid=<%= userId %>&pg=1&manageryn=<%= managerYN %>">공지사항</a></li>
						<li><a href="/HereThere/mupView?username=<%= userName %>&userId=<%= userId %>">내 정보 수정</a></li>
						<li><a href="/HereThere/member/helpPage.jsp?username=<%= userName %>&userId=<%= userId %> --%>">도움말</a></li>
					</ul>
				</div>
			</div>
		</div> 
		<!-- header End -->

		<!-- Container Start -->
		<div class="container pt-80">
			<!-- 전체보기 사진 라인 Start -->
			<div class="col-lg-6-1">
				<p class="naming">클릭해서 멋진 장소들을 확인해 보세요!</p>
				<img src="../image/img10.jpg" class=""/> 
			</div>
			<div class="pic-change-btns">
					<div class="button"><a href="#mainmodal" id="modaltrigger">메인사진 변경</a></div> &nbsp; &nbsp;
					<div id="mainmodal" style="display:none;">
					<form method="post" action="#" name="mainform" enctype="multipart/form-data">
					<h3>Main 사진 변경</h3> <br>
					<input type="file" id="theFileInput" accept=".png" size="40" name="mainfile">
					<input type="hidden" name="memberid" value=<%= userId %>>
					<input type="button" value="사진 삭제" onclick="location.href='maindel?memberid=<%= userId %>'">
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
							<img src="../image/img1.png" class="img-rounded center-block" alt="금촌역_모산목장사진" />
					</div>  
					<div class="col-lg-6-2">  
						<p class="naming">Daejeon</p>    
							<img src="../image/img2.png" class="img-rounded center-block" alt="남한산성사진" />  
					</div>  
  					<div class="col-lg-6-2">  
 						<p class="naming">Gwangju</p>    
							<img src="../image/img2.png" class="img-rounded center-block" alt="남한산성사진" />  
    				</div>  
    				<div class="col-lg-6-3">  
   						<p class="naming">Busan</p>    
							<img src="../image/img1.png" class="img-rounded center-block" alt="금촌역_모산목장사진" />  
    				</div>  
 					<div class="col-lg-6-4">  
    					<p class="naming">Ulsan</p>    
							<img src="../image/img2.png" class="img-rounded center-block" alt="남한산성사진" />  
   					</div>  
    				<div class="col-lg-6-5">  
    					<p class="naming">Daegu</p>   
							<img src="../image/img1.png" class="img-rounded center-block" alt="금촌역_모산목장사진" />  
   					</div>  
    				<div class="col-lg-6-5">  
 						<p class="naming">Jeju</p>   
							<img src="../image/img2.png" class="img-rounded center-block" alt="남한산성사진" />  
    				</div>  
   					<div class="col-lg-6-5">  
    					<p class="naming">Incheon</p>    
							<img src="../image/img2.png" class="img-rounded center-block" alt="남한산성사진" />
  					</div>  
      
  				</div>  

			<!-- contant End -->
			</div>
			
		</div>
		<!-- container2 컨텐츠 내용END -->
		
		<!-- footer Start -->
		
		<!-- footer End -->
	</body>
</html>
