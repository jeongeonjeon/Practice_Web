<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! private int sum = 0; %>
	<%
		/* 
		for(int i = 1; i <= 10; i++) {
			sum = sum + i;
		} 
		*/
	%>
	<%!
		public int add (int a,int b){
			int sum=0;
			for(int i=a;i<=b;i++){
				sum+=i;
			}
			return sum;
	}
	%>
	<%-- 
	<%
		sum = add(1,10);
	%>
	1 - 10사이의 총합 : <%= sum %><br>
 	--%>
	1 - 10사이의 총합 : <%= add(1,10) %><br>
 	
 
 </body>
</html>