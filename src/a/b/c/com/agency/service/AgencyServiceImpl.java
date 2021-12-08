package a.b.c.com.agency.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.agency.dao.AgencyDAO;
import a.b.c.com.agency.vo.AgencyVO;
import a.b.c.com.agency.vo.ConditionVO;
import a.b.c.com.agency.vo.PayVO;

@Service
@Transactional
public class AgencyServiceImpl implements AgencyService {
	private Logger logger = Logger.getLogger(AgencyServiceImpl.class);
	
	private AgencyDAO agencyDAO;
	
	@Autowired(required = false)
	public AgencyServiceImpl(AgencyDAO agencyDAO) {
		this.agencyDAO = agencyDAO;
	}

	@Override
	public int agencySelectCount(AgencyVO avo) {
		logger.info("AgencyServiceImpl.agencySelectCount() 함수 진입");
		
		return agencyDAO.agencySelectCount(avo);
	}

	@Override
	public int agencyInsert(AgencyVO avo) {
		logger.info("AgencyServiceImpl.agencyInsert() 함수 진입");
		
		return agencyDAO.agencyInsert(avo);
	}

	@Override
	public List<AgencyVO> agencyMatchyn(AgencyVO avo) {
		logger.info("AgencyServiceImpl.agencyMatchyn() 함수 진입");
		
		return agencyDAO.agencyMatchyn(avo);
	}

	@Override
	public int agencyUpdateN(AgencyVO avo) {
		logger.info("AgencyServiceImpl.agencyUpdateN() 함수 진입");
		
		return agencyDAO.agencyUpdateN(avo);
	}

	@Override
	public int agencyUpdateY(AgencyVO avo) {
		logger.info("AgencyServiceImpl.agencyUpdateY() 함수 진입");
		
		return agencyDAO.agencyUpdateY(avo);
	}

	@Override
	public int payAjax(PayVO pvo) {
		logger.info("AgencyServiceImpl.payAjax() 함수 진입");
		
		return agencyDAO.payAjax(pvo);
	}

	@Override
	public List<PayVO> paySelect(PayVO pvo) {
		logger.info("AgencyServiceImpl.paySelect() 함수 진입");
		
		return agencyDAO.paySelect(pvo);
	}

	@Override
	public int payCount(PayVO pvo) {
		logger.info("AgencyServiceImpl.payCount() 함수 진입");
		
		return agencyDAO.payCount(pvo);
	}

	@Override
	public List<PayVO> paySelectPayno(PayVO pvo) {
		logger.info("AgencyServiceImpl.paySelectPayno() 함수 진입");
		
		return agencyDAO.paySelectPayno(pvo);
	}

	@Override
	public List<PayVO> paySelectAll(PayVO pvo) {
		logger.info("AgencyServiceImpl.paySelectAll() 함수 진입");
		
		return agencyDAO.paySelectAll(pvo);
	}
	
}
