<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
/* 	
	StringBuilder sql = new StringBuilder();
	StringBuilder sql2 = new StringBuilder();
	Connection conn = new ConnectionFactory().getConnection();
	Connection conn2 = new ConnectionFactory().getConnection();
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	
	sql.append("select view_cnt");
	sql.append("  from t_board ");
	sql.append(" where no = ?");
	
	pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, Integer.parseInt(request.getParameter("no")));
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int viewCnt = rs.getInt("view_cnt");
	viewCnt=0;
	
	sql2.append("update t_board set view_cnt=? where no=?");
	pstmt2 = conn2.prepareStatement(sql2.toString());
	
	pstmt2.setInt(1, viewCnt);
	pstmt2.setInt(2, Integer.parseInt(request.getParameter("no")));

	pstmt2.executeUpdate();
 */	
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setNo(no);
	board.setTitle(title);
	board.setContent(content);
	BoardDAO dao = new BoardDAO();
	
	dao.updateBoard(board);
%>    
<script>
	alert("게시물 [${ param.no}]번이 수정되었습니다.");
	location.href="detail.jsp?no=${ param.no }";
</script>
