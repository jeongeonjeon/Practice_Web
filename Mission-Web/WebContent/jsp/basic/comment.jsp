<%-- 아래 <%@ %>는 지시자  - 환경설정을 해준다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<%--아래 코드는 자바의 import와 동일한 의미이다. --%>
<%@ page import = "java.util.Random" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		JSP주석문 : 서블릿으로 변환되지 않기 때문에 화면에 출력되지 않음	
	 --%>	
	 <!-- 
	 	컨턴트주석문 : 서블릿으로 변환되어 브라우저에 전송되지만 웹브라우저에서 해석되지 않아 출력되지 않음
	  -->
	
	화면에 주석문이 출력이 됩니까?
	
</body>
</html>