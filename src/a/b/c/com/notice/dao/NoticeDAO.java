package a.b.c.com.notice.dao;

import java.util.List;

import a.b.c.com.notice.vo.NoticeVO;

public interface NoticeDAO {
	
	public List<NoticeVO> noticeSelect(NoticeVO nvo);
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo);
	public int noticeInsert(NoticeVO nvo);
	public int noticeUpdate(NoticeVO nvo);
	public int noticeDelete(NoticeVO nvo);
	
	// 페이징
	public List<NoticeVO> noticeSelectPaging(NoticeVO nvo);
}
