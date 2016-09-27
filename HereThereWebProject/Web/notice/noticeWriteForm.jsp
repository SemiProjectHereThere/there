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
<title>글쓰기 페이지</title>
<script type="text/javascript" src="../smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
</head>
<body>
<form id="frm" action="/HereThere/ninsert?userid=<%= userId %>&pg=<%= pg %>&username=<%= userName %>&manageryn=<%= managerYN %>" method="post" accept-charset="utf-8">
<table width="100%">

		<tr>
			<td>제목</td>
			<td><input type="text" id="title" name="title" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="save" value="저장"/>
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
})
</script>
</body>
</html>