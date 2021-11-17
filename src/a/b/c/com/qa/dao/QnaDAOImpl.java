package a.b.c.com.qa.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.qa.vo.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {
	Logger logger = Logger.getLogger(QnaVO.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnaVO> qnaselect(QnaVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaSelect", qvo);
	}

	@Override
	public List<QnaVO> qnaselectAll(QnaVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaSelectAll", qvo);
	}

	@Override
	public int qnaInsert(QnaVO qvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("qnaInsert", qvo);
	}

	@Override
	public int qnaUpdate(QnaVO qvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("qnaUpdate", qvo);
	}

	@Override
	public int qnaDelete(QnaVO qvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("qnaDelete", qvo);
	}

	//페이징
}
