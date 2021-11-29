package a.b.c.com.agency.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.agency.vo.AgencyVO;

@Repository
public class AgencyDAOImpl implements AgencyDAO {
	private Logger logger = Logger.getLogger(AgencyDAOImpl.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int agencySelectCount(AgencyVO avo) {
		logger.info("AgencyDAOImpl.agencySelectCount() 함수진입");
		return (Integer)sqlSession.selectOne("agencySelectCount", avo);
	}

	@Override
	public int agencyInsert(AgencyVO avo) {
		logger.info("AgencyDAOImpl.agencyInsert() 함수진입");
		
		return (Integer)sqlSession.insert("agencyInsert", avo);
	}

	@Override
	public List<AgencyVO> agencyMatchyn(AgencyVO avo) {
		logger.info("AgencyDAOImpl.agencyMatchyn() 함수진입");
		
		return sqlSession.selectList("agencyMatchyn", avo);
	}

	@Override
	public int agencyUpdateN(AgencyVO avo) {
		logger.info("AgencyDAOImpl.agencyUpdateN() 함수진입");
		
		return sqlSession.update("agencyUpdateN", avo);
	}

	@Override
	public int agencyUpdateY(AgencyVO avo) {
		logger.info("AgencyDAOImpl.agencyUpdateY() 함수진입");
		
		return sqlSession.update("agencyUpdateY", avo);
	}
	
	
}
