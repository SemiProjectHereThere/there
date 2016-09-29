<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, admin.model.vo.Admin"%>
<%
	Admin admin = (Admin)request.getAttribute("admin");
	String userId = (String)request.getParameter("userid");
	String userName = (String)request.getParameter("username");
	String managerYN = (String)request.getParameter("manageryn");
	 
%>

<html>
<head>
  <title> YOGI JOGI </title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link href="css/jquery.bxslider.css" rel="stylesheet" type="text/css"/>
	<link href="css/layout.css" rel="stylesheet" type="text/css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
	
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
				<a href="/HereThere/indexAction" title="여기저기">여기저기 here there</a>
			</h1>
		
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left"><%= userName %></div>
				<!-- 마이페이지로 이동 -->
			
				<div class="col-lg-4 pull-left"><a href="/HereThere/logout">로그아웃</a></div>
				<!-- 로그아웃 -->
				
				<div class="col-lg-4 pull-left menubar1">더보기
				<!-- 더보기 메뉴 -->
					<ul class="submenu">
										
						<li><a href="/HereThere/AdminMainModify?username=<%= userName %>&userid=<%= userId %>&manageryn=<%= managerYN %>">메인관리</a></li>
						<li><a href="/HereThere/mall?username=<%= userName %>&userid=<%= userId %>&pg=1&manageryn=<%= managerYN %>">회원관리</a></li>
						<li><a href="/HereThere/nlist?username=<%= userName %>&userid=<%= userId %>&pg=1&manageryn=<%= managerYN %>">공지사항</a></li>
						<li><a href="/HereThere/mupView?username=<%= userName %>&userId=<%= userId %>">내 정보 수정</a></li>
						<li><a href="/HereThere/member/helpPage.jsp?username=<%= userName %>&userId=<%= userId %>">도움말</a></li>
					</ul>
				</div>
			</div>
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
			<div class="col-lg-12 first-line-btns">
			<div class="pic-change-btns">
					<div class="button" style="margin:0 0 0 40px"><a href="#mainmodal1" id="modaltrigger">메인1 사진변경</a></div> &nbsp; &nbsp;
					<div id="mainmodal1" style="display:none;">
					<form method="post" action="/HereThere/adminMainPicUp" name="mainform" enctype="multipart/form-data">
					<h3>MAIN1 사진 변경</h3> <br>
					<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
					<input type="hidden" name="memberid" value=<%= userId %>>
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
				
				<div class="button" style="margin:-50px 0 0 0px"><a href="#mainmodal2" id="modaltrigger0">메인2 사진변경</a></div> &nbsp; &nbsp;
					<div id="mainmodal2" style="display:none;">
					<form method="post" action="/HereThere/AdminMain2PicUp" name="mainform" enctype="multipart/form-data">
					<h3>MAIN2 사진 변경</h3> <br>
					<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
					<input type="hidden" name="memberid" value=<%= userId %>>
					<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
					</form>
					</div>

			<!--모달윈도우부분-->
				<script type="text/javascript">
					 $(function(){
						/* $('#coverform').submit(function(e){
							return true;
						}); */
	  
						$('#modaltrigger0').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
					});
				</script>
				</div>
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
    				 <div class="col-lg-12 first-line-btns">
						<div class="pic-change-btns">
							<div class="button" style="margin:80px 0 0 -455px;"><a href="#seoulmodal" id="modaltrigger1">서울 사진변경</a></div> &nbsp; &nbsp;
							<div id="seoulmodal" style="display:none;">
							<form method="post" action="/HereThere/AdminSeoulPicUp" name="seoulform" enctype="multipart/form-data">
							<h3>SEOUL 사진 변경</h3> <br>
							<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
							<input type="hidden" name="memberid" value=<%= userId %>>
							<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
							</form>
							</div>

						<!--모달윈도우부분-->
							<script type="text/javascript">
								 $(function(){
									/* $('#coverform').submit(function(e){
										return true;
									}); */
				  
									$('#modaltrigger1').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
								});
							</script>
							
							<div class="button" style="margin:80px 0 0 130px;"><a href="#daejeonmodal" id="modaltrigger2">대전 사진변경</a></div> &nbsp; &nbsp;
							<div id="daejeonmodal" style="display:none;">
							<form method="post" action="/HereThere/AdminDaejeonPicUp" name="coverform" enctype="multipart/form-data">
							<h3>DAEJEON 사진 변경</h3> <br>
							<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
							<input type="hidden" name="memberid" value=<%= userId %>>
							<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
							</form>
							</div>

						<!--모달윈도우부분-->
							<script type="text/javascript">
								 $(function(){
									/* $('#coverform').submit(function(e){
										return true;
									}); */
				  
									$('#modaltrigger2').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
								});
							</script>
							
							<div class="button" style="margin:-52px 0 0 280px;"><a href="#gwangjumodal" id="modaltrigger3">광주 사진변경</a></div> &nbsp; &nbsp;
							<div id="gwangjumodal" style="display:none;">
							<form method="post" action="/HereThere/AdminGwangjuPicUp" name="coverform" enctype="multipart/form-data">
							<h3>GWANGJU 사진 변경</h3> <br>
							<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
							<input type="hidden" name="memberid" value=<%= userId %>>
							<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
							</form>
							</div>

						<!--모달윈도우부분-->
							<script type="text/javascript">
								 $(function(){
									/* $('#coverform').submit(function(e){
										return true;
									}); */
				  
									$('#modaltrigger3').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
								});
							</script>
						
						
							
					</div>
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
   					
   					<div class="col-lg-12 first-line-btns">
						<div class="pic-change-btns">
							<div class="button" style="margin:80px 0 0 -90px;"><a href="#busanmodal" id="modaltrigger4">부산 사진변경</a></div> &nbsp; &nbsp;
							<div id="busanmodal" style="display:none;">
							<form method="post" action="/HereThere/AdminBusanPicUp" name="coverform" enctype="multipart/form-data">
							<h3>BUSAN 사진 변경</h3> <br>
							<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
							<input type="hidden" name="memberid" value=<%= userId %>>
							<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
							</form>
							</div>

						<!--모달윈도우부분-->
							<script type="text/javascript">
								 $(function(){
									/* $('#coverform').submit(function(e){
										return true;
									}); */
				  
									$('#modaltrigger4').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
								});
							</script>
							
							<div class="button" style="margin:80px 0 0 130px;"><a href="#ulsanmodal" id="modaltrigger5">울산 사진변경</a></div> &nbsp; &nbsp;
							<div id="ulsanmodal" style="display:none;">
							<form method="post" action="/HereThere/AdminUlsanPicUp" name="coverform" enctype="multipart/form-data">
							<h3>ULSAN 사진 변경</h3> <br>
							<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
							<input type="hidden" name="memberid" value=<%= userId %>>
							<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
							</form>
							</div>

						<!--모달윈도우부분-->
							<script type="text/javascript">
								 $(function(){
									/* $('#coverform').submit(function(e){
										return true;
									}); */
				  
									$('#modaltrigger5').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
								});
							</script>
						</div>
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
  					
  					<div class="col-lg-12 first-line-btns">
						<div class="pic-change-btns">
							<div class="button" style="margin:80px 0 0 -455px;"><a href="#daegumodal" id="modaltrigger6">대구 사진변경</a></div> &nbsp; &nbsp;
							<div id="daegumodal" style="display:none;">
							<form method="post" action="/HereThere/AdminDaeguPicUp" name="coverform" enctype="multipart/form-data">
							<h3>DAEGU 사진 변경</h3> <br>
							<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
							<input type="hidden" name="memberid" value=<%= userId %>>
							<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
							</form>
							</div>

						<!--모달윈도우부분-->
							<script type="text/javascript">
								 $(function(){
									/* $('#coverform').submit(function(e){
										return true;
									}); */
				  
									$('#modaltrigger6').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
								});
							</script>
							
							<div class="button" style="margin:80px 0 0 130px;"><a href="#jejumodal" id="modaltrigger7">제주 사진변경</a></div> &nbsp; &nbsp;
							<div id="jejumodal" style="display:none;">
							<form method="post" action="/HereThere/AdminJejuPicUp" name="coverform" enctype="multipart/form-data">
							<h3>JEJU 사진 변경</h3> <br>
							<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
							<input type="hidden" name="memberid" value=<%= userId %>>
							<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
							</form>
							</div>

						<!--모달윈도우부분-->
							<script type="text/javascript">
								 $(function(){
									/* $('#coverform').submit(function(e){
										return true;
									}); */
				  
									$('#modaltrigger7').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
								});
							</script>
							
							<div class="button" style="margin:-52px 0 0 280px;"><a href="#incheonmodal" id="modaltrigger8">인천 사진변경</a></div> &nbsp; &nbsp;
							<div id="incheonmodal" style="display:none;">
							<form method="post" action="/HereThere/AdminIncheonPicUp" name="coverform" enctype="multipart/form-data">
							<h3>INCHEON 사진 변경</h3> <br>
							<input type="file" id="theFileInput" accept=".png" size="40" name="coverfile">
							<input type="hidden" name="memberid" value=<%= userId %>>
							<input type="submit" value="변경하기" style="float: right; font-size:14pt; padding: 1px 24px; height: 35px;">
							</form>
							</div>

						<!--모달윈도우부분-->
							<script type="text/javascript">
								 $(function(){
									/* $('#coverform').submit(function(e){
										return true;
									}); */
				  
									$('#modaltrigger8').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
								});
							</script>
						
						
							
					</div>
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
