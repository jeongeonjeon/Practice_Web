<%@page import="kr.co.mlec.board.vo.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.mlec.util.AcornFileNamePolicy"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 

	1. 파라미터 추출(title, writer, content)
	2. 추출된 데이터를 이용하여 DB(t_board) 저장
	3. 메세지 출력 후 목록으로 이동 

--%>
<%@ page import = "java.sql.*"  %>
<%
	request.setCharacterEncoding("utf-8");

	String saveFolder = "C:/Lecture/web-workspace/Mission-Web/WebContent/upload";

	MultipartRequest multi = new MultipartRequest( //파일이 날라오기때문에 그것
			request, 
			saveFolder, 
			1024 * 1024 * 3,
			"utf-8",
			new AcornFileNamePolicy()
	);
	
	System.out.print(multi);
 	
	// 1. 게시물 저장(t_board)
	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	
	// 등록할 게시물번호 추출
	int boardNo = dao.selectNo();
	board.setNo(boardNo);
	
	dao.insertBoard(board);
	
	// 2. 첨부파일 저장(t_board_file)
	Enumeration<String> files = multi.getFileNames();
	while(files.hasMoreElements()) {
		String fileName = files.nextElement();
		File f = multi.getFile(fileName);
//		System.out.println(fileName + " : " + f);

		if(f != null) {
			String fileOriName = multi.getOriginalFileName(fileName);
			String fileSaveName = multi.getFilesystemName(fileName);
			int fileSize = (int)f.length();
			
			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			//boardNo저장하기 :(t_board의 no)nextval사용 후 currval는 문제가 생길 수 있음 따라서 사용 안함
			//먼저 저장 후 사용한다. 			
			fileVO.setBoardNo(boardNo);
			dao.insertFile(fileVO);
					
/* 
			System.out.println(fileName);
			System.out.println(fileOriName);
			System.out.println(fileSaveName);
			System.out.println(fileSize); 
*/
			
		}
	}
	
/* 	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO(); 
	
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO(); 
	dao.insertBoard(board); */


			


%>

<script>
	alert("게시물을 등록하였습니다");
	location.href = "list.jsp";
</script>
