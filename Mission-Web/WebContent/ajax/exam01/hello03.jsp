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

	function getXMLHttpRequest(){
		
		if(window.AcriveXObject){
			return new ActiveXObject("Micro");
		}else if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		}
		return null;
	}
		
	function sendRequest(method,url,callback,param){
		
		//2단계 : callback 함수 정의
		httpRequest.onreadystatechange = callback;
		//3단계 : 서버에 비동기요청(초기화 및 요청)
		httpRequest.open(method,url,true);
		httpRequest.send(param);
		
		
		
	}
	
	function requestMsg(){
		//1단계 : XMLHttpRequest 객체 생성
		httpRequest = getXMLHttpRequest();
		sendRequest("GET","hello.jsp",responseMsg,null);
		
			
	}
	function responseMsg(){
		//4단계 서버에 응답완료
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				var msgView = document.getElementById("msgView");
				msgView.innerHTML += httpRequest.responseText;
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