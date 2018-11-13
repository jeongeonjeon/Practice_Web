<%@page import="java.util.Enumeration"%>
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
		//Enumeration : 순환자 (Iterator와 같은 기능)
		Enumeration<String> headers = request.getHeaderNames();
		while(headers.hasMoreElements()){	//ite.next()와 같은 기능
			String headerName = headers.nextElement();
			String headerValue = request.getHeader(headerName);
			
			out.println(headerName+":"+headerValue+"<br>");
		}
	%>

</body>
</html>