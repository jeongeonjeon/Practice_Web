package kr.co.mlec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

/**
 * 게시판(t_board)를 CRUD하는 기능클래스
 * @author acorn
 *
 */
public class BoardDAO {
	/**
	 * 조회기능
	 */
	public List<BoardVO> selectAllBoard(int page) {
		
		List<BoardVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * ");
			sql.append("from (select rownum as rnum, e.* ");
			sql.append("	    from (select no, title, writer ");
			sql.append(" 	               , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
			sql.append("			    from t_board ");
			sql.append("		       order by no desc ) e ");
			sql.append("	  )e2 ");
			sql.append(" where rnum between 10*?-9 and 10*? ");

			pstmt = conn.prepareStatement(sql.toString());
					
			
			pstmt.setInt(1, page);
			pstmt.setInt(2, page);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(regDate);
				
				list.add(board);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		
		return list;
	}
	
	/**
	 * 게시물 삽입을 위한 sequence번호 추출(seq_t_board_no)
	 */
	public int selectNo() {
		String sql = "select seq_t_board_no.nextval  from dual ";
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	/**
	 * 게시글 삽입 기능
	 */
	public void insertBoard(BoardVO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into t_board(no, title, writer, content) ");
			sql.append(" values(?, ?, ?, ?) ");
			pstmt = conn.prepareStatement(sql.toString());
			
			int loc = 1;
			
			pstmt.setInt(loc++, board.getNo());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getContent());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		
	}
	
	/**
	 * 게시판 번호로 조회하는 기능
	 */
	
	public BoardVO selectByNo(int no) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		BoardVO board = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, content, view_cnt ");
			sql.append("     , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
			sql.append("  from t_board ");
			sql.append(" where no = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				int boardNo = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				
				board = new BoardVO(boardNo, title, writer, content, viewCnt, regDate);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		
		return board;
	}
	/**
	 * 게시물을 수정하는 기능
	 * @param board
	 */
	public void updateBoard(BoardVO board) {
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
		}catch (Exception e) {
			e.printStackTrace();
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update t_board set title=?,content=?");
			sql.append("where no =?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * view_cnt를 증가하는 기능
	 */
	public void updateViewCnt(int no) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board ");
		sql.append("   set view_cnt = view_cnt + 1 ");
		sql.append(" where no = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 게시물을 삭제하는 기능
	 * @param no
	 * @throws Exception 
	 */
	
	public void deleteBoard(int no) throws Exception {
		
		StringBuilder sql = new StringBuilder();
		sql.append("delete t_board where no=?");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			/*Test obj = new Test();*/
			
		){
			pstmt.setInt(1,no);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	

//------------------------------- 첨부파일 CRUD -----------------------------------
	/**
	 * 첨부파일 저장하는 기능
	 */
	public void insertFile(BoardFileVO fileVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board_file");
		sql.append(" values (seq_t_board_file_no.nextval, ?, ?, ?, ?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, fileVO.getBoardNo());
			pstmt.setString(2, fileVO.getFileOriName());
			pstmt.setString(3, fileVO.getFileSaveName());
			pstmt.setInt(4, fileVO.getFileSize());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 게시물번호에 해당 첨부파일 조회하는 기능
	 */
	
	public List<BoardFileVO> selectFileByNo(int boardNo){
		
		List<BoardFileVO> fileList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, file_ori_name, file_save_name, file_size ");
		sql.append("from t_board_file ");
		sql.append("where board_no = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setNo(rs.getInt("no"));
				fileVO.setFileOriName(rs.getString("file_ori_name"));
				fileVO.setFileSaveName(rs.getString("file_save_name"));
				fileVO.setFileSize(rs.getInt("file_size"));
				
				fileList.add(fileVO);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileList;
	}
	
	/**
	 * 첨부파일 삭제하는 기능
	 */
	public void deleteFile(int boardNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete t_board_file ");
		sql.append("where board_no = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
		){
			pstmt.setInt(1,boardNo);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
}
	
	
	




