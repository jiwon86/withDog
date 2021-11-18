package a.b.c.com.qna.dao;

import java.util.List;

import a.b.c.com.qna.vo.QnaVO;

public interface QnaDAO {

	public List<QnaVO> qnaselect(QnaVO qvo);
	public List<QnaVO> qnaselectAll(QnaVO qvo);
	public int qnaInsert(QnaVO qvo);
	public int qnaUpdate(QnaVO qvo);
	public int qnaDelete(QnaVO qvo);
	
	//페이징
}
