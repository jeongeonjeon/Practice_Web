<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr>
id : ${ id }<br>
name : ${ name }<br>	<!-- name은 empty  -->
파라미터 : ${param.name} : <%= request.getParameter("name") %><br>

<h2>인클루드된 내용</h2>
<h2>인클루드된 내용</h2>
<h2>인클루드된 내용</h2>
<h2>인클루드된 내용</h2>
<h2>인클루드된 내용</h2>
<h2>인클루드된 내용</h2>
<hr>

<%
	request.setAttribute("phone", "010-111-2222");

%>