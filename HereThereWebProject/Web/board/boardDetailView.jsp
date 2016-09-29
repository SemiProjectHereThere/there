<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, member.model.vo.Member, board.model.vo.Comment, java.util.ArrayList" %>
<% 
	Board b = (Board)request.getAttribute("board"); 
	Member member = (Member)session.getAttribute("member");
%>
<html>
<head>
  <title> YOGI JOGI </title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  	<link rel="shortcut icon" href="image/111.png.ico">
	<link rel="stylesheet" type="text/css" href="/HereThere/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/HereThere/css/custom.css" />
	<Link rel="stylesheet" type="text/css" href="/HereThere/css/bootstrap.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="/HereThere/js/jquery-3.1.0.min.js"></script>
<style type="text/css">
#map {
	height: 300px;
	width: 300px;
}

#floating-panel {
	width: 180px;
	top: 10px;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}
</style>
 </head>
 
 <body>
<!-- header Start -->
<div class="header clearfix">
	<h1 class="pull-left">
		<a href="index.jsp" title="여기저기">여기저기 here there</a>
	</h1>
	<%
		if(member == null){
	%>
	<div class="pull-right lnb">
		<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/login.html'">로그인</div>
	
		<!-- 로그인 정보 입력 -->
	
		<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/join.html'">회원가입</div>
		
		<!-- 회원가입 정보 입력 -->
		
		<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/member/helpPage.jsp'">도움말</div>
		
		<!-- 도움말 페이지 -->
		
	</div>
	<%
		}else if(member.getManagerYN() != 'Y'){
	%>
	<div class="pull-right lnb">
		<div class="col-lg-4 pull-left" onclick="location.href='MyBoardList?memberId=<%= member.getMemberId() %>&mySelect=0'"><%= member.getMemberName() %></div>
		<!-- 마이페이지로 이동 -->
	
		<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/logout'">로그아웃</div>
		<!-- 로그아웃 -->
		
		<div class="col-lg-4 pull-left menubar1">더보기
			<ul class="submenu">
				<li><a href="/HereThere/nlist?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&pg=1&manageryn=<%= member.getManagerYN() %>">공지사항</a></li>
				<li><a href="/HereThere/mupView?username=<%= member.getMemberName() %>&userId=<%= member.getMemberId() %>">내 정보 수정</a></li>
				<li><a href="/HereThere/help.html?username=<%= member.getMemberName() %>&userId=<%= member.getMemberId() %>">도움말</a></li>
			</ul>
		</div>
	</div>
	<%
		}else{
	%>
	<div class="pull-right lnb">
		<div class="col-lg-4 pull-left" onclick="location.href='MyBoardList?memberId=<%= member.getMemberId() %>&mySelect=0'"><%= member.getMemberName() %></div>
		<!-- 마이페이지로 이동 -->
	
		<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/logout'">로그아웃</div>
		<!-- 로그아웃 -->
		
		<div class="col-lg-4 pull-left menubar1">더보기
		<!-- 더보기 메뉴 -->
			<ul class="submenu">
				<li><a href="/HereThere/admin/adminMainModifyView.jsp?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&manageryn=<%= member.getManagerYN() %>">메인관리</a></li>
				<li><a href="/HereThere/mall?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&pg=1&manageryn=<%= member.getManagerYN() %>">회원관리</a></li>
				<li><a href="/HereThere/nlist?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&pg=1&manageryn=<%= member.getManagerYN() %>">공지사항</a></li>
				<li><a href="/HereThere/mupView?username=<%= member.getMemberName() %>&userId=<%= member.getMemberId() %>">내 정보 수정</a></li>
				<li><a href="/HereThere/help.html?username=<%= member.getMemberName() %>&userId=<%= member.getMemberId() %>">도움말</a></li>
			</ul>
		</div>
	</div>
	<% } %>
</div> 
<!-- header End -->
<div class="container12 detailbd pt-80">
	<div class="header11"><%=b.getBdTitle() %>(<%=b.getBdReadCnt() %>)
		<span> <%=b.getBdEnrollDate() %> </span>
	</div>
	<div class="detailVW">
		<span>작성자 : <%=b.getBdWriter() %></span>
	</div>
	<div class="container11">
		<%=b.getBdContent() %>
	</div>
	<div id="favorite"></div>
	<div class="clearfix11">
				<div class="leftbox">
					<div class="star">
					<%=b.getBdStarPt() %> 
					</div>
					<div class="add">
						
					</div>
				</div>
				<div id="map" class="map11">
					<div></div>
				</div>
			</div>
	
	<%-- <table>
		<tr><td>제목</td><td><%=b.getBdTitle() %></td></tr>
		<tr><td>글쓴이</td><td><%=b.getBdWriter() %></td></tr>
		<tr><td>조회수</td><td><%=b.getBdReadCnt() %></td></tr>
		<tr><td>내용</td><td><%=b.getBdContent() %></td></tr>
	</table> --%>
	
	
	<div>
	<p id="cmtbox"></p>
	</div>
	<div>
		<input type="hidden" name="writer" value="">
						<textarea id="comment" name="comment" cols="20" rows="4"></textarea>
						<input type="button" id="cmInsert" value="댓글달기">	
	</div>
	<div id="map1"></div>
	<a href="/HereThere/BoardUpView?bno=<%=b.getBdNo()%>">수정</a>
	<a href="/HereThere/BoardDelete?bno=<%=b.getBdNo()%>">삭제</a>
</div>
		<!-- footer Start -->
		<div class="footerDetailV">
			<div class="cs">
			<ul>
				<li><h4>C/S Center 및 광고문의</h4></li>
				<li>전화: 02-1234-5678</li>
				<li>팩스: 02-1234-5555</li>
				<li>이메일 : Yogijogi@naver.com</li>
				<li>카카오톡ID : Yogijogi</li>
			</ul>
			</div>
			<div class="cs">
			<ul>
				<li><h4>회사정보</h4></li>
				<li>회사명 : KHCompany</li>
				<li>대표 : 홍길동</li>
				<li>주소 : 서울특별시 강남구 역삼동 KH빌딩 2층</li>
				<li>개인정보관리 책임자 : 홍길동 (Yogijogi@naver.com)</li>
			</ul>
			</div><br>
			<div class="cs2">
			Copyrightⓒ KHCompany. All Rights Reserved.
			</div>
			
		</div>
		<!-- footer End -->
<!-- <div style="width:540px;border:1px solid #000;">
			<div class="header" style="border-bottom:1px solid #000; height:50px;width:500px;margin:0px 20px;line-height:50px;">제목
			<span style="float:right;"> hit </span>
			</div>
			<div class="container" style="width:500px;padding:20px">
				Phasellus nisl nisl, posuere sed, rhoncus ut, tempus sed, orci. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam vitae pede. Mauris euismod erat eget sapien. Pellentesque adipiscing dui ut mi. Nunc porta blandit lectus. Quisque mauris sapien, adipiscing vel, hendrerit eget, commodo a, orci. Vestibulum vel nunc vel nisl rutrum tristique. Nulla facilisi. Nam ultricies. Vivamus mauris orci, consequat sed, venenatis at, congue accumsan, lectus. In hac habitasse platea dictumst. Quisque varius lorem quis libero. Quisque dui nisl, viverra vel, euismod ut, vehicula et, lacus. Phasellus vulputate cursus dolor.
			</div>
			
			3<div class="clearfix" style="overflow:hidden;padding:20px;width:500px;">
				1<div class="leftbox" style="width:230px; float:left;">
					<div class="star" style="height:50px">
					별점★Phasellus nisl nisl, posuere sed, rhoncus ut, 
					</div>
					<div class="add">
						<p><span>닉네임</span> : 야야야야야양야야야야야</p>
						<p><span>닉네임</span> : 야야야야야양야야야야야</p>
						<p><span>닉네임</span> : 야야야야야양야야야야야</p>
						<p><span>닉네임</span> : 야야야야야양야야야야야</p>
					</div>
				</div>1
				2<div class="map" style="float:right;">
					<div></div>
				</div>
			</div>
		<div> -->

<script type="text/javascript">
	var arr = new Array();
	$(function(){
		cmlist();
		favselect();
		
		$('#cmInsert').click(function(){
			var comment = $('#comment').val(); 
// 			console.log(comment);
			$.ajax({
				url : "cmInsert",
				data : {bno :"<%=b.getBdNo()%>", writer :"<%=member.getMemberId()%>", comment : comment},
				type : "get",
				success : function(data){
					if(data != null){
						$('#cmtbox').empty();
						cmlist();
					}
				}
			});
		});
});
	
function cmDelete(num){
	$.ajax({
		url : "cmDelete",
		data : {cmNo : num},
		type : "get",
		success : function(data){
			if(data != null){
			$('#cmtbox').empty();
			cmlist();
			}
		}
	});	
}
	
function cmlist(){
	$.ajax({
		url : "cmList",
		data : {bno :<%=b.getBdNo()%>},
			type : "post",
			dataType : "json",
			success : function(data){
// 				console.log(data);
				var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
				//console.log(jsonStr);
				var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
				
				var values = $("#cmtbox").html();
				for(var i in json.list){
					arr[i] = json.list[i].no;
					//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
// 					values += json.list[i].writer + ", " + decodeURIComponent(json.list[i].content);
					values += "<div>글쓴이 : " + json.list[i].writer + "<br>내용 : " + json.list[i].content + "&nbsp; <input type='button' id='cmDelete' onclick='cmDelete("+arr[i]+")' value='삭제'><hr></div>";
			}	
			$("#cmtbox").html(values);
		}
			
	});
}
function favselect(){
	$.ajax({
		url : "favSelect",
		data : {bno :<%=b.getBdNo()%>, mid : "<%=member.getMemberId()%>" },
			type : "post",
			dataType : "json",
			success : function(data){
				console.log(data);
				if(data.favNo != 0){
					$("#favorite").html("<img src='/HereThere/image/favorite1.png' onclick='favDelete(" + data.favNo + ")'>");
				}else{
					$("#favorite").html("<img src='/HereThere/image/favorite2.png' onclick='favInsert()'>");
				}
		}		
	});
}
function favInsert(){
	$.ajax({
		url : "favInsert",
		data : {bno :<%=b.getBdNo()%>, mid : "<%=member.getMemberId()%>" },
		type : "get",
		success : function(data){
			if(data != null){
				$("#favorite").empty();
				favselect();
			}
		}
	});	
}
function favDelete(num){
	$.ajax({
		url : "favDelete",
		data : {favNo : num},
		type : "get",
		success : function(data){
			if(data != null){
				$("#favorite").empty();
				favselect();
			}
		}
	});	
}
</script>
<script>

// In the following example, markers appear when the user clicks on the map.
// The markers are stored in an array.
// The user can then click an option to hide, show or delete the markers.
var map;
var markers = [];
var xy = [];

var geocoder;
var positions = "";

function initMap() {
<% 
	ArrayList x = new ArrayList();
	ArrayList y = new ArrayList();
	String[] maplist = b.getBdMap().split("/");
	
	for(int i=0; i<maplist.length; i++){
		x.add(maplist[i].substring(maplist[i].indexOf("(") + 1, maplist[i].indexOf(",")));
		y.add(maplist[i].substring(maplist[i].indexOf(",") + 1, maplist[i].indexOf(")")));
	}
%>

  geocoder = new google.maps.Geocoder(); 
  var haightAshbury = {lat: <%=x.get(0)%> , lng: <%=y.get(0)%>};

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 16,
    center: haightAshbury,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  <%for(int i=0; i<maplist.length; i++){%>
  addMarker({lat: <%=x.get(i)%> , lng: <%=y.get(i)%>});
  <% } %>
  // Adds a marker at the center of the map.
  <%-- <%for(int i=0; i<maplist.length; i++){%>
  addMarker(haightAshbury);
  info();
  <% } %> --%>
}

// Adds a marker to the map and push to the array.
function addMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
}

// Sets the map on all markers in the array.
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map); 
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setMapOnAll(null);
  
  
}

// Shows any markers currently in the array.
function showMarkers() {
  setMapOnAll(map);
}

</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA4UBimRxsMtoVBMV5a4PsiQCuN4asQ7IU&signed_in=true&callback=initMap">
</script>
</body>
</html>