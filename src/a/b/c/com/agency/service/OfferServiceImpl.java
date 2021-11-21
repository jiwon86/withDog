package a.b.c.com.agency.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.agency.dao.OfferDAO;
import a.b.c.com.agency.vo.OfferVO;
import a.b.c.com.pet.vo.PetVO;

@Service
@Transactional
public class OfferServiceImpl implements OfferService {

	private Logger logger = Logger.getLogger(OfferServiceImpl.class);
	
	private OfferDAO offerDAO;
	
	@Autowired(required = false)
	public OfferServiceImpl(OfferDAO offerDAO) {
		this.offerDAO = offerDAO;
	}
	
	@Override
	public List<OfferVO> offerSelectAll(String mno) {
		logger.info("OfferServiceImpl.offerSelectAll() 함수 진입");
		
		return offerDAO.offerSelectAll(mno);
	}

	@Override
	public List<OfferVO> offerSelect(OfferVO ovo) {
		logger.info("OfferServiceImpl.offerSelect() 함수 진입");
		
		return offerDAO.offerSelect(ovo);
	}

	@Override
	public List<PetVO> petSelectAll(Map<String, Object> offerMap) {
		logger.info("OfferServiceImpl.petSelectAll() 함수 진입");
		
		return offerDAO.petSelectAll(offerMap);
	}

}
