<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
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
	margin: auto;
	height: 400px;
	width: 980px;
}

table.writeForm th{
	width: 120px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid white;
    background:  linear-gradient( to right, #ff6600, #ffcc99 );
    text-shadow: 0 0 1px white;
}

table.writeForm td{
	padding-left: 10px;
	padding-right: 10px;
}
#gosub {
	float: right;
	height: 50px;
}
</style>
</head>
<body>
	<!-- header Start -->
	<div class="header clearfix">
		<h1 class="pull-left">
			<a href="/HereThere/indexAction" title="여기저기">여기저기
				here there</a>
		</h1>
		<%
			if (member.getManagerYN() != 'Y') {
		%>
		<div class="pull-right lnb">
			<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/MyBoardList?memberId=<%= member.getMemberId() %>&mySelect=0'"><%= member.getMemberName() %></div>
			<!-- 마이페이지로 이동 -->

			<div class="col-lg-4 pull-left">
				<a href="/HereThere/logout">로그아웃</a>
			</div>
			<!-- 로그아웃 -->

			<div class="col-lg-4 pull-left menubar1">
				더보기
				<ul class="submenu">
					<li><a href="/HereThere/nlist?username=<%= member.getMemberName() %>&userid=<%=member.getMemberId()%>&pg=1&manageryn=<%=member.getManagerYN()%>">공지사항</a></li>
					<li><a href="/HereThere/mupView?userId=<%=member.getMemberId()%>">내정보 수정</a></li>
					<li><a href="/HereThere/member/helpPage.jsp">도움말</a></li>
				</ul>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="pull-right lnb">
			<div class="col-lg-4 pull-left" onclick="location.href='/HereThere/MyBoardList?memberId=<%= member.getMemberId() %>&mySelect=0'"><%=member.getMemberName()%></a>
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
					<li><a href="/HereThere/AdminMainModify?username=<%= member.getMemberName() %>&userid=<%= member.getMemberId() %>&manageryn=<%= member.getManagerYN() %>">메인관리</a></li>
					<li><a href="/HereThere/mall?&username=<%= member.getMemberName() %>&userid=<%=member.getMemberId()%>&pg=1&manageryn=<%= member.getManagerYN() %>">회원관리</a></li>
					<li><a href="/HereThere/nlist?username=<%= member.getMemberName() %>&userid=<%=member.getMemberId()%>&pg=1&manageryn=<%=member.getManagerYN()%>">공지사항</a></li>
					<li><a href="/HereThere/mupView?username=<%= member.getMemberName() %>&userId=<%=member.getMemberId()%>">내정보 수정</a></li>
					<li><a href="/HereThere/member/helpPage.jsp?username=<%= member.getMemberName() %>&userId=<%= member.getMemberId() %>">도움말</a></li>
				</ul>
			</div>
		</div>
		<% } %>
	</div>
	<!-- header End -->
	<script>
	var a = markers.length;
	alert(a);
	//유효성 검사 제목, 내용, 마커3개이하
	function checking1(){
		if(document.frm.title.value == ""){
			alert("제목을 입력하세요")
			return false;
		}else if(document.frm.smarteditor.value == "<p>&nbsp;</p>"){
			alert("내용을 입력하세요")
			return false;
		}else if(document.frm.xyz.value == ""){
			alert("장소를 1개 이상 선택하세요...")
			return false;
		}else if(!(document.frm.xyz.value == "1" || document.frm.xyz.value == "2" || document.frm.xyz.value == "3")){
			alert("장소를 3개 이하로 선택하세요...")
			return false;
		}else {
			alert(document.frm.xyz.value)
			alert("됫다");
		}
			//alert(markers.length);
			
	}
	
	</script>
	<center>
<div class="container pt-80">
	<div class="pt-80"> 
	<form id="frm" name="frm" action="/HereThere/BoardInsert" method="post" onsubmit="return checking1()"
		accept-charset="utf-8">
		<input type="hidden" id="xy" name="xy" size="300" /> 
		<input type="hidden" name="id" value="<%=member.getMemberId()%>">
		<input type="hidden" class="xyz" name="xyz"/>
		<table class="writeForm" width="980px">
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title"  class="form-control" width="auto" /></td>
			</tr>
			<tr>
				<th>지역분류</th>
				<td><select name="location" class="form-control" width="auto">
						<option value="1" selected>서울특별시</option>
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
				</select> &nbsp; &nbsp; <input type="radio" name="category" value="1" checked>코스
					&nbsp; &nbsp; <input type="radio" name="category" value="2">맛집
					&nbsp; &nbsp; <input type="radio" name="category" value="3">명소
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="smarteditor" id="smarteditor" rows="10"
						cols="100" style="width: 820px; height: 480px;"></textarea></td>
			</tr>
		</table>
		<div>
			<input id="address" type="textbox" size="80px" placeholder="지역을 검색하세요, 최대 3개 지역까지 저장가능합니다."> <input
				class="btn btn-success" type="button" value="검색" onclick="codeAddress()">&nbsp;<input class="btn btn-success" onclick="deleteMarkers();" type=button value="삭제">
		</div>
		<div id="r"></div>
		<div id="map"></div>
		<div id=gosub><input class="btn btn-warning" type="button" id="save" value="저장" /> <input class="btn btn-warning"
					type="button" value="취소" /></div>
	</form>
	</div>
</div>
	</center>
	<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/HereThere/smarteditor/SmartEditor2Skin.html", 
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
  geocoder = new google.maps.Geocoder(); 
  var haightAshbury = {lat: 37.5, lng: 127.0124};

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 16,
    center: haightAshbury,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

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
 
  info();
  
}
function clearMarkers() {
	  setMapOnAll(null); 
	}

// Sets the map on all markers in the array.
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map); 
  }
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
	clearMarkers();
  	markers = [];
  	$('#xy').val(null);
  	positions = "";

}

function info(){
	var aa = "";
	
	for(var i = 0; i < markers.length; i++) {
		//alert(markers[i].getPosition());
		
		positions += markers[i].getPosition() + "/";
		
			
		$("#xy").val(positions);
		$(".xyz").val(markers.length);
	}
	positions = "";
	
	
}

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

