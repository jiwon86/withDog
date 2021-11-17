package a.b.c.com.qa.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.qa.dao.QnaDAO;
import a.b.c.com.qa.vo.QnaVO;

@Service
@Transactional
public class QnaServiceImpl implements QnaService {
	Logger logger = Logger.getLogger(QnaVO.class);
	
	private QnaDAO qnaDAO;
	
	@Autowired(required=false)
	public QnaServiceImpl(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}

	@Override
	public List<QnaVO> qnaselect(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.qnaselect(qvo);
	}

	@Override
	public List<QnaVO> qnaselectAll(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.qnaselectAll(qvo);
	}

	@Override
	public int qnaInsert(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.qnaInsert(qvo);
	}

	@Override
	public int qnaUpdate(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.qnaUpdate(qvo);
	}

	@Override
	public int qnaDelete(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.qnaDelete(qvo);
	}

}
