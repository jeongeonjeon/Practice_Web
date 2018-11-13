package kr.co.mlec.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

public class MemberDAO {
	
	public MemberVO selectMypage(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MemberVO member = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select id, name, password, email_id, email_domain");
			sql.append("	 , tel1, tel2, tel3, post, basic_addr, detail_addr, type, reg_date");
			sql.append("  from t_member ");
			sql.append(" where id = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String memberId = rs.getString("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String emailId = rs.getString("email_id");
				String emailDomain = rs.getString("email_domain");
				String tel1 = rs.getString("tel1");
				String tel2 = rs.getString("tel2");
				String tel3 = rs.getString("tel3");
				String post = rs.getString("post");
				String basicAddr = rs.getString("basic_addr");
				String detailAddr = rs.getString("detail_addr");
				String type = rs.getString("type");
				String regDate = rs.getString("reg_date");
				
				member = new MemberVO(memberId, name, password, emailId, emailDomain, tel1, tel2, tel3, post, basicAddr, detailAddr, type, regDate);
			}	
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			JDBCClose.close(pstmt, conn);
		}
		return member;
	}
	
	/**
	 * 로그인 서비스
	 * @param memberVO
	 * @return
	 */
	public MemberVO login(MemberVO memberVO) {
		MemberVO userVO = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, password, type ");
		sql.append("from t_member ");
		sql.append("where id = ? and password = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, memberVO.getId());
			pstmt.setString(2, memberVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("password");
				String type = rs.getString("type");
				
				userVO = new MemberVO(id,pw,type);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	
	
		return userVO;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
