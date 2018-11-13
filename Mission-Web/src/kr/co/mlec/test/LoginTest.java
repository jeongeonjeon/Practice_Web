package kr.co.mlec.test;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import kr.co.mlec.member.dao.MemberDAO;
import kr.co.mlec.member.vo.MemberVO;

public class LoginTest {
	@Test
	public void 로그인테스트() throws Exception{
		MemberVO memberVO = new MemberVO("admin","admin");
		MemberDAO dao = new MemberDAO();
		MemberVO userVO = dao.login(memberVO);
		
		assertNotNull(userVO);
		System.out.println(userVO);
	}

}
