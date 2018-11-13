<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실행문 연습</title>
</head>
<body>
	<h2>1-10사이의 정수 출력</h2>
	<%-- 
		아래코드는 실행문(scriptlet)으로 자바코드를 실행할 때 사용되는 코드
		System.out.println은 콘솔에 출력될 뿐 화면에 출력되지 않는다.
 	--%>
 	
	<%	
		for(int i=0;i<10;i++){
			out.write(i+"<br>");
		}
	%>
	
</body>
</html>