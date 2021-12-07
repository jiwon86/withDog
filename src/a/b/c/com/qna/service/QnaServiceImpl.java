package a.b.c.com.qna.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.qna.dao.QnaDAO;
import a.b.c.com.qna.vo.QnaVO;

@Service
@Transactional
public class QnaServiceImpl implements QnaService {
	Logger logger = Logger.getLogger(QnaVO.class);
	
	private QnaDAO qnaDAO;
	
	@Autowired(required=false)
	public QnaServiceImpl(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}

//	@Override
//	public List<QnaVO> qnaSelect(QnaVO qvo) {
//		// TODO Auto-generated method stub
//		return qnaDAO.qnaSelect(qvo);
//	}
	
	@Override
	public List<QnaVO> qnaSelect(String qnanum) {
		return qnaDAO.qnaSelect(qnanum);
	}


	 @Override 
	 public List<QnaVO> qnaSelectAll(QnaVO qvo) { 
		 // TODO Auto-generated method stub 
		 return qnaDAO.qnaSelectAll(qvo); }

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
	
	//페이징
	@Override
	public List<QnaVO> qnaSelectAllPaging(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.qnaSelectAllPaging(qvo);
	}
	
	//selectAll에서 수정
	@Override
	public int qnaMyUpdate(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.qnaMyUpdate(qvo);
	}
	
	//selectAll에서 삭제
	@Override
	public int qnaMyDelete(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.qnaMyDelete(qvo);
	}
	
	@Override
	public List<QnaVO> qnaanswer(QnaVO qvo){
		return qnaDAO.qnaanswer(qvo);
	}
}
