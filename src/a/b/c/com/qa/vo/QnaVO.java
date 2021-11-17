package a.b.c.com.qa.vo;

import org.apache.log4j.Logger;

public class QnaVO {
	private static Logger logger = Logger.getLogger(QnaVO.class);
	
	//기본 필드
	private String qnanum;
	private String qnatitle;
	private String qnacon;
	private String qnawriter;
	private String qnapw;
	private String qnaemail;
	private String qnafile;
	private String qnainsertdate;
	private String qnaupdatedate;
	private String delyn;
	
	//검색 구분자 및 검색어
	
	//페이징 이동 필드
	
	public QnaVO() {
		
	}

	public QnaVO(String qnanum, String qnatitle, String qnacon, 
				 String qnawriter, String qnapw, String qnaemail,
				 String qnafile, String qnainsertdate, String qnaupdatedate, 
				 String delyn) {
		
		this.qnanum = qnanum;
		this.qnatitle = qnatitle;
		this.qnacon = qnacon;
		this.qnawriter = qnawriter;
		this.qnapw = qnapw;
		this.qnaemail = qnaemail;
		this.qnafile = qnafile;
		this.qnainsertdate = qnainsertdate;
		this.qnaupdatedate = qnaupdatedate;
		this.delyn = delyn;
	}

	public static Logger getLogger() {
		return logger;
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

	public String getQnaemail() {
		return qnaemail;
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

	public static void setLogger(Logger logger) {
		QnaVO.logger = logger;
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

	public void setQnaemail(String qnaemail) {
		this.qnaemail = qnaemail;
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
	
	
	
	//매개변수 확인
	public static void printVO(QnaVO qvo) {
		logger.info("QnaVO 데이터 확인 시작 >>> : ");
		
		logger.info("QnA 번호 >>> : " + qvo.getQnanum());
		logger.info("QnA 제목 >>> : " + qvo.getQnatitle());
		logger.info("QnA 내용 >>> : " + qvo.getQnacon());
		logger.info("QnA 작성자 >>> : " + qvo.getQnawriter());
		logger.info("QnA 비밀번호 >>> : " + qvo.getQnapw());
		logger.info("QnA 이메일 >>> : " + qvo.getQnaemail());
		logger.info("QnA 파일 >>> : " + qvo.getQnafile());
		logger.info("QnA 입력일 >>> : " + qvo.getQnainsertdate());
		logger.info("QnA 수정일 >>> : " + qvo.getQnaupdatedate());
		logger.info("QnA 삭제여부 >>> : " + qvo.getDelyn());
		
		
	}
}
