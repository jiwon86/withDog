package a.b.c.com.adminmember.vo;

public class AdminPetVO {

	private String mno;
	private String pno;
	private String pname;
	private String ptype;
	private String pgender;
	private String pneutral;
	
	
	public AdminPetVO() {
		
	}
	
	public AdminPetVO(String mno, String pno, String pname, String ptype, String pgender, String pneutral) {
		super();
		this.mno = mno;
		this.pno = pno;
		this.pname = pname;
		this.ptype = ptype;
		this.pgender = pgender;
		this.pneutral = pneutral;
	}


	@Override
	public String toString() {
		return "AdminPetVO [mno=" + mno + ", pno=" + pno + ", pname=" + pname + ", ptype=" + ptype + ", pgender="
				+ pgender + ", pneutral=" + pneutral + "]";
	}


	public String getMno() {
		return mno;
	}


	public void setMno(String mno) {
		this.mno = mno;
	}


	public String getPno() {
		return pno;
	}


	public void setPno(String pno) {
		this.pno = pno;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getPtype() {
		return ptype;
	}


	public void setPtype(String ptype) {
		this.ptype = ptype;
	}


	public String getPgender() {
		return pgender;
	}


	public void setPgender(String pgender) {
		this.pgender = pgender;
	}


	public String getPneutral() {
		return pneutral;
	}


	public void setPneutral(String pneutral) {
		this.pneutral = pneutral;
	}

	
}
