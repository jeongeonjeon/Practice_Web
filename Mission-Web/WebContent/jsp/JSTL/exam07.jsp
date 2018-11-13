<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<c:set var="msg" value="hello jstl" />
		hello jstl 길이 : ${ fn:length("hello jstl") } : ${ fn:length(msg) }<br>
		fn:substring("hello jstl", 2, 8) : ${ fn:substring("hello jstl", 2, 8) }
										 : ${ fn:substring(msg, 2, 8) }<br>
	</body>
</html>