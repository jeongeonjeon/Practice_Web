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
	<c:set var="msg" value="hi jstl!!" />
	
	value 속성만 지정 : <c:out value="JSTL" /><br>
	msg 변수 설정  : <c:out value="${ msg }" default="msg 없음"/><br>
	
	value속성에 태그가 들어있는 경우(excapeXml=true)<br>
	<c:out value="<hr>" /><br>
	value속성에 태그가 들어있는 경우(excapeXml=false)<br>
	<c:out value="<hr>" escapeXml="false"/><br>
	
	<c:set var="data" value="<hr>" />
	<c:out value="${data}" escapeXml="false" />
	
</body>
</html>