<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
	String[] names = {"홍길동","최길동","강길동","한길동"};
	pageContext.setAttribute("names", names);
	pageContext.setAttribute("length", names.length);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	1~10사이의 정수 출력<br>
	<c:forEach begin="1" end="10" var="i">
		${ i }&nbsp;&nbsp;
	</c:forEach>
	<br><br>
	년도선택 :
	<select>
		<c:forEach begin="1900" end="2018" var="year" step="5">
			<option>${ year }년</option>
		</c:forEach>
	</select>
	<hr>
	<c:forEach items="${ names }" var="name">
		<c:if test="${ name ne names[0] }">
			,
		</c:if>
		${ name }
	</c:forEach>
	<hr>
	<c:forEach begin="0" end="${length-1}" var="i">
		<c:if test="${ i ne 0 }">
			,
		</c:if>
		${ names[i] }
	</c:forEach>
	<hr>
	<%-- 매우 불편한 방법인데 이렇게 짜여진 코드를 종종 볼 수 있다. --%>
	<c:set var="cnt" value="1" />
	<c:forEach items="${ names }" var="name">
		<c:if test="${cnt != 1 }">
			,		
		</c:if>
		${ name }
		<c:set var="cnt" value="${ cnt+1 }"/>
	</c:forEach>
	<hr>
	first:last:index:count<br>
	<c:forEach items="${ names }" var="name" varStatus="loop">
		${ loop.first }:${ loop.last }:${ loop.index }:${ loop.count }<br>
	</c:forEach>
	<hr>
	<c:forEach items="${ names }" var="name" varStatus="loop">
		<%-- <c:if test="${ loop.index ne 0 }"> --%>
		<%-- <c:if test="${ not loop.first }"> --%>
		<c:if test="${ loop.count ne 1 }">
			,
		</c:if>
		${ name }
	</c:forEach>
	<hr>
	<c:forEach items="${ names }" var="name" varStatus="loop">
		${ name }
		<c:if test="${ not loop.last }">
			,			
		</c:if>
	</c:forEach>
	

</body>
</html>


