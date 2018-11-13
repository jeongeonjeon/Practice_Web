<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/member.css">
<title>Insert title here</title>
<script src="/Mission-Web/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$('.reset').click(function(){ 
			location.href="/Mission-Web";
		
		});
	});
	
	function checkForm(){
		var f = document.jForm;
		var id = f.id.value;
		var name = f.name.value;
		var pw = f.pw.value;
		
		if(id==''||name==''||pw==''){
			alert("아이디, 이름, 비밀번호는 필수입니다.")
			return false;
		}
		return true;
	}
	
	function requestMsg(){
		
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align = "center">
			<hr>
			<h2>회원가입</h2>
			<hr>
			<br>
			<form method="post" name="jForm" action="join.jsp" onsubmit="return checkForm()">  
				<table class="joinForm" border="3" cellspacing="0" cellpadding="0" width="80%" >
					<tr>
						<th>ID</th>
						<td>
							&nbsp;&nbsp;<input type="text" name="id" size="20">
							<input type="button" value="중복확인" onclick="requestMsg()">
						</td>
					</tr>
					<tr>
						<th>NAME</th>
						<td>&nbsp;&nbsp;<input type="text" name="name" size="20"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td>&nbsp;&nbsp;<input type="password" name="pw" size="20"></td>
					</tr>
					<tr>
						<th>EMAIL</th>
						<td>&nbsp;&nbsp;<input type="text" name="email_id" size="19"> @ <input type="text" name="email_domain" size="19"></td>
					</tr>
					<tr>
						<th>TEL</th>
						<td>&nbsp;&nbsp;<input type="text" name="tel1" size="3"> - <input type="text" name="tel2" size="4"> - <input type="text" name="tel3" size="4"></td>
					</tr>
					<tr>
						<th>POST</th>
						<td>&nbsp;&nbsp;<input type="text" name="post" size="7"></td>
					</tr>
					<tr>
						<th>ADDRESS</th>
						<td>
							&nbsp;&nbsp;<input type="text" name="basic_addr" size="60"><br>
							&nbsp;&nbsp;<input type="text" placeholder="상세주소" name="detail_addr" size="60">
						</td>
					</tr>
				</table>
				<br>
				<input type="button" class="reset" value="취소">&nbsp;&nbsp;&nbsp;
				<input type="submit" value="가입">
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>