package a.b.c.com.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeVO> noticeSelect(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeSelect", nvo);
	}

	@Override
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeSelectAll", nvo);
	}

	@Override
	public int noticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("noticeInsert", nvo);
	}

	@Override
	public int noticeUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("noticeUpdate", nvo);
	}

	@Override
	public int noticeDelete(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("noticeDelete", nvo);
	}

	@Override
	public List<NoticeVO> noticeSelectPaging(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeSelectPaging", nvo);
	}

}
