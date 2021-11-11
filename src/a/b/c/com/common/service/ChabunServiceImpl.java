package a.b.c.com.common.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {

	private Logger logger = Logger.getLogger(ChabunServiceImpl.class);
	
	/*
	private ChabunDAO chabunDAO;
	
	@Autowired(required=false)
	public ChabunServiceImpl(ChabunDAO chabunDAO) {
		this.chabunDAO = chabunDAO;
	}
	
	@Override
	public SpringBoardVO getBoardChabun() {
		logger.info("ChabunServiceImpl.getBoardChabun() 함수 진입");
		
		return chabunDAO.getBoardChabun();
	}

	@Override
	public SpringRboardVO getRboardChabun() {
		logger.info("ChabunServiceImpl.getRboardChabun() 함수 진입");
		
		return chabunDAO.getRboardChabun();
	}

	@Override
	public SpringMemberVO getMemChabun() {
		logger.info("ChabunServiceImpl.getMemChabun() 함수 진입");
		return chabunDAO.getMemChabun();
	}
	*/

}
