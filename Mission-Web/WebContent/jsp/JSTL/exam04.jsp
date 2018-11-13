<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- uri뒤에 ?type=U or type=S  (U:일반유저/S:관리자) --%>
	
	<c:if test="${empty param.type }">
		<h1>파라미터가 전송되지 않았습니다.</h1>
	</c:if>
	
	<c:if test="${param.type eq 'S' }">
		<h1>관리자입니다.</h1>
	</c:if>
	
	<c:if test="${param.type == 'U' }">
		<h1>일반 사용자입니다.</h1>
	</c:if>
</body>
</html>


