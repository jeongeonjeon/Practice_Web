<%@page import="kr.co.mlec.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberVO member = new MemberVO(); 
	member.setId(id);
	member.setPw(pw);
	
	//세션 등록
	session.setAttribute("member", member);
	

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션설정 완료</h2>
	<a href = "get.jsp">설정된 세션 확인</a>
</body>
</html>