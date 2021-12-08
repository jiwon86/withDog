package a.b.c.com.pwfind.vo;

public class PwFindVO {
	
	private String mname;
	private String memail;
	
	@Override
	public String toString() {
		return "PwFIndVO [mname=" + mname + ", memail=" + memail + "]";
	}

	public PwFindVO(String mname, String memail) {
		this.mname = mname;
		this.memail = memail;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}
	
	
	
	

}
