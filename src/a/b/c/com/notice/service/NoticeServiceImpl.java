package a.b.c.com.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.notice.dao.NoticeDAO;
import a.b.c.com.notice.vo.NoticeVO;

@Transactional
@Service
public class NoticeServiceImpl implements NoticeService {
	
	private NoticeDAO noticeDAO;
	
	@Autowired(required=false)
	public NoticeServiceImpl(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public List<NoticeVO> noticeSelect(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeSelect(nvo);
	}

	@Override
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeSelectAll(nvo);
	}

	@Override
	public int noticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)noticeDAO.noticeInsert(nvo);
	}

	@Override
	public int noticeUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)noticeDAO.noticeUpdate(nvo);
	}

	@Override
	public int noticeDelete(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)noticeDAO.noticeDelete(nvo);
	}

	@Override
	public List<NoticeVO> noticeSelectPaging(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeSelectPaging(nvo);
	}

}
