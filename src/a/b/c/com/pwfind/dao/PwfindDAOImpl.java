package a.b.c.com.pwfind.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.member.vo.Member;

@Repository
public class PwfindDAOImpl implements PwfindDAO{
	
	Logger logger = Logger.getLogger(PwfindDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member pwfinding(String memail){
		logger.info("비밀번호 찾기 쿼리 DAO 쪽 >>> ");
		return sqlSession.selectOne("pwfinding", memail);
	}
	
	@Override
	public int pwupdate(Member member) {
		logger.info("비밀번호 변경 완료 쿼리쮹 >>> :" );
		return sqlSession.update("pwupdate", member);
	}

}
