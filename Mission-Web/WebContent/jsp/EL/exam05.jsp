<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> b = new HashMap<>();
	b.put("no", "1");
	b.put("title", "test");
	
	pageContext.setAttribute("board", b);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	no : <%= b.get("no") %><br>
	title : <%= b.get("title") %><br>
	
	EL board : ${ board }<br>
	EL no : ${ board.no }<br>
	EL title : ${ pageScope.board.title }<br>
	
	<!-- Map객체에서는 없는 값이 나와도 empty로 인식하지만 자바빈즈클래스는 에러가 난다 -->
	El aaa : ${ board.aaa }<br>
	
</body>
</html>
















