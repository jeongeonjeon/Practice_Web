<%@page import="kr.co.mlec.board.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<%
	// http://localhost:8888/Mission-Web/jsp/board/detail.jsp?no=12
	
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO dao = new BoardDAO();
	
	/*
		목록페이지에서 상세페이지로 오는경우 조회수 증가 => type=list 파라미터 추가
		수정페이지에서 상세페이지로 오는경우 조회수 증가X
	*/
	String type = request.getParameter("type");
	if(type != null && type.equals("list")) {
		dao.updateViewCnt(no);
	}
	
	// 해당 게시물 조회
	BoardVO board = dao.selectByNo(no);
	
	//첨부파일 조회
	List<BoardFileVO> fileList = dao.selectFileByNo(no);
	
	pageContext.setAttribute("board", board);
	pageContext.setAttribute("fileList", fileList);
	
	
	
/* 	
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, content, view_cnt ");
	sql.append("     , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append("  from t_board ");
	sql.append(" where no = ? ");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, no);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
 */	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/board.css">
<script>
	function doAction(type){
		switch(type){
		case 'L' :
			location.href = "list.jsp";
			break;
		case 'U' : 
			location.href = "updateForm.jsp?no=${param.no}";
			break;
		case 'D' : 
			if(confirm("삭제하시겠습니까?")){
				location.href = "delete.jsp?no=${param.no}";
			}
			break;
		}
	}

</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
	
		<div align="center">
			<hr width="80%">
			<h2>게시판 상세</h2>
			<hr width="80%">
			<br>
			<table style="width:80%" border="1">
				<tr>
					<th width="25%">번호</th>
					<td>
	<%-- 					<%= rs.getInt("no") %> --%>
						<c:out value="${ board.no }" />
					</td>
				</tr>
				<tr>
					<th width="25%">제목</th>
					<td>
	<%-- 					<%= rs.getString("title") %> --%>
						<c:out value="${ board.title }" />
					</td>
				</tr>
				<tr>
					<th width="25%">글쓴이</th>
					<td>
	<%-- 					<%= rs.getString("writer") %> --%>
						<c:out value="${ board.writer }" />
					</td>
				</tr>
				<tr class="content">
					<th  width="25%">내용</th>
					<td>
	<%-- 					<%= rs.getString("content") %> --%>
						<c:out value="${ board.content }" />
					</td>
				</tr>
				<tr>
					<th width="25%">조회수</th>
					<td>
	<%-- 					<%= rs.getInt("view_cnt") %> --%>
						<c:out value="${ board.viewCnt }" />
					</td>
				</tr>
				<tr>
					<th width="25%">등록일</th>
					<td>
	<%-- 					<%= rs.getString("reg_date") %> --%>
						<c:out value="${ board.regDate }" />
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
			<br><br>
			<input type="button" value="수정" onclick="doAction('U')">&nbsp;&nbsp;
			<input type="button" value="삭제" onclick="doAction('D')">&nbsp;&nbsp;
			<input type="button" value="목록" onclick="doAction('L')">
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>









