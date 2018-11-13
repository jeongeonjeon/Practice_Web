<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1-10 사이의 임의의 정수 10개 출력</h2>
	<%
		Random r = new Random();
	for(int i=0;i<10;i++){
		int ran = r.nextInt(10)+1;
	%>
		추출된 정수는 : <%= ran %> <br>
	<%
	}
	%>
</body>
</html>