<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="kr.co.mlec.util.ConnectionFactory" %>
<%@ page import="kr.co.mlec.board.vo.*" %>
<%@ page import="kr.co.mlec.board.dao.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	BoardDAO dao = new BoardDAO();	
	int pageNo;
	if(request.getParameter("page")==null || request.getParameter("page").length() == 0){
		pageNo = 1;
	}else{
		pageNo = Integer.parseInt(request.getParameter("page"));
	}
	List<BoardVO> boardList = dao.selectAllBoard(pageNo);
	
	// 공유영역 등록(pageContext)
	pageContext.setAttribute("boardList", boardList);
%>    

<%-- <%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append("  from t_board ");
	sql.append(" order by no desc ");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
	
	List<BoardVO> boardList = new ArrayList<>(); 
	while(rs.next()){
		
		int no = rs.getInt("no");
		String title = rs.getString("title");
		String writer = rs.getString("writer");
		String regDate = rs.getString("reg_date");

		BoardVO board = new BoardVO();
		
		board.setNo(no);
		board.setTitle(title);
		board.setWriter(writer);
		board.setRegDate(regDate);
		
		boardList.add(board);
		
	}
	JDBCClose.close(pstmt, conn);
	
	//공유영역 등록(pageContext)
	pageContext.setAttribute("boardList",boardList);
	
%>  --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/board.css">
<title>Insert title here</title>
<script src="/Mission-Web/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('button').click(function() {
		//	location.href = "/Mission-Web/jsp/board/writeForm.jsp";
			location.href = "writeForm.jsp";
		});
	});
	
	function doAction(boardNo){
		<c:if test = "${not empty userVO}">
			location.href = "detail.jsp?no=" + boardNo + "&type=list"
		</c:if>
		<c:if test = "${empty userVO}">
			alert("로그인을 해주세요");
			location.href="/Mission-Web/jsp/login/login.jsp";
		</c:if>
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<hr>
			<h2>게시판 목록</h2>
			<hr>
			<br>
			<table class="list" style="width: 100%;" border="1">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">글쓴이</th>
					<th width="20%">등록일</th>
				</tr>
				<c:forEach items="${ boardList }" var="board">
					<tr>
						<td>${ board.no }</td>
						<td>
							<a onclick="doAction(${ board.no })">
							<%-- <a href="detail.jsp?no=${ board.no }&type=list"> --%>
								<c:out value="${ board.title }" />
							</a>
						</td>
						<td>${ board.writer }</td>
						<td>${ board.regDate }</td>
					</tr>
				</c:forEach>
				
	<%-- 			
				<%
				 	while(rs.next()) {
				 		int no = rs.getInt("no");
				 		String title = rs.getString("title");
				 		String writer = rs.getString("writer");
				 		String regDate = rs.getString("reg_date");
				%>
					<tr>
						<td><%= no %></td>
						<td>
							<a href="detail.jsp?no=<%= no %>"><%= title %></a>
						</td>
						<td><%= writer %></td>
						<td><%= regDate %></td>
					</tr>
				<%
				 	}
				%>
	 --%>			
			</table>
			<br>
			<c:forEach begin="1" end="5" var= "page">
				<span class="inner">
					<a href="list.jsp?page=${ page }"> ${ page } </a>
				</span>
			</c:forEach>
			<br>
			<c:if test="${ not empty userVO }">
				<button>새글 등록</button>
			</c:if>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>
<%-- 
<%
	JDBCClose.close(pstmt, conn);
%>
 --%>













