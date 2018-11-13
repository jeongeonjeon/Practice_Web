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
	<%--
		관리자인 경우 forwardSet.jsp?id=admin
		일반유저 경우 forwardSet.jsp?id=xxx
		관리자와 일반유저 접속에 따른 화면결과를 다르게 전송	
	 --%>
	 
	<h2>결과화면</h2>
	<c:if test="${ param.id eq 'admin' }" >
		<jsp:include page="admin.jsp" />
	</c:if>
	<c:if test="${ param.id ne 'admin' }" >

<%-- 		
		<jsp:forward page="user.jsp">
			<jsp:param value="${ param.id }" name="id"/>
		</jsp:forward>
 --%>
 		
 		<c:set var="id" value="${ param.id }" scope="request" />
		<jsp:include page="user.jsp" />
		
	</c:if>
	
</body>
</html>