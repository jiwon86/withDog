package a.b.c.com.park.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.park.dao.RparkDAO;
import a.b.c.com.park.vo.RparkVO;

@Service
@Transactional
public class RparkServiceImpl implements RparkService {
	Logger logger = Logger.getLogger(RparkServiceImpl.class);
	
	@Autowired(required=false)
	private RparkDAO rparkDAO;
	
	public RparkServiceImpl(RparkDAO rparkDAO) {
		this.rparkDAO = rparkDAO;
	}
	
	@Override
	public List<RparkVO> rparkSelect(RparkVO rsvo) {
		// TODO Auto-generated method stub
		logger.info("SpringRboardServiceImpl rboardSelect >>> : ");
		return rparkDAO.rparkSelect(rsvo);
	}

	@Override
	public List<RparkVO> rparkSelectAll(RparkVO rsvo) {
		// TODO Auto-generated method stub
		logger.info("SpringRboardServiceImpl rboardSelect >>> : ");
		
		return rparkDAO.rparkSelectAll(rsvo);
	}

	@Override
	public int rparkInsert(RparkVO rsvo) {
		// TODO Auto-generated method stub
		logger.info("SpringRboardServiceImpl rboardInsert >>> : ");
		return rparkDAO.rparkInsert(rsvo);
	}

	@Override
	public int rparkDelete(RparkVO rsvo) {
		// TODO Auto-generated method stub
		logger.info("SpringRboardServiceImpl rboardInsert >>> : ");
		return rparkDAO.rparkDelete(rsvo);
	}

}
