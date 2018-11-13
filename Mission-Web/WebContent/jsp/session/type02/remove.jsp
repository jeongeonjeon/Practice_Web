<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%

/* 
	//java를 이용한 세션삭제
	session.removeAttribute("id");
	session.removeAttribute("pw");
 */	
 	//java를 이용한 세션 전체 삭제
 	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	<!-- JSTL을 이용한 세션삭제 -->
	<c:remove var="id" scope="session"/>
	<c:remove var="pw" scope="session"/>
 --%>	
	<h2>세션삭제 완료</h2>
	<a href="get.jsp">삭제된 세션 확인</a>
</body>
</html>