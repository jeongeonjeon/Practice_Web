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
		
		sendProcess("GET", "sample.jsp", null, callback);
	}
	
	function callback() {
		
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
// 				var memberList = JSON.parse(httpRequest.responseText);
				var memberList = eval(httpRequest.responseText);
		
				var msg = '';
				msg += '회원 수 : '+memberList.length+'명\n';
				memberList.forEach(function(member){
					msg += member.id + "(" + member.name+")\n";
				});
				debugTrace(msg);
			}
		}
		function debugTrace(msg) {
			var debug = document.getElementById("debug");
			debug.value += msg;
		}
	}
</script>
</head>
<body>
	<h2>JSON DATA 예제</h2>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<input type="button" value="자료요청" onclick="sendOnClick()">
</body>
</html>









