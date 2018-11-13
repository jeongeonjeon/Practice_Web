package kr.co.mlec.test;

import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.util.List;

import org.junit.Ignore;
import org.junit.Test;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.util.ConnectionFactory;

public class BoardTest {

	@Ignore
	@Test
	public void DB접속테스트() throws Exception {
		Connection conn = new ConnectionFactory().getConnection();
		
		assertNotNull(conn);
	}
	
	@Ignore
	@Test
	public void 게시판조회테스트() throws Exception {
		
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectAllBoard(1);
		
		for(BoardVO board : list) {
			System.out.println(board);
		}
	}
	
	@Ignore
	@Test
	public void 게시판삽입테스트() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("안녕");
		board.setWriter("홍씨");
		board.setContent("이제 안녕~~~");
		
		BoardDAO dao = new BoardDAO();
		dao.insertBoard(board);
	}
	
	@Test
	public void 첨부파일조회테스트() throws Exception {
		
		BoardDAO dao = new BoardDAO();
		List<BoardFileVO> fileList = dao.selectFileByNo(31);
		
		
		for(BoardFileVO fileVO : fileList) {
			System.out.println(fileVO);
		}
	}
	
}








