<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, java.util.ArrayList " %>
<%	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");%>

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
				<a href="#" title="여기저기">여기저기 here there</a>
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
			<div class="col-lg-12 first-line"> 
				<div class="select-local col-lg-4">
					<select>
						<option value="">지역</option>
						<option value="">서울</option>
						<option value="">부산</option>
						<option value="">인천</option>
						<option value="">경기</option>
					 </select>
				</div>
				<div class="select-local col-lg-4">
					<button type="button" class="btn2"> 
						맛집
					</button>
				</div>
				<div class="select-local col-lg-4">
					<button type="button" class="btn2"> 
						코스
					</button>
				</div>
			</div>
			<!-- 첫번째 라인 End -->
			<!-- 두번째 라인 Start -->
			<div class="col-lg-12 seconde-line no-padder">
				<div class="col-lg-2-5">
					<a href="#" class="btn3">
						전체보기				
					</a>
				</div>
				<div class="col-lg-2-5">
					<a href="#" class="btn3">인기순</a>
				</div>
				<div class="col-lg-2-5">
 					<a href="#" class="btn3">별점순</a>
				</div>
				<div class="col-lg-2-5">
					<a href="#" class="btn3">등록일자순	</a>
				</div> 
				<div class="col-lg-2-5">
					<a href="#" class="btn3">댓글순</a>
				</div>
			</div>
			<!-- 두번째 라인 End -->
		</div>
		<!-- container End -->

		<!-- container2 컨텐츠 내용시작 -->
		<div class="bg-color">
			<div class="container wrapper">
			<!-- contant Start -->
			<%for(int i = 1; i<list.size()/2 + 1; i++){ %>
				<div class="col-lg-12 photo-link">
				
				<%for(int j = i*2-1; j<i*2 + 1; j++){ %>
					<%Board b = list.get(j-1); %>
					<% 
						String k ="";
     					String s = b.getBdContent(); 
     					System.out.println("======================================");
      					System.out.println(s.indexOf("/HereThere/SE2"));
      					System.out.println(s.indexOf("&#10;&#10;"));
      					System.out.println("======================================");
      					if(s.indexOf("/HereThere/SE2")!= -1){
      					k = s.substring(s.indexOf("/HereThere/SE2"), s.indexOf("&#10;&#10;"));
      					}
      					
  					 %>
					
					<div class="col-lg-6">
					<p class="naming"><%=b.getBdTitle() %></p>
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
				<%System.out.println(list.size()); %>
				<%if(j == (list.size())){ %>
		
				<% break;}} %>
					<!-- <div class="col-lg-6">
					<p class="naming">가을엔 남한산성 단풍 나들이!!</p>
					<div class="score score1"></div>
					<img src="/HereThere/image/img2.png" class="img-rounded center-block" alt="남한산성사진" />
					</div> -->
				</div>
				
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
	</script>
	</body>
</html>