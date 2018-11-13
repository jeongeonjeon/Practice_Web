<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDAO dao = new BoardDAO();
	
// 	dao.deleteFile(no);	//DB쿼리로 on delete의 cascade사용
	dao.deleteBoard(no);

%>
<script>
	alert("게시물 번호[${param.no}]가 삭제되었습니다.");
	location.href="list.jsp";
</script>  