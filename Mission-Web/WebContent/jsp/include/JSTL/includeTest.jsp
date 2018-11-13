<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var ="id" value="hong" scope="request" /> 
	<h2>인클루드 전</h2>
	파라미터 미설정 호출방식<br>
	<c:import url="one.jsp" />
	<h2>인클루드 후</h2>
	<h2>인클루드 전</h2>
	파라미터 설정 호출방식<br>
	<c:import url="one.jsp">
		<c:param name="name" value="hong,gil-dong" /> 
	</c:import>
	<h2>인클루드 후</h2>
</body>
</html>