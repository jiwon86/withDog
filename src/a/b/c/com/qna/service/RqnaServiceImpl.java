package a.b.c.com.qna.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.qna.dao.RqnaDAO;
import a.b.c.com.qna.vo.RqnaVO;

@Service
@Transactional
public class RqnaServiceImpl implements RqnaService {
	Logger logger = Logger.getLogger(RqnaServiceImpl.class);
	
	@Autowired(required=false)
	private RqnaDAO rqnaDAO;
	
	public RqnaServiceImpl(RqnaDAO rqnaDAO) {
		this.rqnaDAO = rqnaDAO;
	}

	@Override
	public List<RqnaVO> rqnaSelect(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		return rqnaDAO.rqnaSelect(rqvo);
	}

	@Override
	public List<RqnaVO> rqnaSelectAll(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		return rqnaDAO.rqnaSelectAll(rqvo);
	}

	@Override
	public int rqnaInsert(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		return rqnaDAO.rqnaInsert(rqvo);
	}

	@Override
	public int rqnaUpdaet(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		return rqnaDAO.rqnaUpdaet(rqvo);
	}

	@Override
	public int rqnaDelete(RqnaVO rqvo) {
		// TODO Auto-generated method stub
		return rqnaDAO.rqnaDelete(rqvo);
	}

}
