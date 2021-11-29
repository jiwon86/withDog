package a.b.c.com.member.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.member.vo.MemberVO;
import a.b.c.com.member.vo.MemberAuth;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private Logger logger = Logger.getLogger(MemberDAOImpl.class);

	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;

	// 로그인 
	@Override
	public List<MemberVO> read(String userId) {

		logger.info("MemberDAOImpl.read() 함수 실행");

		return sqlSession.selectList("read", userId);
	}

	@Override
	public List<MemberVO> memberSelect(MemberVO mvo) {
		logger.info("MemberDAOImpl.memberSelect() 함수 실행");

		return sqlSession.selectList("memberSelect", mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		logger.info("MemberDAOImpl.memberUpdate() 함수 실행");

		return sqlSession.update("memberUpdate", mvo);
	}

	// 가입하기
	@Override
	public int memberInsert(MemberVO mvo) {
		logger.info("MemberDAOImpl.memberInsert() 함수 실행");
		
		return (Integer)sqlSession.insert("memberInsert",mvo);
	}
	//로그인 체크
	@Override
	public List<MemberVO> loginCheck(MemberVO mvo){
		logger.info("MemberDAOImpl.loginCheck() 함수 실행");
		
		return sqlSession.selectList("loginCheck",mvo);
	}

	// 중복 체크하기
	@Override
	public List<MemberVO> memberIdCheck(MemberVO mvo){
		logger.info("MemberDAOImpl.memberIdCheck() 함수 실행");
		
		return sqlSession.selectList("memberIdCheck",mvo);
	}

	@Override
	public int memberAuthInsert(MemberAuth memberAuth) {
		logger.info("MemberDAOImpl.memberAuthInsert() 함수 실행");
		
		return (Integer)sqlSession.insert("memberAuthInsert", memberAuth);
	}

}
