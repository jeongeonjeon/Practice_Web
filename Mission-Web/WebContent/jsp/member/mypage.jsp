<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/member.css">
<script>
	function checkFunc(){
		var s = document.sForm;
		if(s.search_id.value==''){
			alert("아이디를 입력해주세요");
			return false;
		}
		if(s.search_id.value !=  "${userVO.id}"){
			alert("아이디를 다시 입력해주세요");
			return false;
		}
		return true;
	}

</script>
<style>
	tr{height:30px;}
</style>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<br><br><br><br><br><br><br>
		<div align="center">
			<form method="post" name="sForm" action="detailMypage.jsp" onsubmit="return checkFunc()">
				<table align="center">
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" size="20"></td>
					</tr>
				</table>
				<br>
				<input type="submit" value="조회">
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>