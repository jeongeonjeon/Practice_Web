<%@page import="kr.co.mlec.member.dao.MemberDAO"%>
<%@page import="kr.co.mlec.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//VO객체 생성 후 초기화
	MemberVO memberVO = new MemberVO();
	memberVO.setId(id);
	memberVO.setPassword(pw);
	
	//DB에서 로그인 수행
	MemberDAO dao = new MemberDAO();
	MemberVO userVO = dao.login(memberVO);
		
	//반환값이 null			-->로그인 실패
	//반환값이 null 아닌경우	-->로그인 성골
	
	String msg = "";
	String url = "";
	if(userVO == null){
		msg = "아이디 또는 패스워드가 잘못입력되었습니다.";
		url = "login.jsp";
	}else{
		//세션 등록
		session.setAttribute("userVO", userVO);
		
		
		if(userVO.getType().equals("S")){
			msg = "관리자님 환영합니다.";
		}else{
			msg = userVO.getId() +"님 환영합니다.";
		}
		url = "/Mission-Web";
	}
			
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
%>    
<script>
<%-- 
	alert('<%= msg %>');
	location.href = "<%= url%>";
 --%>
 
 	alert('${msg}');
 	location.href = '${ url }';
</script>













