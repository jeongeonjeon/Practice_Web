<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO dao = new BoardDAO();
	BoardVO board = dao.selectByNo(no);
	
	pageContext.setAttribute("board", board);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "/Mission-Web/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$('#listBtn').click(function(){ 
			location.href="list.jsp";
		});

	});
</script>

</head>
<body>
	<hr width="80%">
	<h2>게시판 수정폼</h2>
	<hr width="80%">
	<br>
	<div align="center">
		<form action="update.jsp?no=${ param.no }" method="post">
			<table style = "width:80%;" border="1" >
				<tr>
					<th width = "25%"> 번호</th>
					<td>
						${ param.no }
						<input type="hidden" name="no" value="${ param.no }" >
						<input type="hidden" name="viewCnt" value="${ param.viewCnt }" >
					</td>
				</tr>		
				<tr>
					<th width = "25%"> 제목</th>
					<td>
						<input type="text" name="title" size="50" value="${ board.title }">
					</td>
				</tr>		
				<tr>
					<th width = "25%"> 글쓴이</th>
					<td>
						${ board.writer }
					</td>
				</tr>		
				<tr>
					<th width = "25%"> 내용</th>
					<td>
						<textarea rows="7" cols="50" name="content">${ board.content }</textarea>
					</td>
				</tr>		
				<tr>
					<th>첨부파일</th>
					<td>
						<c:forEach items="${ fileList }" var="file">
							<a href="/Mission-Web/upload/${file.fileSaveName }">
								${file.fileOriName }&nbsp;(${ file.fileSize}bytes)
							</a>
							<br>
						</c:forEach>
					</td>
				</tr>
			</table>
			<input type="submit" value="수정">
			<input type="button" id="listBtn" value="목록">
		</form>
		
	</div>
	

</body>
</html>