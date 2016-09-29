<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("member");
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
	<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- 로그인 창 -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
	<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="/HereThere/indexAction" title="여기저기">여기저기 here there</a>
			</h1>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left" onclick="location.href='MyBoardList?memberId=<%= member.getMemberId() %>&mySelect=0'"><%= member.getMemberName() %></div>
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
		<script>
		function checking()
		{
			if(document.writeForm.name.value == "")
				{
				alert("이름을 입력하세요")
				return false;
				}

			// 비밀번호 입력하지 않았을시
			else if(document.writeForm.pwd.value == "")
			{
				alert("비밀번호를 입력하세요")
				document.writeForm.pwd.focus()
				return false;
			}
			// 비밀번호 길이체크(4~8자 까지 허용 )
			if(document.writeForm.pwd.value.length<4 || document.writeForm.pwd.value.length>8)
			{
				alert("비밀번호를 4~8자 까지 입력해주세요")
				document.writeForm.pwd.focus()
				document.writeForm.pwd.select()
			}	
			else if(document.writeForm.pwd.value != document.writeForm.repwd.value)
			{
				alert("비밀번호가 다릅니다")
				document.writeForm.pwd.value=""
				document.writeForm.repwd.value=""
				document.writeForm.pwd.focus=""
				return false;
			}
			
			else if(document.writeForm.email.value == "")alert("이메일을 입력하세요")
		}
		  function joinout(){
			 if(confirm("정말로 탈퇴하시겠습니까?")){
				 var url="/HereThere/mdel?userId=" + document.writeForm.userId.value;

				 window.location.replace(url);
				 
			 }else{
				 return false;
			 }
		  }
		</script>
		<div class="container">
				<section id="content">
						<form method="post" action="/HereThere/mupdate" name="writeForm" onsubmit="return checking()">
							
							
							<h1>정보수정</h1>
							
							<div><input type="text" placeholder="Username" id="username" name="name" readonly value="<%= member.getMemberName()%>" ></div>
							<div><input type="text" id="userid" name = "userId" readonly value="<%=member.getMemberId()%>">
							<input type="button"  id="idcheck" name = "checkId" realonly  value="Id Check"></div>
							<div><input type="password" placeholder="Password" id="password1"name="pwd" value="<%= member.getMemberPwd()%>"></div>
							<div><input type="password" placeholder="Confirm Password" id="password2"name="repwd" ></div>
							<div><input type="email" placeholder="Email" id="email"name="email" value="<%= member.getEmail()%>"></div>
							<div><input type="date" placeholder="BirthDate" id="birthdate" name="birthdate" value="<%= member.getBirthday() %>"></div>
							<div id="tel">
							<%String[] ar = member.getPhone().split("-"); %>
						
							
							
							<select name="hp1" class="box" value="<%=ar[0] %>">
							<option value="010">010
							<option value="011">011
							<option value="016">016
							<option value="017">017
							<option value="018">018
							<option value="019">019
							</select>-<input type="text" name="hp2" value="<%=ar[1] %>"maxlength=4 class="box">-<input type="text" name="hp3" value="<%=ar[2] %>" maxlength=4 class="box"></div>
							<div>
							<label><h5>Gender</h5></label>&nbsp;&nbsp;
							<%
								if(member.getGender() == 'M'){
							%>
							<input type="radio"  id="InputGender" name="gender" value="M" checked>&nbsp;남 &nbsp;&nbsp;
							<input type="radio"  id="InputGender" name="gender" value="F">&nbsp;여
							<% }else if(member.getGender() == 'F'){ %>
							<input type="radio"  id="InputGender" name="gender" value="M" >&nbsp;남 &nbsp;&nbsp;
							<input type="radio"  id="InputGender" name="gender" value="F" checked>&nbsp;여
							<%} %>
							</div>
							<div>
								<input type="submit" value="수정" /><input type="button" value="탈퇴하기" class="joinout" onclick="joinout()">
								<a href="/HereThere/index.jsp">Cancel</a>
							</div>
						</form>
					</section>
				</div>
		<!-- container 컨텐츠 내용END -->
		</body>
</html>