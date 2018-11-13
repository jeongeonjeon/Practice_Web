<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="httpRequest.js"></script>
<script>
	function sendOnClick() {
	/*
		사용자가 입력한 name, age, addr를 추출
		sample.jsp에게 요청(ajax비동기통신)
		응답결과를 textarea 업데이트
	*/

		var params = "name=홍길동&age=30&addr=서울시 강남구 역삼동";
	//	var params = {name : '홍길동', age : 30, addr : '서울시 강남구 역삼동'};
	
		sendProcess("GET", "sample.jsp", params, callback);
	}
	
	function callback() {
		var msg = '';
		switch(httpRequest.readyState) {
		case 1 :
			msg += 'Loading...\n';
			break;
		case 2 : 
			msg += 'Loaded...\n';
			break;
		case 3 : 
			msg += 'Interactive...\n';
			break;
		case 4 : 
			msg += 'Complete...\n';
			if(httpRequest.status == 200) {
				msg += '웹서버에서 정상적으로 수행...\n';
				msg += '실행결과 : ' + httpRequest.responseText + '\n';
			} else {
				msg += '웹서버에서 오류 발생...\n';
				msg += '오류코드 : ' + httpRequest.status + '\n';
				msg += '오류내용 : ' + httpRequest.statusText + '\n';
			}
			msg += '============================================================\n';
		}
		debugTrace(msg);
		
	}
	
	function debugTrace(msg) {
		var debug = document.getElementById("debug");
		debug.value += msg;
	}
</script>
</head>
<body>
	<h2>XMLHttpRequest 모듈을 이용한 예제</h2>
	<textarea rows="10" cols="80" id="debug"></textarea>
	
	<form name="inputForm">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		주소 : <input type="text" name="addr"><br>
		<input type="button" value="서버에 자료전송" onclick="sendOnClick()">
	</form>
</body>
</html>

















