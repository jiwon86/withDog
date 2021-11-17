package a.b.c.com.notice.vo;

public class NoticeVO {
	
	private String nnum;
	private String nsubject;
	private String nwriter;
	private String ncontents;
	private String ndeleteyn;
	private String ninsertdate;
	private String nupdatedate;

	
	public NoticeVO() {
				
	}


	public NoticeVO(String nnum, String nsubject, String nwriter, String ncontents, String ndeleteyn,
			String ninsertdate, String nupdatedate) {
		
		this.nnum = nnum;
		this.nsubject = nsubject;
		this.nwriter = nwriter;
		this.ncontents = ncontents;
		this.ndeleteyn = ndeleteyn;
		this.ninsertdate = ninsertdate;
		this.nupdatedate = nupdatedate;
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


	public String getNdeleteyn() {
		return ndeleteyn;
	}


	public void setNdeleteyn(String ndeleteyn) {
		this.ndeleteyn = ndeleteyn;
	}


	public String getNinsertdate() {
		return ninsertdate;
	}


	public void setNinsertdate(String ninsertdate) {
		this.ninsertdate = ninsertdate;
	}


	public String getNupdatedate() {
		return nupdatedate;
	}


	public void setNupdatedate(String nupdatedate) {
		this.nupdatedate = nupdatedate;
	}
}
