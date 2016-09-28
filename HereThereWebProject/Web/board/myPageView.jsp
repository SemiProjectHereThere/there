<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, member.model.vo.Member, board.model.vo.Board"%>
<%
	Member member = (Member)request.getAttribute("member");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	String mySelect = (String)request.getParameter("mySelect");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> YOGI JOGI </title>
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
				<a href="/HereThere/index.jsp" title="여기저기">여기저기 here there</a>
			</h1>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left" onclick="window.scrollTo(0,0);"><%= member.getMemberName() %></div>
				<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/logout'">로그아웃</div>
				<div class="col-lg-4 pull-left menubar1">더보기
					<ul class="submenu">
						<% if(member.getManagerYN() == 'Y'){ %>
							<li><a href="/HereThere/admin/adminMainModifyView.jsp?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&manageryn=<%= member.getManagerYN() %>">메인관리</a></li>
							<li><a href="/HereThere/mall?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&pg=1&manageryn=<%= member.getManagerYN() %>">회원관리</a></li>
						<%	} %>
						<li><a href="/HereThere/nlist?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&pg=1&manageryn=<%= member.getManagerYN() %>">공지사항</a></li>
						<li><a href="/HereThere/mupView?userId=<%= member.getMemberId() %>">내 정보 수정</a></li>
						<li><a href="/HereThere/member/helpPage.jsp">도움말</a></li>
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
				<img class="img-responsive cover-pic" src="uploadfiles/cover.jpg">
				<% }else{ %>
				<img class="img-responsive cover-pic" src="<%=request.getContextPath()%>\uploadfiles\<%= member.getMemberId() %>cover.png">
				<% } %>
				
				<% if(member.getRenameProfileName() == null){ %>
				<img class="img-responsive profile-pic" src="uploadfiles/profile.jpg">
				<% }else{ %>
				<img class="img-responsive profile-pic" src="<%=request.getContextPath()%>\uploadfiles\<%= member.getMemberId() %>profile.png">
				<% } %>
				<div class="name-div">
					<%= member.getMemberName() %>
				</div>
				
			</div>
			<div class="col-lg-12 first-line-btns">
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
			<form action="MyBoardList" method="post">
				<div class="select-local col-lg-4">
					
					<select id="mySelect" name="mySelect" class="mySelect">
						<option value="0" selected>전체보기</option>
						<option value="1">찜한 게시물</option>
						<option value="2">내가 올린 게시물</option>
					 </select>
					 
					 
				</div>
				<div class="select-local col-lg-4">
					<input type="hidden" name="memberId" value="<%= member.getMemberId() %>"/>
					 <button type="submit" value="검색">검색</button>
				</div>
				</form>
				<div class="select-local col-lg-4">
					<button type="button" class="btn2" onclick="location.href='/HereThere/board/boardWriteForm.jsp'"> 
						게시물 올리기
					</button>
				</div>
			</div>
		</div>
		<!-- container End -->

		<!-- container2 컨텐츠 내용시작 -->
		<div class="bg-color">
			<div class="container wrapper" id="mycontent">
			<!-- contant Start -->
			<%try{%>
			<%int a = 0; %>
			
			<%if(list.size()%2 == 0){ %>
			<%a= list.size()/2 + 1; %>
			<%}else{%>
			<%a= list.size()/2 + 2; %>
			<%}for(int i = 1; i<a; i++){ %>
				<div class="col-lg-12 photo-link">
				
				<%for(int j = i*2-1; j<i*2 + 1; j++){ %>
					
					<%Board b = list.get(j-1); %>	
					<% 
						String k ="";
     					String s = b.getBdContent(); 
      					if(s.indexOf("/HereThere/SE2")!= -1){
      					k = s.substring(s.indexOf("/HereThere/SE2"), s.indexOf("&#10;&#10;"));
      					}
      					
  					 %>
					
					<div class="col-lg-6" onclick="location.href='BoardDetailView?boardNo=<%= b.getBdNo()%>'">
					<p class="naming"><%=b.getBdTitle() %></p>
						<%if(b.getBdCategory().equals("1")){ %>
							<img class="aared" src="/HereThere/image/eat.png" />
						<%}else if(b.getBdCategory().equals("2")){ %>
							<img class="aagreen" src="/HereThere/image/pic.png" />
						<%}else if(b.getBdCategory().equals("3")){ %>
							<img class="aablue" src="/HereThere/image/view.png" />
						<%} %>
					<div class="<%=b.getBdNo() %> score1"></div>
					
					<script>
	 	 			$.fn.raty.defaults.path = '/HereThere/raty-2.7.0/lib/images';;

	 				$('.' + <%=b.getBdNo()%>).raty({readOnly:true, score: <%=b.getBdStarPt() %> });
					</script>
					<%if(k==""){ %>
					<img src="/HereThere/image/img2.png" class="img-rounded center-block" alt="<%=b.getBdTitle() %>" />
					<%}else{ %>
					<img src="<%=k %>" class="img-rounded center-block" alt="<%=b.getBdTitle() %>" />
					<%} %>
					</div>
				<%if(j == (list.size())){ %>
		
				<% break;}} %>
				</div>
		
				<%}}catch (Exception e){ %>
				<% System.out.println("검색결과 없음"); %>
				<div>검색결과없음</div>
				
				<%} %>

			<!-- contant End -->
			</div>
		</div>
		<!-- container2 컨텐츠 내용END -->
		<script>
			$('.mySelect option:eq(<%=mySelect%>)').attr("selected", "selected");
		</script>
</body>
</html>