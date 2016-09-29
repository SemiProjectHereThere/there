<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userName = (String)request.getParameter("username");
	String userId = (String)request.getParameter("userid");
	String managerYN = (String)request.getParameter("manageryn");
	int pg = Integer.parseInt(request.getParameter("pg"));
	
%>
<html>
<head>
<meta charset="UTF-8">
<title> YOGI JOGI </title>
<link rel="shortcut icon" href="/HereThere/image/111.png.ico">
<link rel="stylesheet" type="text/css" href="/HereThere/css/common.css" />
<link rel="stylesheet" type="text/css" href="/HereThere/css/custom.css" />
<Link rel="stylesheet" type="text/css" href="/HereThere/css/bootstrap.css" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HereThere/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/HereThere/js/jquery-3.1.0.min.js"></script>
</head>
<body>

<!-- header Start -->
	<div class="header clearfix">
		<h1 class="pull-left">
			<a href="/HereThere/index.jsp" title="여기저기">여기저기
				here there</a>
		</h1>
		<div class="pull-right lnb">
			<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/MyBoardList?memberId=<%= userId %>&mySelect=0'"><%= userName%>
			</div>
			<!-- 마이페이지로 이동 -->

			<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/logout'">로그아웃</div>
			<!-- 로그아웃 -->

			<div class="col-lg-4 pull-left menubar1">
				더보기
				<!-- 더보기 메뉴 -->
				<ul class="submenu">
					<li><a href="/HereThere/admin/adminMainModifyView.jsp?username=<%= userName %>&userid=<%= userId %>&manageryn=<%= managerYN %>">메인관리</a></li>
					<li><a href="/HereThere/mall?username=<%= userName %>&userid=<%= userId %>&pg=1&manageryn=<%= managerYN %>">회원관리</a></li>
					<li><a href="/HereThere/nlist?userid=<%=userId%>&pg=1&manageryn=<%= managerYN%>">공지사항</a></li>
					<li><a href="/HereThere/mupView?userId=<%=userId%>">내정보 수정</a></li>
					<li><a href="/HereThere/member/helpPage.jsp?username=<%= userName %>&userId=<%= userId %>">도움말</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- header End -->
<div class="container pt-80">
	<div class="pt-80">
	<label class="noticeLabel">공지사항 작성</label>
	<form id="frm" action="/HereThere/ninsert?userid=<%= userId %>&pg=<%= pg %>&username=<%= userName %>&manageryn=<%= managerYN %>" method="post" accept-charset="utf-8">
	<table width="100%" class="noticeTable">
		<tr>
			<td>제목</td>
			<td><input type="text" id="title" name="title" size="94" /></td>
		</tr>
		<tr></tr>
		<tr>
			<td>내용</td>
			<td><textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"></textarea></td>
		</tr>
		<tr></tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="save" value="저장"/>
				<input type="button" value="취소" OnClick="javascript:history.go(-1);"/>
			</td>
		</tr>
	</table>
	</form>
	</div>
</div>
<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "../smarteditor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#save").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
})
</script>
</body>
</html>