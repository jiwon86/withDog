package a.b.c.com.qna.service;

import java.util.List;

import a.b.c.com.qna.vo.QnaVO;

public interface QnaService {

	public List<QnaVO> qnaSelect(String qnanum);
	public List<QnaVO> qnaSelectAll(QnaVO qvo); 
	public int qnaInsert(QnaVO qvo);
	public int qnaUpdate(QnaVO qvo);
	public int qnaDelete(QnaVO qvo);
	
	//페이징
	public List<QnaVO> qnaSelectAllPaging(QnaVO qvo);
	
	//selectAll에서 수정, 삭제
	public int qnaMyUpdate(QnaVO qvo);
	public int qnaMyDelete(QnaVO qvo);
	
	public List<QnaVO> qnaanswer(QnaVO qvo);
	
}
