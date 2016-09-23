<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, notice.model.vo.Notice" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	String userId = (String)request.getAttribute("userId");
	
	int listSize = 0;
	int listSize2 = 0;
	int total = 0;
	if(list != null){
		listSize = list.size();		//db와 연동이 안되있어서 널포인트오류남.
		listSize2 = listSize;
		total = listSize;
	}
	
	
	final int ROWSIZE = 15; 		//한페이지에 보일 공지글 수 
	final int BLOCK = 5;			//아래에 보일 페이지 수 
	int pg = 1;					//페이지 초기값
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int end = (pg*ROWSIZE);
	
	int allPage = 0;

	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if(endPage > allPage) {
		endPage = allPage;
	}
	
	listSize2 -=end;
	if(listSize2 < 0) {
		end = listSize;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> YOGI JOGI </title>
<link rel="stylesheet" type="text/css" href="/HereThere/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/HereThere/css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="/HereThere/css/bootstrap.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- 페이지 탭부분 -->
	<link rel="shortcut icon" href="image/111.png.ico">
 </head>

 <body>
		<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="index.jsp" title="여기저기">여기저기 here there</a>
			</h1>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left"><a href="/HereThere/login.html">로그인</a></div>
			
				<!-- 로그인 정보 입력 -->
			
				<div class="col-lg-4 pull-left"><a href="/HereThere/join.html">회원가입</a></div>
				
				<!-- 회원가입 정보 입력 -->
				
				<div class="col-lg-4 pull-left">도움말</div>
				
				<!-- 도움말 페이지 -->
				
			</div>
		</div> 
		<!-- header End -->
		<!-- container2 컨텐츠 내용시작 -->
		<div class="container">
				<!-- 게시판 페이지 -->
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
				   <tr height="130"><td width="5"></td></tr>
				   <tr style="background:url('/HereThere/image/table_mid.gif') repeat-x; text-align:center;">
				   <td width="5"><img src="/HereThere/image/table_left.gif" width="5" height="30" /></td>
				   <td width="73">번호</td>
				   <td width="379">제목</td>
				   <td width="73">작성자</td>
				   <td width="164">작성일</td>
				   <td width="58">조회수</td>
				   <td width="7"><img src="/HereThere/image/table_right.gif" width="5" height="30" /></td>
				   </tr>
				   <% if(total == 0){ %>
					 	<tr align="center" bgcolor="#FFFFFF" height="30">
					 	<td colspan="6">등록된 글이 없습니다.</td>
					 	</tr>
				   <% }else{
				   
				   		for(int i=ROWSIZE*(pg-1); i<end; i++){
				   			Notice n = list.get(i);
				   %>
					<tr height="25" align="center">
					<td align="center">&nbsp;</td>
					<td align="center"><%= n.getNoticeNo() %></td>
					<td align="center"><a href="/HereThere/ndetail?noticeno=<%= n.getNoticeNo() %>&pg=<%= pg %>&endpg=<%= allPage %>"><%= n.getNoticeTitle() %></a></td>
				    <td align="center"><%= n.getNoticeWriter() %></td>
				    <td align="center"><%= n.getNoticeDate() %></td>
				    <td align="center"><%= n.getCountView() %></td>
				    <td align="center">&nbsp;</td>
				    <tr height="1" bgcolor="#f58218"><td colspan="6"></td></tr>
				   <% } } %>
				    <tr height="1" bgcolor="#f58218"><td colspan="6" width="752"></td></tr>
			</table>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			  <tr><td colspan="4" height="5"></td></tr>
			  <tr>
				<td align="center">
				<%
					if(pg>BLOCK) {
				%>
					[<a href="/HereThere/nlist?pg=1&userid=<%= userId %>">◀◀</a>]
					[<a href="/HereThere/nlist?pg=<%=startPage-1%>&userid=<%= userId %>">◀</a>]
				<%
					}
				%>
				
				<%
					for(int i=startPage; i<= endPage; i++){
						if(i==pg){
				%>
							<u><b>[<%=i %>]</b></u>
				<%
						}else{
				%>
							[<a href="/HereThere/nlist?pg=<%=i %>&userid=<%= userId %>"><%=i %></a>]
				<%
						}
					}
				%>
				
				<%
					if(endPage<allPage){
				%>
					[<a href="/HereThere/nlist?pg=<%=endPage+1%>&userid=<%= userId %>">▶</a>]
					[<a href="/HereThere/nlist?pg=<%=allPage%>&userid=<%= userId %>">▶▶</a>]
				<%
					}
				%>
					</td>
					<%-- <% if(userId.equals("admin")){ %> --%>
			  		<td align="right" width="50px"><input type=button value="글쓰기" OnClick="javascript:document.location.href='/HereThere/notice/noticeWriteForm.jsp?userid=<%= userId %>&pg=<%= allPage %>';"></td>
			  		<%--  <% } %> --%>
					</tr>
				
			 </table>
		</div>
		<!-- container2 컨텐츠 내용END -->
		
		<!-- footer Start -->
		
		<!-- footer End -->
	</body>
</html>