<%@page import="kr.co.mlec.member.vo.MemberVO"%>
<%@page import="kr.co.mlec.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.selectMypage(id);
	
	pageContext.setAttribute("member", member);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/member.css">
<title>Insert title here</title>
<script src = "/Mission-Web/js/jquery-3.3.1.min.js"></script>
<script>
 $(document).ready(function(){
	$(':button').click(function(){
		location.href="updateMypage.jsp?id=${ member.id }";
	});
 });




</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<c:if test="${ empty member }">
				<script>
					alert("사용자가 존재하지 않습니다.");
					location.href="mypage.jsp";
				</script>
			</c:if>
			<c:if test="${not empty member }">
				<table>
					<tr>
						<th>ID</th>
						<td><c:out value="${ member.id }" /></td>
					</tr>
					<tr>
						<th>NAME</th>
						<td><c:out value="${ member.name }" /></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><c:out value="${ member.password }" /></td>
					</tr>
					<tr>
						<th>EMAIL</th>
						<td><c:out value="${ member.emailId }" />@<c:out value="${ member.emailDomain }" /></td>
					</tr>
					<tr>
						<th>TEL</th>
						<td><c:out value="${ member.tel1 }" />-<c:out value="${ member.tel2 }" />-<c:out value="${ member.tel3 }" /></td>
					</tr>
					<tr>
						<th>POST</th>
						<td><c:out value="${ member.post }" /></td>
					</tr>
					<tr>
						<th>ADDRESS</th>
						<td><c:out value="${ member.basicAddr }" /> <c:out value="${ member.detailAddr }" /></td>
					</tr>
				</table>
				<input type="button" value="회원정보수정"> 
			</c:if>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>