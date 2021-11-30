package a.b.c.com.park.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.park.dao.ParkDAO;
import a.b.c.com.park.vo.ParkVO;

@Service
@Transactional
public class ParkServiceImpl implements ParkService {
	Logger logger = Logger.getLogger(ParkServiceImpl.class);

	@Autowired(required = false)
	//@Qualifier("ParkDAOImpl")
	private ParkDAO parkDAO;
	

	@Autowired(required=false)
	public ParkServiceImpl(ParkDAO parkDAO) {
		this.parkDAO = parkDAO;
	}

	@Override
	public List<ParkVO> parkSelectAll() {
		// TODO Auto-generated method stub
		logger.info("ParkServiceImpl parkSelectAll() >>> : ");
		return parkDAO.parkSelectAll();
	}

	@Override
	public int parkInsert(ParkVO svo) {
		// TODO Auto-generated method stub
		logger.info("ParkServiceImpl parkInsert() >>> : " + parkDAO);
		return parkDAO.parkInsert(svo);
	}

	@Override
	public int parkUpdate(ParkVO svo) {
		// TODO Auto-generated method stub
		logger.info("ParkServiceImpl parkUpdate() >>> : ");
		return parkDAO.parkUpdate(svo);
	}

	@Override
	public int parkDelete(ParkVO svo) {
		// TODO Auto-generated method stub
		logger.info("ParkServiceImpl parkDelete() >>> : ");
		return parkDAO.parkDelete(svo);
	}

	@Override
	public List<ParkVO> parkSelect(ParkVO svo) {
		// TODO Auto-generated method stub
		logger.info("ParkServiceImpl parkSelect() >>> : ");
		return parkDAO.parkSelect(svo);
	}

}
