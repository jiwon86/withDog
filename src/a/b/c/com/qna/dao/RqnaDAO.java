package a.b.c.com.qna.dao;

import java.util.List;

import a.b.c.com.qna.vo.RqnaVO;

public interface RqnaDAO {

	public List<RqnaVO> rqnaSelect(RqnaVO rqvo);
	public List<RqnaVO> rqnaSelectAll(RqnaVO rqvo);
	public int rqnaInsert(RqnaVO rqvo);
	public int rqnaUpdaet(RqnaVO rqvo);
	public int rqnaDelete(RqnaVO rqvo);
}
