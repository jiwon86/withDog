package a.b.c.com.common.service;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import a.b.c.com.common.dao.ChabunDAO;
import a.b.c.com.pet.vo.PetVO;



import a.b.c.com.qna.vo.QnaVO;
import a.b.c.com.qna.vo.RqnaVO;
import a.b.c.com.map.vo.MapTradeVO;
import a.b.c.com.member.vo.Member;
import a.b.c.com.park.vo.ParkVO;
import a.b.c.com.notice.vo.NoticeVO;



@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {
 
	private Logger logger = Logger.getLogger(ChabunServiceImpl.class);


	private ChabunDAO chabunDAO;
	
	@Autowired(required=false)
	public ChabunServiceImpl(ChabunDAO chabunDAO) {
		this.chabunDAO = chabunDAO;
	}

	@Override
	public PetVO getPetChabun() {
		// TODO Auto-generated method stub
		return chabunDAO.getPetChabun();
	}
	
	/*
=======
>>>>>>> branch 'master' of https://github.com/jiwon86/withDog.git
	private ChabunDAO chabunDAO;
	
	@Autowired(required=false)
	public ChabunServiceImpl(ChabunDAO chabunDAO) {
		this.chabunDAO = chabunDAO;
	}
	
	@Override
	public MapTradeVO getMapChabun() {
		// TODO Auto-generated method stub
		logger.info("ChabunServiceImpl.getMapChabun() 함수 진입");
		
		return chabunDAO.getMapChabun();
	}
	
	/*
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
	*/

	@Override
	public Member getMemChabun() {
		logger.info("ChabunServiceImpl.getMemChabun() 함수 진입");
		return chabunDAO.getMemChabun();
	}


	@Override
	public MapTradeVO getMapChabun() {
		// TODO Auto-generated method stub
		return null;
	}
	

	@Override
	public ParkVO getParkChabun() {
		// TODO Auto-generated method stub
		logger.info("ChabunServiceImpl.getParkChabun() 함수 진입");
		return chabunDAO.getParkChabun();
	}
	

	@Override
	public NoticeVO getNoticeChabun() {
		// TODO Auto-generated method stub
		logger.info("ChabunServiceImpl.getNoticeChabun() 함수 진입 : ");
		return chabunDAO.getNoticeChabun();
	}


	
	
	@Override
	public QnaVO getQnaChabun() {
		logger.info("ChabunServiceImpl.getQnaChabun() 함수 진입");
		return chabunDAO.getQnaChabun();
	}
	
	@Override
	public RqnaVO getRqnaChabun() {
		logger.info("ChabunServiceImpl.getRqnaChabun() 함수 진입");
		return chabunDAO.getRqnaChabun();
	}
}
