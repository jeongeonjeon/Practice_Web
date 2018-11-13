<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.mlec.board.BoardVO" %>
<%
	//자바빈즈 클래스
	BoardVO b = new BoardVO();
	b.setNo(1);
    b.setTitle("test");
    
    //pageContext영역에 객체 등록
    //이름 : board   값 : 생성된 BoardVO객체
    pageContext.setAttribute("board", b);
    
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	no : <%= b.getNo() %><br>
	no : <%= ((BoardVO)pageContext.getAttribute("board")).getNo() %><br>
<%-- 	no : ${ pageScope.board.no }<br> --%>
	title : <%= b.getTitle() %><br>
	title : <%= ((BoardVO)pageContext.getAttribute("board")).getTitle() %><br>

	EL no : ${ board.no }<br>
	EL title : ${ board.title }<br>
</body>
</html>