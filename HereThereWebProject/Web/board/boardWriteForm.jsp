<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
<script type="text/javascript" src="../smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
</head>
<body>
<form id="frm" action="/HereThere/BoardInsert" method="post" accept-charset="utf-8">
<table width="100%">
		<tr>
			<td>제목</td>
			<td><input type="text" id="title" name="title" /></td>
		</tr>
		<tr>
			<td>지역분류</td>
			<td><select name="location">
				<option value="1">서울특별시</option>
				<option value="2">인천광역시</option>
				<option value="3">부산광역시</option>
				<option value="4">울산광역시</option>
				<option value="5">대구광역시</option>
				<option value="6">대전광역시</option>
				<option value="7">광주광역시</option>
				<option value="8">경기도</option>
				<option value="9">강원도</option>
				<option value="10">충청북도</option>
				<option value="11">충청남도</option>
				<option value="12">전라북도</option>
				<option value="13">전라남도</option>
				<option value="14">경상북도</option>
				<option value="15">경상남도</option>
				<option value="16">제주도</option>
			</select> &nbsp; &nbsp;
			<input type="radio" name="category" value="1">코스 &nbsp; &nbsp;
			<input type="radio" name="category" value="2">맛집 &nbsp; &nbsp;
			<input type="radio" name="category" value="3">명소 
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="save" value="저장"/>
				<input type="button" value="취소"/>
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