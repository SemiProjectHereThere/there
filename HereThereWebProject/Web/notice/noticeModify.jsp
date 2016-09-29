<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
	int pg = (Integer)request.getAttribute("pg");
	String userId = (String)request.getAttribute("userid");
	String userName = (String)request.getAttribute("username");
	String managerYN = (String)request.getAttribute("manageryn");
%>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
<link rel="shortcut icon" href="/HereThere/image/111.png.ico">
<link rel="stylesheet" type="text/css" href="/HereThere/css/common.css" />
<link rel="stylesheet" type="text/css" href="/HereThere/css/custom.css" />
<Link rel="stylesheet" type="text/css" href="/HereThere/css/bootstrap.css" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HereThere/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/HereThere/js/jquery-3.1.0.min.js"></script>
<!-- 페이지 탭부분 -->
	
</head>
<body>

<!-- header Start -->
	<div class="header clearfix">
		<h1 class="pull-left">
			<a href="/HereThere/indexAction" title="여기저기">여기저기
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
	<label class="noticeLabel">공지사항 수정</label>

	<form id="frm" action="/HereThere/nupdate" method="post" accept-charset="utf-8">
	<input type="hidden" name="noticeno" value="<%=n.getNoticeNo()%>">
	<input type="hidden" name="pg" value="<%=pg%>">
	<input type="hidden" name="userid" value="<%=userId%>">
	<input type="hidden" name="manageryn" value="<%=managerYN%>">
	<input type="hidden" name="username" value="<%=userName%>">
	
	<table width="100%" >
	
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" name="title" value="<%= n.getNoticeTitle() %>" /></td>
				
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="upsmart" id="upsmart" rows="10" cols="100" style="width:766px; height:412px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" >
					<input type="button" id="save" value="수정하기" style="margin:25px 0 0 400px;"/>
					<input type="button" value="취소" style="margin:0 0 0 0px;" OnClick="javascript:history.go(-1);"/>
				</td> 
			</tr>
			
	</table>
	<br><br><br><br>
	</form>
	</div>
</div>
	<script type="text/javascript">
	$(function(){
	    //전역변수선언
	    var editor_object = [];
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        elPlaceHolder: "upsmart",
	        sSkinURI: "/HereThere/smarteditor/SmartEditor2Skin.html", 
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,             
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,     
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true, 
	        },
	        fOnAppLoad : function(){
	        	var sHTML = '<%= n.getNoticeContent() %>';
	    		editor_object.getById["upsmart"].exec("PASTE_HTML", [sHTML]);
	        },
	        fCreator: "createSEditor2"
	    });
	     
	    //전송버튼 클릭이벤트
	    $("#save").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["upsmart"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
	    })
	    /* editor_object.modify({
	    	"content":$tx('smarteditor')
	    	}); */
	})
	</script>
	</body>
	</html>