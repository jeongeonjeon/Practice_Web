<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 표현식은 null -->
	설정된 세션 ID : <%= id %><br>	
	설정된 세션 PASSWORD : <%= pw %><br>
	<hr>
	<!-- EL표기법은 empty,따라서 El표기법 선호 -->
	설정된 세션 ID : ${ sessionScope.id }<br>
	설정된 세션 PASSWORD : ${ sessionScope.pw }<br>
	<hr>
	<a href="remove.jsp">세션삭제</a>
</body>
</html>