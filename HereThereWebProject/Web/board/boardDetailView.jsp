<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, member.model.vo.Member, board.model.vo.Comment, java.util.ArrayList" %>
<% 
	Board b = (Board)request.getAttribute("board"); 
	Member m = (Member)session.getAttribute("member");
	ArrayList<Comment> list = (ArrayList<Comment>)request.getAttribute("cmlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail View</title>
<script type="text/javascript" src="/HereThere/js/jquery-3.1.0.min.js"></script>
</head>
<body>
	<div>제목<%=b.getBdTitle() %></div>
	<div>글쓴이<%=b.getBdWriter() %></div>
	<div>내용<%=b.getBdContent() %></div>
	<div>지도<%=b.getBdMap() %></div>
	<br>
	<a href="/HereThere/BoardUpView?bno=<%=b.getBdNo()%>">수정</a>
	<a href="/HereThere/BoardDelete?bno=<%=b.getBdNo()%>">삭제</a>
	<% if(list != null){ %>
		<% for(Comment c : list){ %>
		
		<% } %>
	<% } %>
	<div>
		
	</div>
	<div>
		<form action="" method="get">
			<input type="hidden" name="bno" value="<%=b.getBdNo()%>">
			<input type="hidden" name="writer" value="">
			<textarea name="comment" cols="20" rows="4"></textarea>
			<input type="submit" value="댓글달기">
		</form>
	</div>	
</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url : "test5.do",
			data : {no : "t5"},
			type : "post",
			dataType : "json",
			success : function(data){
				//console.log(data);
				var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
				//console.log(jsonStr);
				var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
				
				var values = $("#p5").html();
				
				for(var i in json.list){
					//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
					values += json.list[i].userId + ", " + json.list[i].userPwd + ", " + 
							decodeURIComponent(json.list[i].userName) + 
							", " + json.list[i].age + ", " + json.list[i].email + ", " + json.list[i].phone + "<br>";
				}	
				$("#p5").html(values);
			}
		});
	});
</script>
</html>