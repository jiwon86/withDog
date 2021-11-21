package a.b.c.com.agency.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.pet.vo.PetVO;

@Repository
public class OfferDAOImpl implements OfferDAO {

	private Logger logger = Logger.getLogger(OfferDAOImpl.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<OfferVO> offerSelectAll(String mno) {
		logger.info("OfferDAOImpl.offerSelectAll() 함수 진입");
		
		return sqlSession.selectList("offerSelectAll", mno);
	}

	@Override
	public List<OfferVO> offerSelect(OfferVO ovo) {
		logger.info("OfferDAOImpl.offerSelect() 함수 진입");
		
		return sqlSession.selectOne("offerSelect", ovo);
	}

	@Override
	public List<PetVO> petSelectAll(Map<String, Object> offerMap) {
		logger.info("OfferDAOImpl.petSelectAll() 함수 진입");
		
		return sqlSession.selectList("petSelectAll", offerMap);
	}

}
