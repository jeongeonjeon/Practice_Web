<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/js/jquery-3.3.1.min.js"></script>
<script>
 $(document).ready(function(){
	
	$('#join').click(function(){
		location.href="joinForm.jsp";
	}); 
	$('#select').click(function(){
		location.href="selectMember.jsp";
	}); 
	$('#myPage').click(function(){
		location.href="mypage.jsp";
	}); 
 });

</script>
</head>
<body>
	<div align="center">
		<button id="join">회원가입</button>
		<button id="select">회원목록조회</button>
		<button id="myPage">마이페이지</button>
	</div>
</body>
</html>