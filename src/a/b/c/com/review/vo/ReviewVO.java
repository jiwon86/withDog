package a.b.c.com.review.vo;

public class ReviewVO {

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
		
		System.out.print("rvo.getCrnum() >>> : " + rvo.getCrnum());
		System.out.print("rvo.getCnum() >>> : " + rvo.getCnum());
		System.out.print("rvo.getNnum() >>> : " + rvo.getNnum());
		System.out.print("rvo.getCrscore() >>> : " + rvo.getCrscore());
		System.out.print("rvo.getCrmemo() >>> : " + rvo.getCrmemo());
		System.out.print("rvo.getCphoto() >>> : " + rvo.getCphoto());
		System.out.print("rvo.getCrreport() >>> : " + rvo.getCrreport());
		System.out.print("rvo.getInsertdate() >>> : " + rvo.getInsertdate());
		System.out.print("rvo.getUpdatedate() >>> : " + rvo.getUpdatedate());
		System.out.print("rvo.getDelyn() >>> : " + rvo.getDelyn());
		
	}
}
