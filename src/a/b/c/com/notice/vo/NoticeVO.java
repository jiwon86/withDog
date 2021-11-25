package a.b.c.com.notice.vo;

import org.apache.log4j.Logger;

public class NoticeVO {
	private static Logger logger = Logger.getLogger(NoticeVO.class);
	
	private String nnum;
	private String nsubject;
	private String nwriter;
	private String ncontents;
	private String nfile;
	private String ndeleteyn;
	private String insertdate;
	private String updatedate;
	
	// 검색 구분자 및 검색어
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;
		
	// 페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	public NoticeVO() {
				
	}

		
	public NoticeVO(String nnum, String nsubject, String nwriter, String ncontents, String nfile, String ndeleteyn,
			String insertdate, String updatedate) {
		
		this.nnum = nnum;
		this.nsubject = nsubject;
		this.nwriter = nwriter;
		this.ncontents = ncontents;
		this.nfile = nfile;
		this.ndeleteyn = ndeleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}
	
	public NoticeVO(String nnum, String nsubject, String nwriter, String ncontents, String nfile, String ndeleteyn,
			String insertdate, String updatedate, String keyfilter, String keyword, String startdate, String enddate) {
		super();
		this.nnum = nnum;
		this.nsubject = nsubject;
		this.nwriter = nwriter;
		this.ncontents = ncontents;
		this.nfile = nfile;
		this.ndeleteyn = ndeleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.keyfilter = keyfilter;
		this.keyword = keyword;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	
	public NoticeVO(String nnum, String nsubject, String nwriter, String ncontents, String nfile, String ndeleteyn,
			String insertdate, String updatedate, String keyfilter, String keyword, String startdate, String enddate,
			String pageSize, String groupSize, String curPage, String totalCount) {
		
		this.nnum = nnum;
		this.nsubject = nsubject;
		this.nwriter = nwriter;
		this.ncontents = ncontents;
		this.nfile = nfile;
		this.ndeleteyn = ndeleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.keyfilter = keyfilter;
		this.keyword = keyword;
		this.startdate = startdate;
		this.enddate = enddate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}

	public static Logger getLogger() {
		return logger;
	}


	public static void setLogger(Logger logger) {
		NoticeVO.logger = logger;
	}


	public String getNnum() {
		return nnum;
	}


	public void setNnum(String nnum) {
		this.nnum = nnum;
	}


	public String getNsubject() {
		return nsubject;
	}


	public void setNsubject(String nsubject) {
		this.nsubject = nsubject;
	}


	public String getNwriter() {
		return nwriter;
	}


	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}


	public String getNcontents() {
		return ncontents;
	}


	public void setNcontents(String ncontents) {
		this.ncontents = ncontents;
	}


	public String getNfile() {
		return nfile;
	}


	public void setNfile(String nfile) {
		this.nfile = nfile;
	}


	public String getNdeleteyn() {
		return ndeleteyn;
	}


	public void setNdeleteyn(String ndeleteyn) {
		this.ndeleteyn = ndeleteyn;
	}


	public String getInsertdate() {
		return insertdate;
	}


	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}


	public String getUpdatedate() {
		return updatedate;
	}


	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}


	public String getKeyfilter() {
		return keyfilter;
	}


	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getStartdate() {
		return startdate;
	}


	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}


	public String getEnddate() {
		return enddate;
	}


	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}


	public String getPageSize() {
		return pageSize;
	}


	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}


	public String getGroupSize() {
		return groupSize;
	}


	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}


	public String getCurPage() {
		return curPage;
	}


	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}


	public String getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	// 매개변수 확인
	public static void printVO(NoticeVO nvo) {
		logger.info("SpringBoardVO 데이터 확인 시작  >>> : ");
		
		logger.info("공지사항 번호 >>> : " + nvo.getNnum());
		logger.info("공지사항 제목>>> : " + nvo.getNsubject());
		logger.info("작성자 >>> : " + nvo.getNwriter());
		logger.info("공지사항 내용 >>> : " + nvo.getNcontents());
		logger.info("파일 >>> : " + nvo.getNfile());
		logger.info("삭제여부 >>> : " + nvo.getNdeleteyn());
		logger.info("입력일>>> : " + nvo.getInsertdate());
		logger.info("수정일 >>> : " + nvo.getUpdatedate());
		logger.info("페이징 데이터 확인 >>> ===================================================");
		logger.info("페이지 >>> : " + nvo.getPageSize());
		logger.info("그룹사이즈 >>> : " + nvo.getGroupSize());
		logger.info("현재페이지 >>> : " + nvo.getCurPage());
		logger.info("전체건수 >>> : " + nvo.getTotalCount());
		logger.info("조건검색 데이터 확인 >>> ===================================================");
		logger.info("검색필터 >>> : " + nvo.getKeyfilter());
		logger.info("검색키워드 >>> : " + nvo.getKeyword());
		logger.info("검색 시작일 >>> : " + nvo.getStartdate());
		logger.info("검색 종료일 >>> : " + nvo.getEnddate());
		
		logger.info("NoticeVO 데이터 확인 끝 >>> : ");
		
	}
	
}

	