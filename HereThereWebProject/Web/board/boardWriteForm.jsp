<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<% Member member = (Member)session.getAttribute("member"); %>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
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
<script type="text/javascript" src="../smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
</head>
<body>
<form id="frm" action="/HereThere/BoardInsert" method="post" accept-charset="utf-8">
<input type="hidden" name="id" value="<%= member.getMemberId()%>">
<input type="text" id="xy" name="xy" />
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
    mapTypeId: google.maps.MapTypeId.TERRAIN
  });

  // This event listener will call addMarker() when the map is clicked.
  map.addListener('click', function(event) {
    addMarker(event.latLng);
  });

  // Adds a marker at the center of the map.
  addMarker(haightAshbury);
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
}

function info(map){
	for(var i = 0; i < markers.length; i++) {
		//alert(markers[i].getPosition());
		$("#xy").val(markers[i].getPosition());
		positions += markers[i].getPosition() + "/";
	}
	
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