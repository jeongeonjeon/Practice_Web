<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		http://localhost:8888/Lecture-Web/jsp/EL/exam02.jsp?id=aaa 호출했을 때의	aaa값을 추출
	 -->
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String[] hobbys = request.getParameterValues("hobby");
		if(hobbys == null){
			hobbys = new String[]{"파라미터 없음"};
		}
	%>
	
	id : <%= id %><br>
	name : <%= name %><br>
	id : <%= request.getParameter("id") %><br>
	name : <%= request.getParameter("name") %><br>
	
	<!-- EL표기법 -->
	id : ${ param.id }<br>
	name : ${ param.name }<br>
	
	<!-- 
		http://localhost:9999/Lecture-Web/jsp/EL/exam02.jsp?id=aaa&name=bbb
				&hobby=music&hobby=movie&hobby=reading 호출
	 -->
<%-- 	 
	<!-- 자바코드로 작성하면 배열의 값이 없을경우 NullPointerException이 발생한다.-->
	<%
		for(int i =0;i<hobbys.length;i++){
	%>
			hobbys[<%= i %>] : <%= hobbys[i] %><br>
	<%
		}
	%>
	
 --%>
 
 	<!-- EL코드의 장점은 NullPointerException이 발생하지 않는다. Null이 아닌 empty란 개념을 사용하고 있기 때문 -->
	hobbys[0] : ${ paramValues.hobby[0] }
	
	
	
</body>
</html>










