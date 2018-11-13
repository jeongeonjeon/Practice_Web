<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	cnt : ${ cnt }<br>
	1값을 가지는 변수 cnt를 공유영역에 설정(page)<br>
	<!-- 아래코드에서 scope가 없는 이유는 default가 page이기 때문이다. -->
	<c:set var="cnt" value="1" /> 
	
	공유영역에 설정된 변수 출력(page)<br>
	cnt : ${ pageScope.cnt }<br>
	cnt : ${ cnt }<br>
	
	변수 cnt값을 1증가<br>
	<c:set var="cnt" value="${ cnt+1 }"  scope="request"/>
	page cnt : ${ cnt }<br>
	request cnt : ${ requestScope.cnt }<br>
	
	
</body>
</html>

<%--
		JSP공유영역 			EL공유영역					JSTL공유영역
		pageContext			pageScope				page
		request				requestScope			request
		session				sessionScope			session
		application			applicationScope		application
--%>