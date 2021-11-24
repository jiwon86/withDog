package a.b.c.com.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.qna.vo.RqnaVO;

@Repository
public class RqnaDAOImpl implements RqnaDAO {
	Logger logger = Logger.getLogger(RqnaDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RqnaVO> rqnaSelect(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		logger.info("RqnaDAOImpl rqnaSelect 함수 진입 >>> : ");
		return sqlSession.selectList("rqnaSelect", rqvo);
	}

	@Override
	public List<RqnaVO> rqnaSelectAll(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		logger.info("RqnaDAOImpl rqnaSelectAll 함수 진입 >>> : ");
		return sqlSession.selectList("rqnaSelectAll", rqvo);
	}

	@Override
	public int rqnaInsert(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		logger.info("RqnaDAOImpl rqnaInsert 함수 진입 >>> : ");
		return (Integer)sqlSession.insert("rqnaInsert", rqvo);
	}

	@Override
	public int rqnaUpdaet(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		logger.info("RqnaDAOImpl rqnaUpdaet 함수 진입 >>> : ");
		return (Integer)sqlSession.update("rqnaUpdaet", rqvo);
	}

	@Override
	public int rqnaDelete(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		logger.info("RqnaDAOImpl rqnaDelete 함수 진입 >>> : ");
		return (Integer)sqlSession.update("rqnaDelete", rqvo);
	}

}
