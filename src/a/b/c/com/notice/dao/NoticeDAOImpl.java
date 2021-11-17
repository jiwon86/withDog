package a.b.c.com.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import a.b.c.com.notice.vo.NoticeVO;

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
		return null;
	}

	@Override
	public int noticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int noticeUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int noticeDelete(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
