<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//객체등록 : 공유영역.setAttribute("이름","값")
	//공유영역 4가지 : pageContext, request, session, application
	pageContext.setAttribute("msg", "page영역에 등록");
	
	//return type : Object이므로 명시적 형번환 필요
	String message = (String)pageContext.getAttribute("msg");	
	
	//request영역인 id에 "hong" 등록
	request.setAttribute("id", "hong");
	
	//request영역의 id조회
	String id = (String)request.getAttribute("id");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 
		공유영역 4가지 : pageScope, requestScope, sessionScope, applicationScope 
	 -->
	empty msg : ${empty msg}<br>
	msg : ${pageScope.msg }<br>
	msg : ${msg }<br>
	
	message : <%= message %><br>
	message : <%= pageContext.getAttribute("msg") %><br>
	
	id : ${ requestScope.id }<br>
	id : ${ id }<br>
	
	

</body>
</html>