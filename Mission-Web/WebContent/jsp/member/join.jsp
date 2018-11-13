<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.mlec.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String email_id = request.getParameter("email_id");
	String email_domain = request.getParameter("email_domain");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String post = request.getParameter("post");
	String basic = request.getParameter("basic_addr");
	String detail = request.getParameter("detail_addr");
	
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("insert into t_member(id,name,password,email_id,email_domain,tel1,tel2,tel3,post,basic_addr,detail_addr)");
	sql.append("values(?,?,?,?,?,?,?,?,?,?,?)");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pw);
	pstmt.setString(4, email_id);
	pstmt.setString(5, email_domain);
	pstmt.setString(6, tel1);
	pstmt.setString(7, tel2);
	pstmt.setString(8, tel3);
	pstmt.setString(9, post);
	pstmt.setString(10, basic);
	pstmt.setString(11, detail);
	
	pstmt.executeUpdate();
	JDBCClose.close(pstmt, conn);
	
	
	
	
%>
<script>

alert("가입을 축하합니다.")
location.href="memberMain.jsp";

</script>