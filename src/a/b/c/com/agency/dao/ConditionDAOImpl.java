package a.b.c.com.agency.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.pet.vo.PetVO;

public class ConditionDAOImpl implements ConditionDAO {

	private Logger logger = Logger.getLogger(ConditionDAOImpl.class);
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ConditionVO> conditionSelectAll(ConditionVO conditionVO) {
		logger.info("ConditionDAOImpl.conditionSelectAll() 함수 진입");
		
		return sqlSession.selectList("conditionSelectAll", conditionVO);
	}

	@Override
	public List<ConditionVO> conditionSelect(ConditionVO conditionVO) {
		logger.info("ConditionDAOImpl.conditionSelect() 함수 진입");
		
		return sqlSession.selectList("conditionSelect", conditionVO);
	}

	@Override
	public List<ConditionVO> myConditionSelectAll(ConditionVO conditionVO) {
		logger.info("ConditionDAOImpl.myConditionSelectAll() 함수 진입");
		
		return sqlSession.selectList("myConditionSelectAll", conditionVO);
	}

	@Override
	public List<ConditionVO> myConditionSelect(ConditionVO conditionVO) {
		logger.info("ConditionDAOImpl.myConditionSelect() 함수 진입");
		
		return sqlSession.selectList("myConditionSelect", conditionVO);
	}

	@Override
	public List<OfferVO> offerSelectAjax(OfferVO offerVO) {
		logger.info("ConditionDAOImpl.offerSelectAjax() 함수 진입");
		
		return sqlSession.selectList("offerSelectAjax", offerVO);
	}

	@Override
	public List<PetVO> petSelect(Map<String, Object> offerMap) {
		logger.info("ConditionDAOImpl.petSelectAll() 함수 진입");
		
		return sqlSession.selectList("petSelect", offerMap);
	}

}
