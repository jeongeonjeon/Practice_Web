<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/member.css">
<title>Insert title here</title>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.mlec.util.*" %>
<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select *");
	sql.append("from t_member");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
	
%>
<script src="/Mission-Web/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$(':button').click(function(){
			location.href="/Mission-Web";
		});
	});
	
</script>
<style>
 table{border-color: #eee;}
 section td{text-align: center;}
 tr{height: 25px;}
</style>

</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align = "center">
			<hr>
			<h2>전체 회원정보 목록 조회</h2>
			<hr>
			<br>
			<table border="2" cellspacing="0" cellpadding="0">
				<tr>
					<th width="10%">ID</th>
					<th width="10%">NAME</th>
					<th width="10%">PASSWORD</th>
					<th width="20%">EMAIL</th>
					<th width="20%">TEL</th>
					<th>ADDRESS</th>
				</tr>
				<%
				while(rs.next()){
				%>
				<tr>
					<td><%= rs.getString("id") %></td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("password") %></td>
					<td><%= rs.getString("email_id") %>@<%= rs.getString("email_domain") %></td>
					<td><%= rs.getString("tel1") %>-<%= rs.getString("tel2") %>-<%= rs.getString("tel3") %></td>
					<td><%= rs.getString("basic_addr") %> <%= rs.getString("detail_addr") %></td>
				</tr>
				<% 
				}
				%>
			</table>
			<button>목록</button>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>