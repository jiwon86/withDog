package a.b.c.com.pet.vo;

import org.apache.log4j.Logger;

public class PetVO {

	//로그----------------------------------------
	Logger logger = Logger.getLogger(PetVO.class);
	
	//변수----------------------------------------
	private String pno;
	private String pname;
	private String ptype;
	private String pgender;
	private String pneutral;
	private String pphoto;
	private String pweight;
	private String phospital;
	private String pmemo;
	private String pages;
	private String mno;
	
	//생성자----------------------------------------
	public PetVO() {
		
	}
	
	public PetVO(String pno, String pname, 
				 String ptype, String pneutral, 
				 String pphoto, String pweight,
				 String phospital, String pmemo, 
				 String pages, String mno,
				 String pgender) {
		
		this.pno = pno;
		this.pname = pname;
		this.ptype = ptype;
		this.pneutral = pneutral;
		this.pphoto = pphoto;
		this.pweight = pweight;
		this.phospital = phospital;
		this.pmemo = pmemo;
		this.pages = pages;
		this.mno = mno;
		this.pgender = pgender;
	}
	//getter----------------------------------------
	public String getPno() {
		return pno;
	}
	public String getPname() {
		return pname;
	}
	public String getPtype() {
		return ptype;
	}
	public String getPneutral() {
		return pneutral;
	}
	public String getPphoto() {
		return pphoto;
	}
	public String getPweight() {
		return pweight;
	}
	public String getPhospital() {
		return phospital;
	}
	public String getPmemo() {
		return pmemo;
	}
	public String getPages() {
		return pages;
	}
	public String getMno() {
		return mno;
	}
	
	public String getPgender() {
		return pgender;
	}
	
	//setter----------------------------------------
	public void setPno(String pno) {
		this.pno = pno;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public void setPneutral(String pneutral) {
		this.pneutral = pneutral;
	}
	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
	}
	public void setPweight(String pweight) {
		this.pweight = pweight;
	}
	public void setPhospital(String phospital) {
		this.phospital = phospital;
	}
	public void setPmemo(String pmemo) {
		this.pmemo = pmemo;
	}
	public void setPages(String pages) {
		this.pages = pages;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public void setPgender(String pgender) {
		this.pgender = pgender;
	}
	
	public void petVOlog(PetVO pvo) {
		
		logger.info("getPno>>>>>"+getPno());
		logger.info("getPname>>>>>"+getPname());
		logger.info("getPtype>>>>"+getPtype());
		logger.info("getPtype>>>>>"+getPtype());
		logger.info("getPgender>>>>"+getPgender());
		logger.info("getPneutral>>>>>"+getPneutral());
		logger.info("getPphoto>>>>>>"+getPphoto());
		logger.info("getPweight>>>>>>"+getPweight());
		logger.info("getPhospital>>>>>"+getPhospital());
		logger.info("getPmemo>>>>>>"+getPmemo());
		logger.info("getPages>>>>>>"+getPages());
		logger.info("getMno>>>>>"+getMno());
		
	}
	
}
