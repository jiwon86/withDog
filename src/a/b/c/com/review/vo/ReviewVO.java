package a.b.c.com.review.vo;

import org.apache.log4j.Logger;

import a.b.c.com.member.controller.MemberController;

public class ReviewVO {

	private static Logger logger = Logger.getLogger(ReviewVO.class);
	
	private String crnum;
	private String cnum;
	private String nnum;
	private String crscore;
	private String crmemo;
	private String cphoto;
	private String crreport;
	
	private String insertdate;
	private String updatedate;
	private String delyn;
	
	public ReviewVO() {
		
	}

	public ReviewVO(String crnum, String cnum, String nnum, String crscore, String crmemo, String cphoto,
			String crreport, String insertdate, String updatedate, String delyn) {
		
		this.crnum = crnum;
		this.cnum = cnum;
		this.nnum = nnum;
		this.crscore = crscore;
		this.crmemo = crmemo;
		this.cphoto = cphoto;
		this.crreport = crreport;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.delyn = delyn;
	}

	public String getCrnum() {
		return crnum;
	}

	public void setCrnum(String crnum) {
		this.crnum = crnum;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String getNnum() {
		return nnum;
	}

	public void setNnum(String nnum) {
		this.nnum = nnum;
	}

	public String getCrscore() {
		return crscore;
	}

	public void setCrscore(String crscore) {
		this.crscore = crscore;
	}

	public String getCrmemo() {
		return crmemo;
	}

	public void setCrmemo(String crmemo) {
		this.crmemo = crmemo;
	}

	public String getCphoto() {
		return cphoto;
	}

	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}

	public String getCrreport() {
		return crreport;
	}

	public void setCrreport(String crreport) {
		this.crreport = crreport;
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

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	
	// 프린트 printReviewVO 함수
	public static void printReviewVO(ReviewVO rvo) {
		
		logger.info("rvo.getCrnum() >>> : " + rvo.getCrnum());
		logger.info("rvo.getCnum() >>> : " + rvo.getCnum());
		logger.info("rvo.getNnum() >>> : " + rvo.getNnum());
		logger.info("rvo.getCrscore() >>> : " + rvo.getCrscore());
		logger.info("rvo.getCrmemo() >>> : " + rvo.getCrmemo());
		logger.info("rvo.getCphoto() >>> : " + rvo.getCphoto());
		logger.info("rvo.getCrreport() >>> : " + rvo.getCrreport());
		logger.info("rvo.getInsertdate() >>> : " + rvo.getInsertdate());
		logger.info("rvo.getUpdatedate() >>> : " + rvo.getUpdatedate());
		logger.info("rvo.getDelyn() >>> : " + rvo.getDelyn());
		
	}
}
