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
	request.setAttribute("id","hong");
	pageContext.setAttribute("name", "gildong");
%>
<%-- 	id : ${ requestScope.id }<br> --%>
	id : ${ id }<br>
	name : ${ name }<br>
	phone : ${ phone }<br>
	<h2>인클루드 전</h2>
	파라미터 미설정 호출<br>
	<jsp:include page = "one.jsp" />
	<h2>인클루드 후</h2>
	<h2>인클루드 전</h2>
	파라미터 설정 호출<br>
	<jsp:include page="one.jsp">
		<jsp:param name="name" value="hong,gil-dong" />
	</jsp:include>
	<h2>인클루드 후</h2>
	phone : ${ phone }<br>
</body>
</html>
