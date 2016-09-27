<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, member.model.vo.Member, board.model.vo.Comment, java.util.ArrayList" %>
<% 
	Board b = (Board)request.getAttribute("board"); 
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail View</title>
<style type="text/css">
#map {
        height: 300px;
		width: 300px;
      }
#floating-panel {
  width:180px;
  top: 10px;

  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}
</style>
<script type="text/javascript" src="/HereThere/js/jquery-3.1.0.min.js"></script>
</head>
<body>
	<div>제목<%=b.getBdTitle() %></div>
	<div>글쓴이<%=b.getBdWriter() %></div>
	<div>내용<%=b.getBdContent() %></div>
	<br>
	<a href="/HereThere/BoardUpView?bno=<%=b.getBdNo()%>">수정</a>
	<a href="/HereThere/BoardDelete?bno=<%=b.getBdNo()%>">삭제</a>
	<div>
	<p id="p5"></p>
	</div>
	<div>
			<input type="hidden" name="writer" value="">
			<textarea id="comment" name="comment" cols="20" rows="4"></textarea>
			<input type="button" id="cmInsert" value="댓글달기">
	</div>
	<div id="map"></div>	
<script type="text/javascript">
	$(function(){
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
				
				var values = $("#p5").html();
				
				for(var i in json.list){
					//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
// 					values += json.list[i].writer + ", " + decodeURIComponent(json.list[i].content);
					values += json.list[i].writer + ", " + json.list[i].content;
				}	
				$("#p5").html(values);
			}
		});
		
		$('#cmInsert').click(function(){
			var comment = $('#comment').val(); 
// 			console.log(comment);
			$.ajax({
				url : "cmInsert",
				data : {bno :"<%=b.getBdNo()%>", writer :"<%=m.getMemberId()%>", comment : comment},
				type : "get",
				dataType : "json",
				success : function(data){
					var values = $("#p5").html();
					$("#p5").html("");
					
					values += data.writer + "," + data.comment;
					$("#p5").html(values);
				}
		});
	});
	});
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
    mapTypeId: google.maps.MapTypeId.TERRAIN
  });
  
  <%for(int i=0; i<maplist.length; i++){%>
  addMarker({lat: <%=x.get(i)%> , lng: <%=y.get(i)%>});
  System.out.print(x.get(i));
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
 
  info();
  
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