<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/css/layout.css" >
<link rel="stylesheet" href="/Mission-Web/css/board.css" >
<script src="/Mission-Web/js/jquery-3.3.1.min.js"></script>
<script src="/Mission-Web/js/checkForm.js"></script>
<script>
	<c:if test="${ empty userVO}">
		location.href = "/Mission-Web/jsp/login/login.jsp";
	</c:if>

	$(document).ready(function() {
		$(':button').click(function() {
			location.href = "list.jsp";
		});
	});
	
	function checkForm() {
		var f = document.wForm;
		
		if(f.title.value == '') {
			alert('제목을 입력하세요');
			f.title.focus();
			return false;
		}
		
		if(f.writer.value == '') {
			alert('글쓴이를 입력하세요'); 
			f.writer.focus();
			return false;
		}
		
		if(f.content.value == '') {
			alert('내용을 입력하세요'); 
			f.content.focus();
			return false;
		}
		
		// 확장자 체크
		 if(checkExt(f.attachfile1))
			return false;
		 if(checkExt(f.attachfile2))
			return false; 
		
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
			<h2>게시판 등록폼</h2>
			<hr> 
			<br>
			<form method="post" action="write.jsp" name="wForm"
				  enctype="multipart/form-data"
				  onsubmit="return checkForm()" >
				<input type="hidden" name="writer"value="${ userVO.id }">   
				<table style="width: 100%;" border="1">
					<tr>
						<th width="23%">제목</th>
						<td>
							<input type="text" name="title" size="50">
						</td>
					</tr>
					<tr>
						<th width="23%">글쓴이</th>
						<td>
							${ userVO.id }
						</td>
					</tr>
					<tr>
						<th width="23%">내용</th>
						<td>
							<textarea rows="7" cols="50" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="attachfile1">
							<input type="file" name="attachfile2">
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" value="등록">&nbsp;&nbsp;
				<input type="button" value="목록">
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>

</body>
</html>















