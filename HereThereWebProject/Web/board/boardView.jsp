<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, java.util.ArrayList " %>
<%	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
  	String location = ""; 
  	String category = ""; 
  	String option = ""; 
 	
  	location = (String)request.getAttribute("location"); 
  	category = (String)request.getAttribute("category"); 
  	option = (String)request.getAttribute("option"); 
  	
  	if(location == null){ 
  		location = "0"; 
  		category = "0";
		option = "0";
  	} %>

<!DOCTYPE html>
<html>
<head>
  <title> YOGI JOGI </title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="/HereThere/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/HereThere/css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="/HereThere/css/bootstrap.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- starpoint -->
	<script src="/HereThere/raty-2.7.0/vendor/jquery.js"></script><script src="/HereThere/raty-2.7.0/lib/jquery.raty.js"></script>
	<script src="/HereThere/raty-2.7.0/demo/javascripts/labs.js" type="text/javascript"></script>

	
 </head>

 <body>
	<div>
		<!-- header Start -->
		<div class="header clearfix">
			<h1 class="pull-left">
				<a href="/HereThere/index.jsp" title="여기저기">여기저기 here there</a>
			</h1>
			<div class="pull-right lnb">
				<div class="col-lg-4 pull-left">이름/사진</div>
				<div class="col-lg-4 pull-left">도움말</div>
			</div>
		</div> 
		<!-- header End -->

		<!-- Container Start -->
		<div class="container pt-80">
			<!-- 첫번째 라인 -->
			<form action="boardselect" method="post">
			<div class="col-lg-12 first-line"> 
				<div class="select-local col-lg-3">
					<select class="boardVLocation" name="boardVLocation">
						<option value="0">지역전체</option>
						<option value="1">서울</option>
						<option value="2">인천</option>
						<option value="3">부산</option>
						<option value="4">울산</option>
						<option value="5">대구</option>
						<option value="6">대전</option>
						<option value="7">광주</option>
						<option value="8">경기도</option>
						<option value="9">강원도</option>
						<option value="10">충청북도</option>
						<option value="11">충청남도</option>
						<option value="12">전라북도</option>
						<option value="13">전라남도</option>
						<option value="14">경상북도</option>
						<option value="15">경상남도</option>
						<option value="16">제주도</option>
					 </select>
				</div>
				<div class="select-local col-lg-3">
					<select class="boardVCategory" name="boardVCategory">
						<option value="0">카테고리</option>
						<option value="1">맛집</option>
						<option value="2">코스</option>
						<option value="3">명소</option>
					</select>
				</div>
				<div class="select-local col-lg-3">
					<select class="boardVOption" name="boardVOption">
						<option value="0">옵션</option>
						<option value="1">인기순</option>
						<option value="2">별점순</option>
						<option value="3">등록일자순</option>
						<option value="4">댓글순</option>
					</select>
				</div>
				<div class="select-local col-lg-3">
					<button type="submit" class="btn2" value="검색"> 
						검색
					</button>
				</div>
			</div>
			</form>
			<!-- 첫번째 라인 End -->
			<!-- 두번째 라인 Start -->
			<%-- <div class="col-lg-12 seconde-line no-padder">
				<div class="col-lg-2-5"> 
					<!-- <a href="#" class="btn3">
						전체보기				
					</a> -->
					<form action="boardselect" method="post">
						<input type="hidden" name="boardVLocation" value="0" />
						<input type="hidden" name="boardVCategory" value="0" />
						<button type="submit" class="btn3">전체보기</button>
					</form>
				</div>
				<div class="col-lg-2-5">	
					<form action="BoardPartByPopular" method="post">
					<!-- <a href="BoardPartByPopular" class="btn3" id="popular" value="1">인기순</a> -->
					<input type="hidden" name="location" value="<%=location%>" />
					<input type="hidden" name="category" value="<%=category%>" />
					<button type="submit" class="btn3">인기순</button>
					</form>
					
				</div>
				<div class="col-lg-2-5">
 					<form action="BoardPartByStarPt" method="post">
					<input type="hidden" name="location" value="<%=location%>" />
					<input type="hidden" name="category" value="<%=category%>" />
					<button type="submit" class="btn3">별점순</button>
					</form>
				</div>
				<div class="col-lg-2-5">
					<form action="BoardPartByEnrollDate" method="post">
					<input type="hidden" name="location" value="<%=location%>" />
					<input type="hidden" name="category" value="<%=category%>" />
					<button type="submit" class="btn3">등록일자순</button>
					</form>
					
				</div> 
				<div class="col-lg-2-5">
					<form action="BoardPartByCommentCnt" method="post">
					<input type="hidden" name="location" value="<%=location%>" />
					<input type="hidden" name="category" value="<%=category%>" />
					<button type="submit" class="btn3">댓글순</button>
					</form>
					
				</div>
			</div>
			<!-- 두번째 라인 End --> --%>
		</div>
		<br><br>
		<!-- container End -->

		<!-- container2 컨텐츠 내용시작 -->
		<div class="bg-color">
			<div class="container wrapper">
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
      					String c = b.getBdCategory();
      					
  					 %>
					
					<div class="col-lg-6">
					<p class="naming"><%=b.getBdTitle() %></p>
						<%if(c.equals("1")){ %>
							<img class="aared" src="/HereThere/image/eat.png" />
						<%}else if(c.equals("2")){ %>
							<img class="aagreen" src="/HereThere/image/view.png" />
						<%}else if(c.equals("3")){ %>
							<img class="aablue" src="/HereThere/image/pic.png" />
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
					<!-- <div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<div class="score score1"></div>
					<img src="/HereThere/image/img2.png" class="img-rounded center-block" alt="남한산성사진" />
					</div> -->
				</div>
		
				<%}}catch (Exception e){ %>
				<% System.out.println("검색결과 없음"); %>
				<div>검색결과없음</div>
				
				<%} %>

			<!-- contant End -->
			</div>
		</div>
		<!-- container2 컨텐츠 내용END -->
		<!-- footer Start -->
		<div>

		</div>
		<!-- footer End -->
		 <script>
	 	 	$.fn.raty.defaults.path = '/HereThere/raty-2.7.0/lib/images';

	 		$('.score').raty({readOnly:true, score: 2.8 });
	 		
	 		$('#popular').click(function(){
	
	 			$('#ingi').submit();
	 		});
	 			
	 		$('.boardVLocation option:eq(<%=location%>)').attr("selected", "selected");
	 		$('.boardVCategory option:eq(<%=category%>)').attr("selected", "selected");
	 		$('.boardVOption option:eq(<%=option%>)').attr("selected", "selected");
	 		
	 		
	 		
	</script>
	</body>
</html>