<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#msgView{
		width:500px;
		height:200px;
		border:1px solid red;
	}
</style>
<script>
	var httpRequest = null;
	function requestMsg(){
		//1단계 : XMLHttpRequest 객체 생성
		if(window.AcriveXObject){
			httpRequest = new ActiveXObject("Micro");
		}else if(window.XMLHttpRequest){
			httpRequest = new XMLHttpRequest();
		}
	
		//2단계 : callback 함수 호출
		httpRequest.onreadystatechange = responseMsg;
		
		//3단계 : 서버에 비동기요청(초기화 및 요청)
// 		httpRequest.open(메소드, 요청URL, 동기/비동기);
		httpRequest.open("GET","/Lecture-Web/Hello", true);	//true-비동기/false-동기(기본값)
		httpRequest.send(null);
		
	}
	function responseMsg(){
		//4단계 서버에 응답완료
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				var msgView = document.getElementById("msgView");
				msgView.innerHTML += httpRequest.responseText;
			}
		}3
		
	}

</script>
</head>
<body>
	<h2>서버에서 받은 메세지</h2>
	<div id="msgView"></div>
	<input type="button" value="서버에 자료요청" onclick="requestMsg()">
	
</body>
</html>