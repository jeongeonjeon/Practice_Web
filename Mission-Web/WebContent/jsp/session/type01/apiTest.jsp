<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = session.getId();
	int interval = session.getMaxInactiveInterval();	//default:30분 =1800초
	
	//세션의 유효시간 변경 1800 -> 2초
	session.setMaxInactiveInterval(2);
	int interval2 = session.getMaxInactiveInterval();
	
	//마지막 접속시간
	long lastTime = session.getLastAccessedTime();
	Date d = new Date(lastTime);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>기존의 유효시간 : <%= interval %>초</h3>
	<h3>변경된 유효시간 : <%= interval2 %>초</h3>
	<h3>세션 id(JSESSIONID) : <%= id %></h3>
	<h3>마지막 접속시간 :<%= sdf.format(d) %></h3>
</body>
</html>