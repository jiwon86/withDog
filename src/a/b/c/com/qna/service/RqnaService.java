package a.b.c.com.qna.service;

import java.util.List;

import a.b.c.com.qna.vo.RqnaVO;

public interface RqnaService {
	
	public List<RqnaVO> rqnaSelect(RqnaVO rqvo);
	public List<RqnaVO> rqnaSelectAll(RqnaVO rqvo);
	public int rqnaInsert(RqnaVO rqvo);
	public int rqnaUpdaet(RqnaVO rqvo);
	public int rqnaDelete(RqnaVO rqvo);

}
