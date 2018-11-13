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
	<c:choose>
		<c:when test="">
			<h1>관리자입니다.</h1>
		</c:when>
		<c:when test="">
			<h1>사용자입니다.</h1>
		</c:when>
		<c:otherwise>
			<h1>파라미터가 전송되지 않았습니다.</h1>
		</c:otherwise>
	</c:choose>

</body>
</html>