package a.b.c.com.review.vo;

import org.apache.log4j.Logger;

import a.b.c.com.member.controller.MemberController;

public class ReviewVO {

	private static Logger logger = Logger.getLogger(ReviewVO.class);
	
	private String crnum;
	private String cnum;
	private String crsubject;
	private String crwriter;
	private String crscore;
	private String crmemo;
	private String crreport;
	
	private String insertdate;
	private String updatedate;
	private String delyn;
	
	public ReviewVO() {
		
	}

	public ReviewVO(String crnum, String cnum, String crsubject, String crwriter, String crscore, String crmemo,
			String crreport, String insertdate, String updatedate, String delyn) {
		
		this.crnum = crnum;
		this.cnum = cnum;
		this.crsubject = crsubject;
		this.crwriter = crwriter;
		this.crscore = crscore;
		this.crmemo = crmemo;
		this.crreport = crreport;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.delyn = delyn;
	}

	

	public static Logger getLogger() {
		return logger;
	}

	public String getCrnum() {
		return crnum;
	}

	public String getCnum() {
		return cnum;
	}

	public String getCrsubject() {
		return crsubject;
	}

	public String getCrwriter() {
		return crwriter;
	}

	public String getCrscore() {
		return crscore;
	}

	public String getCrmemo() {
		return crmemo;
	}

	public String getCrreport() {
		return crreport;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public String getDelyn() {
		return delyn;
	}

	public static void setLogger(Logger logger) {
		ReviewVO.logger = logger;
	}

	public void setCrnum(String crnum) {
		this.crnum = crnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public void setCrsubject(String crsubject) {
		this.crsubject = crsubject;
	}

	public void setCrwriter(String crwriter) {
		this.crwriter = crwriter;
	}

	public void setCrscore(String crscore) {
		this.crscore = crscore;
	}

	public void setCrmemo(String crmemo) {
		this.crmemo = crmemo;
	}

	public void setCrreport(String crreport) {
		this.crreport = crreport;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	// 프린트 printReviewVO 함수
	public static void printReviewVO(ReviewVO rvo) {
		
		logger.info("rvo.getCrnum() >>> : " + rvo.getCrnum());
		logger.info("rvo.getCnum() >>> : " + rvo.getCnum());
		logger.info("rvo.getCrsubject() >>> : " + rvo.getCrsubject());
		logger.info("rvo.getCrwriter() >>> : " + rvo.getCrwriter());
		logger.info("rvo.getCrscore() >>> : " + rvo.getCrscore());
		logger.info("rvo.getCrmemo() >>> : " + rvo.getCrmemo());
		logger.info("rvo.getCrreport() >>> : " + rvo.getCrreport());
		logger.info("rvo.getInsertdate() >>> : " + rvo.getInsertdate());
		logger.info("rvo.getUpdatedate() >>> : " + rvo.getUpdatedate());
		logger.info("rvo.getDelyn() >>> : " + rvo.getDelyn());
		
	}
}
