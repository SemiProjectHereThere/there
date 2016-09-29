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
<script type="text/javascript" src="/HereThere/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/HereThere/js/jquery-3.1.0.min.js"></script>
<!-- 페이지 탭부분 -->
	<link rel="shortcut icon" href="image/111.png.ico">
</head>
<body>
<form id="frm" action="/HereThere/nupdate" method="post" accept-charset="utf-8">
<input type="hidden" name="noticeno" value="<%=n.getNoticeNo()%>">
<input type="hidden" name="pg" value="<%=pg%>">
<input type="hidden" name="userid" value="<%=userId%>">
<input type="hidden" name="manageryn" value="<%=managerYN%>">
<input type="hidden" name="username" value="<%=userName%>">

<table width="100%">

		<tr>
			<td>제목</td>
			<td><input type="text" id="title" name="title" value="<%= n.getNoticeTitle() %>" /></td>
			
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="upsmart" id="upsmart" rows="10" cols="100" style="width:766px; height:412px;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="save" value="수정하기"/>
				<input type="button" value="취소" OnClick="javascript:history.go(-1);"/>
			</td>
		</tr>
</table>
</form>
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