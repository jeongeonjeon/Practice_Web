<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	ul{list-style: none; padding:0; margin: 0;}
	li{float: left; width:16.6%; text-align: center;}
	li::after{content:''; float:right; display:inline-block;position:relative; top:2px; width:1.5px; height:20px;background: #aaa; }
	li:last-child:after {display: none;}
</style>
<script src = "/Mission-Web/js/jquery-3.3.1.min.js"></script>
<script>
	function addFavorite(){
		try{
			window.external.AddFavorite('http://localhost:9999/Mission-Web', '웹사이트01');
		}catch(e){
			alert("현재사용중인 웹에서는 사용할 수 없습니다.\n크롬에서는 ctrl+D를 사용해주세요");
		}
	}

</script>
<table class="topMenu" border="1" width="100%" cellspacing="0" cellpadding="0" >
	<tr>
		<td rowspan="2" style="width: 25%;">
			<a href="/Mission-Web"><img src="/Mission-Web/images/logo.jpg" style="width:100%;"></a>
		</td>
		<td align="right">
<!-- 		<a href ="javascript:window.external.AddFavorite('http://localhost:9999/Mission-Web', '웹사이트01')"> -->
			<a href="#" onclick="addFavorite()">
				즐겨찾기
			</a>
<%-- 			<%
				if(session.getAttribute("userVO")!=null){
					
				}
			%> 
--%>		
			<%-- <c:if test="${ not empty sessionScope.userVO }"> --%>
			<c:if test="${ not empty userVO }">
				[${ userVO.id }님으로 로그인중]
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<ul class="menulist">
				<c:if test="${ userVO.type eq 'S' }">
					<li>
						<a href="/Mission-Web/jsp/member/selectMember.jsp">회원관리</a>
					</li>	
				</c:if>
				<li>
					<a href="/Mission-Web/jsp/board/list.jsp">게시판</a>
				</li>
				<c:choose>
					<c:when test="${ empty userVO }">	
						<li>
							<a href="/Mission-Web/jsp/member/joinForm.jsp">회원가입</a>
						</li>		
						<li>
							<a href="/Mission-Web/jsp/login/login.jsp">로그인</a>
						</li>	
					</c:when>
					<c:otherwise>
						<li>
							<a href="/Mission-Web/jsp/member/mypage.jsp">마이페이지</a>
						</li>		
						<li>
							<a href="/Mission-Web/jsp/login/logout.jsp">로그아웃</a>
						</li>		
					</c:otherwise>
				</c:choose>	
		
			</ul>
		</td>
	</tr>
		
	


</table>
