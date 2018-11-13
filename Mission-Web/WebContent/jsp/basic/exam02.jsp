<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<%	
		for(int i=0;i<10;i++){
	%>
		<%-- 아래 i는 표현식으로 출력한 문장이다. --%>
		<%= i %><br>
	<%
		}
	%>

</body>
</html>