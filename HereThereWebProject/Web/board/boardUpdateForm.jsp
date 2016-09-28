<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board, member.model.vo.Member, java.util.ArrayList"%>
<% 
	Board b = (Board)request.getAttribute("board"); 
	Member member = (Member)session.getAttribute("member");
%>
<html>
<head>
<title>글쓰기 페이지</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="shortcut icon" href="/HereThere/image/111.png.ico">
<link rel="stylesheet" type="text/css" href="/HereThere/css/common.css" />
<link rel="stylesheet" type="text/css" href="/HereThere/css/custom.css" />
<Link rel="stylesheet" type="text/css" href="/HereThere/css/bootstrap.css" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HereThere/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
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
			<a href="index.jsp" title="여기저기">여기저기
				here there</a>
		</h1>
		<%
			if (member.getManagerYN() != 'Y') {
		%>
		<div class="pull-right lnb">
			<div class="col-lg-4 pull-left">
				<a href="myInfo?memberId=<%=member.getMemberId()%>"><%=member.getMemberName()%></a>
			</div>
			<!-- 마이페이지로 이동 -->

			<div class="col-lg-4 pull-left">
				<a href="/HereThere/logout">로그아웃</a>
			</div>
			<!-- 로그아웃 -->

			<div class="col-lg-4 pull-left menubar1">
				더보기
				<ul class="submenu">
					<li><a href="/HereThere/nlist?userid=<%=member.getMemberId()%>&pg=1&manageryn=<%=member.getManagerYN()%>">공지사항</a></li>
					<li><a href="/HereThere/mupView?userId=<%=member.getMemberId()%>">내정보 수정</a></li>
					<li><a href="/HereThere/help.html">도움말</a></li>
				</ul>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="pull-right lnb">
			<div class="col-lg-4 pull-left"><%=member.getMemberName()%></a>
			</div>
			<!-- 마이페이지로 이동 -->

			<div class="col-lg-4 pull-left">
				<a href="/HereThere/logout">로그아웃</a>
			</div>
			<!-- 로그아웃 -->

			<div class="col-lg-4 pull-left menubar1">
				더보기
				<!-- 더보기 메뉴 -->
				<ul class="submenu">
					<li><a href="/HereThere/mall?userid=<%=member.getMemberId()%>&pg=1">회원관리</a></li>
					<li><a href="/HereThere/nlist?userid=<%=member.getMemberId()%>&pg=1&manageryn=<%=member.getManagerYN()%>">공지사항</a></li>
					<li><a href="/HereThere/mupView?userId=<%=member.getMemberId()%>">내정보 수정</a></li>
					<li><a href="/HereThere/help.html">도움말</a></li>
				</ul>
			</div>
		</div>
		<% } %>
	</div>
<div class="container pt-80">
<form id="frm" action="/HereThere/BoardUpdate" method="post" accept-charset="utf-8">
<input type="text" id="xy" name="xy" size="300" />
<input type="hidden" name="id" value="<%=b.getBdWriter()%>">
<input type="hidden" name="no" value="<%=b.getBdNo()%>">
<table width="100%">

		<tr>
			<td>제목</td>
			<td><input type="text" id="title" name="title" value="<%=b.getBdTitle()%>"/></td>
		</tr>
		<tr>
			<td>지역분류</td>
			<td>
			<%
				String loc = b.getBdLocation();
				String[] select = new String[16];
				if(loc.equals("1")) select[0] = "selected";
				if(loc.equals("2")) select[1] = "selected";
				if(loc.equals("3")) select[2] = "selected";
				if(loc.equals("4")) select[3] = "selected";
				if(loc.equals("5")) select[4] = "selected";
				if(loc.equals("6")) select[5] = "selected";
				if(loc.equals("7")) select[6] = "selected";
				if(loc.equals("8")) select[7] = "selected";
				if(loc.equals("9")) select[8] = "selected";
				if(loc.equals("10")) select[9] = "selected";
				if(loc.equals("11")) select[10] = "selected";
				if(loc.equals("12")) select[11] = "selected";
				if(loc.equals("13")) select[12] = "selected";
				if(loc.equals("14")) select[13] = "selected";
				if(loc.equals("15")) select[14] = "selected";
				if(loc.equals("16")) select[15] = "selected";
				
			%>
			<select name="location">
				<option value="1" <%=select[0] %>>서울특별시</option>
				<option value="2" <%=select[1] %>>인천광역시</option>
				<option value="3" <%=select[2] %>>부산광역시</option>
				<option value="4" <%=select[3] %>>울산광역시</option>
				<option value="5" <%=select[4] %>>대구광역시</option>
				<option value="6" <%=select[5] %>>대전광역시</option>
				<option value="7" <%=select[6] %>>광주광역시</option>
				<option value="8" <%=select[7] %>>경기도</option>
				<option value="9" <%=select[8] %>>강원도</option>
				<option value="10" <%=select[9] %>>충청북도</option>
				<option value="11" <%=select[10] %>>충청남도</option>
				<option value="12" <%=select[11] %>>전라북도</option>
				<option value="13" <%=select[12] %>>전라남도</option>
				<option value="14" <%=select[13] %>>경상북도</option>
				<option value="15" <%=select[14] %>>경상남도</option>
				<option value="16" <%=select[15] %>>제주도</option>
			</select> &nbsp; &nbsp;
			<% if(b.getBdCategory().equals("1")){ %>
			<input type="radio" name="category" value="1" checked>코스 &nbsp; &nbsp;
			<input type="radio" name="category" value="2">맛집 &nbsp; &nbsp;
			<input type="radio" name="category" value="3">명소 
			<%}else if(b.getBdCategory().equals("2")){ %>
			<input type="radio" name="category" value="1">코스 &nbsp; &nbsp;
			<input type="radio" name="category" value="2" checked>맛집 &nbsp; &nbsp;
			<input type="radio" name="category" value="3">명소 
			<%}else if(b.getBdCategory().equals("3")){ %>
			<input type="radio" name="category" value="1">코스 &nbsp; &nbsp;
			<input type="radio" name="category" value="2">맛집 &nbsp; &nbsp;
			<input type="radio" name="category" value="3" checked>명소 
			<% } %>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="upsmart" id="upsmart" rows="10" cols="100" style="width:766px; height:412px;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="save" value="저장"/>
				<input type="button" value="취소"/>
			</td>
		</tr>
</table>
<div>
		<input id="address" type="textbox" value="Sydney, NSW">   
		<input type="button" value="검색" onclick="codeAddress()"> 
	</div>
	<div id="r"></div>
    <div id="floating-panel">
      <input onclick="clearMarkers();" type=button value="숨김">
      <input onclick="showMarkers();" type=button value="모두보기">
      <input onclick="deleteMarkers();" type=button value="삭제">
    </div>
    <div id="map"></div>
    <p></p>
	<div class="info">
		<input onclick="info()" type=button value="전송">
	</div>
</form>
</div>
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
        	var sHTML = '<%=b.getBdContent()%>';
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
})
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
  var haightAshbury = {lat: <%=x.get(0)%>, lng: <%=y.get(0)%>};

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 16,
    center: haightAshbury,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  <%for(int i=1; i<maplist.length; i++){%>
  addMarker({lat: <%=x.get(i)%> , lng: <%=y.get(i)%>});
  <% } %>

  // This event listener will call addMarker() when the map is clicked.
  map.addListener('click', function(event) {
    addMarker(event.latLng);
  });

  // Adds a marker at the center of the map.
  addMarker(haightAshbury);
  info();
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

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
	clearMarkers();
  	markers = [];
  	$('#xy').val(null);
  	positions = "";

}


//add marker
	
/* 	var contents = "이곳은 서대전네거리역이다! <br/> 지하철 타러 가자~";
	
	var infowindow = new google.maps.InfoWindow({ content: contents});

	google.maps.event.addListener(marker, "click", function() {
        alert("h2");    
        
		infowindow.open(map, marker);
        }); */
//-----------
function codeAddress(){  
    var address = document.getElementById("address").value;  
    var r = document.getElementById("r");  
      
    r.innerHTML = '';  
      
    geocoder.geocode({  
        'address': address  
    }, function(results, status){
        if (status == google.maps.GeocoderStatus.OK) {  
            map.setCenter(results[0].geometry.location);  
            //addMark(results[0].geometry.location.lat(), results[0].geometry.location.lng());  
                          
            for(var i in  results){  
                //r.innerHTML += results[i].formatted_address+',';  
                var li = document.createElement('li');  
                var a = document.createElement('a');  
                //a.href = "javascript:addMark(" + marker.position.lat() + ", " + marker.position.lng() + ");";  
                a.innerHTML = results[i].formatted_address;  
   
                li.appendChild(a);  
                r.appendChild(li);  
            }             
        } else {  
            r.innerHTML = "검색 결과가 없습니다."+status;              
        }  
    });  
}  
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA4UBimRxsMtoVBMV5a4PsiQCuN4asQ7IU&signed_in=true&callback=initMap"></script>
</body>
</html>