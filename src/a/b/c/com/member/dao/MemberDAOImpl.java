package a.b.c.com.member.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.member.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private Logger logger = Logger.getLogger(MemberDAOImpl.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;
	
	// 로그인 
	@Override
	public Member read(String userId) {
		
		logger.info("MemberDAOImpl.read() 함수 실행");
		
		return sqlSession.selectOne("read", userId);
	}

}
