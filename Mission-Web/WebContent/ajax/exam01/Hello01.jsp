<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#msgView {
		width: 500px;
		height: 200px;
		border: 1px solid red;
	}
</style>
<script>
	var httpRequest = null;
	function requestMsg() {
		
		// 1. XMLHttpRequest 객체 생성
		if(window.XMLHttpRequest) {
			httpRequest = new XMLHttpRequest();
		} else if(window.ActiveXObject) {
			http = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		// 2. 콜백함수 정의
		httpRequest.onreadystatechange = responseMsg;
		
		// 3. 서버에 비동기요청
		httpRequest.open("get", "hello.jsp", true);
		httpRequest.send(null);
	}
	
	function responseMsg() {
		// 4. 서버에서 응답완료
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				// 5. 응답결과를 화면에 출력
				var msgView = document.getElementById("msgView");
				msgView.innerHTML = httpRequest.responseText;
			}
		}
	}
</script>
</head>
<body>
	<h2>서버에서 받은 메세지</h2>
	<div id="msgView"></div>
	<input type="button" value="서버에 자료요청" onclick="requestMsg()">
</body>
</html>












