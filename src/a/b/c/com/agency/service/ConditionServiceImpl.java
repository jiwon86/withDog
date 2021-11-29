package a.b.c.com.agency.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.agency.dao.ConditionDAO;
import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.pet.vo.PetVO;

@Service
@Transactional
public class ConditionServiceImpl implements ConditionService {

	private Logger logger = Logger.getLogger(ConditionServiceImpl.class);
	
	private ConditionDAO conditionDAO;
	
	@Autowired(required = false)
	public ConditionServiceImpl(ConditionDAO conditionDAO) {
		this.conditionDAO = conditionDAO;
	}
	
	@Override
	public List<ConditionVO> conditionSelectAll(ConditionVO conditionVO) {
		logger.info("ConditionServiceImpl.conditionSelectAll() 함수 진입");
		
		return conditionDAO.conditionSelectAll(conditionVO);
	}

	@Override
	public List<ConditionVO> conditionSelect(ConditionVO conditionVO) {
		logger.info("ConditionServiceImpl.conditionSelect() 함수 진입");
		
		return conditionDAO.conditionSelect(conditionVO);
	}

	@Override
	public List<ConditionVO> myConditionSelectAll(ConditionVO conditionVO) {
		logger.info("ConditionServiceImpl.myConditionSelectAll() 함수 진입");
		
		return conditionDAO.myConditionSelectAll(conditionVO);
	}

	@Override
	public List<ConditionVO> myConditionSelect(ConditionVO conditionVO) {
		logger.info("ConditionServiceImpl.myConditionSelect() 함수 진입");
		
		return conditionDAO.myConditionSelect(conditionVO);
	}

	@Override
	public List<OfferVO> offerSelectAjax(OfferVO offerVO) {
		logger.info("ConditionServiceImpl.offerSelectAjax() 함수 진입");
		
		return conditionDAO.offerSelectAjax(offerVO);
	}

	@Override
	public List<PetVO> petSelect(Map<String, Object> offerMap) {
		logger.info("ConditionServiceImpl.petSelect() 함수 진입");
		
		return conditionDAO.petSelect(offerMap);
	}



}
