<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<title>Insert title here</title>
<script src="/Mission-Web/js/checkForm.js"></script>
<script>
	function checkForm(){
		var f = document.lForm;
		
		if(isNull(f.id,"아이디를 입력하세요")){
			return false;
		}
		if(isNull(f.pw,"비밀번호를 입력하세요")){
			return false;
		}
		/* 
		if(f.id.value == ""){
			alert("아이디를 입력하세요");
			f.id.focus();
			
			return false;
		} 
		*/
		
		return true;
	}

</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<hr>
			<h2>로그인</h2>
			<hr>
			<br><br>
			<form method="post" action="loginProcess.jsp" name="lForm" onsubmit="return checkForm()">
				<table style="width:50%;">
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" size="20"></td>
					</tr>
					<tr>
						<td>PASSWORD</td>
						<td><input type="password" name="pw" size="20"></td>
					</tr>
				</table>
				<input type="submit" value="로그인"> 
			</form>
			
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>

</body>
</html>