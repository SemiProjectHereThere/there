<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
	int pg = (Integer)request.getAttribute("pg");
	String userId = (String)request.getAttribute("userid");
%>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
<script type="text/javascript" src="../smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
</head>
<body>
<form id="frm" action="/HereThere/nupdate?noticeno=<%= n.getNoticeNo() %>&pg=<%= pg %>&userid=<%= userId %>" method="post" accept-charset="utf-8">
<table width="100%">

		<tr>
			<td>제목</td>
			<td><input type="text" id="title" name="title" value="<%= n.getNoticeTitle() %>" /></td>
			
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"><%= n.getNoticeContent() %></textarea></td>
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
    editor_object.modify({
    	"content":$tx('smarteditor')
    	});
})
</script>
</body>
</html>