package a.b.c.com.qna.vo;

import org.apache.log4j.Logger;

public class QnaVO {
	private static Logger logger = Logger.getLogger(QnaVO.class);
	
	//기본 필드
	private String qnanum;
	private String qnatitle;
	private String qnacon;
	private String qnawriter;
	private String qnapw;
	private String qnaanswer;
	private String qnafile;
	private String qnainsertdate;
	private String qnaupdatedate;
	private String delyn;
	
	//검색 구분자 및 검색어 
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;
	
	//페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	public QnaVO() {
		
	}

	public QnaVO(String qnanum, String qnatitle, String qnacon, 
				 String qnawriter, String qnapw, String qnaanswer,
				 String qnafile, String qnainsertdate, String qnaupdatedate, 
				 String delyn) {
		
		this.qnanum = qnanum;
		this.qnatitle = qnatitle;
		this.qnacon = qnacon;
		this.qnawriter = qnawriter;
		this.qnapw = qnapw;
		this.qnaanswer = qnaanswer;
		this.qnafile = qnafile;
		this.qnainsertdate = qnainsertdate;
		this.qnaupdatedate = qnaupdatedate;
		this.delyn = delyn;
	}
	
	

	public QnaVO(String qnanum, String qnatitle, String qnacon, 
				String qnawriter, String qnapw, String qnaanswer,
				String qnafile, String qnainsertdate, String qnaupdatedate, 
				String delyn, String keyfilter, String keyword,
				String startdate, String enddate, String pageSize, 
				String groupSize, String curPage, String totalCount) {
		
		this.qnanum = qnanum;
		this.qnatitle = qnatitle;
		this.qnacon = qnacon;
		this.qnawriter = qnawriter;
		this.qnapw = qnapw;
		this.qnaanswer = qnaanswer;
		this.qnafile = qnafile;
		this.qnainsertdate = qnainsertdate;
		this.qnaupdatedate = qnaupdatedate;
		this.delyn = delyn;
		this.keyfilter = keyfilter;
		this.keyword = keyword;
		this.startdate = startdate;
		this.enddate = enddate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}

	public String getQnanum() {
		return qnanum;
	}

	public String getQnatitle() {
		return qnatitle;
	}

	public String getQnacon() {
		return qnacon;
	}

	public String getQnawriter() {
		return qnawriter;
	}

	public String getQnapw() {
		return qnapw;
	}

	public String getQnaanswer() {
		return qnaanswer;
	}

	public String getQnafile() {
		return qnafile;
	}

	public String getQnainsertdate() {
		return qnainsertdate;
	}

	public String getQnaupdatedate() {
		return qnaupdatedate;
	}

	public String getDelyn() {
		return delyn;
	}


	public void setQnanum(String qnanum) {
		this.qnanum = qnanum;
	}

	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}

	public void setQnacon(String qnacon) {
		this.qnacon = qnacon;
	}

	public void setQnawriter(String qnawriter) {
		this.qnawriter = qnawriter;
	}

	public void setQnapw(String qnapw) {
		this.qnapw = qnapw;
	}

	public void setQnaanswer(String qnaanswer) {
		this.qnaanswer = qnaanswer;
	}

	public void setQnafile(String qnafile) {
		this.qnafile = qnafile;
	}

	public void setQnainsertdate(String qnainsertdate) {
		this.qnainsertdate = qnainsertdate;
	}

	public void setQnaupdatedate(String qnaupdatedate) {
		this.qnaupdatedate = qnaupdatedate;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	
	// 검색 구분자 및 검색어 
	public String getKeyfilter() {
		return keyfilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getStartdate() {
		return startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	
	
	
	// 페이징 이동 필드
	
	public String getPageSize() {
		return pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}
	
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	
	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}


	//매개변수 확인
	public static void printVO(QnaVO qvo) {
		logger.info("QnaVO 데이터 확인 시작 >>> : ");
		
		logger.info("QnA 번호 >>> : " + qvo.getQnanum());
		logger.info("QnA 제목 >>> : " + qvo.getQnatitle());
		logger.info("QnA 내용 >>> : " + qvo.getQnacon());
		logger.info("QnA 작성자 >>> : " + qvo.getQnawriter());
		logger.info("QnA 비밀번호 >>> : " + qvo.getQnapw());
		logger.info("QnA 답변유무 >>> : " + qvo.getQnaanswer());
		logger.info("QnA 파일 >>> : " + qvo.getQnafile());
		logger.info("QnA 입력일 >>> : " + qvo.getQnainsertdate());
		logger.info("QnA 수정일 >>> : " + qvo.getQnaupdatedate());
		logger.info("QnA 삭제여부 >>> : " + qvo.getDelyn());
		
		
	}
}
