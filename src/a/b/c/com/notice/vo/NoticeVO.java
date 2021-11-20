package a.b.c.com.notice.vo;

public class NoticeVO {
	
	private String nnum;
	private String nsubject;
	private String nwriter;
	private String ncontents;
	private String nfile;
	private String ndeleteyn;
	private String ninsertdate;
	private String nupdatedate;
	// 페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	public NoticeVO() {
				
	}

	public NoticeVO(String nnum, String nsubject, String nwriter, String ncontents, String nfile, String ndeleteyn,
			String ninsertdate, String nupdatedate) {
		
		this.nnum = nnum;
		this.nsubject = nsubject;
		this.nwriter = nwriter;
		this.ncontents = ncontents;
		this.nfile = nfile;
		this.ndeleteyn = ndeleteyn;
		this.ninsertdate = ninsertdate;
		this.nupdatedate = nupdatedate;
	}
	
	public NoticeVO(String nnum, String nsubject, String nwriter, String ncontents, String nfile, String ndeleteyn,
			String ninsertdate, String nupdatedate, String pageSize, String groupSize, String curPage,
			String totalCount) {
		super();
		this.nnum = nnum;
		this.nsubject = nsubject;
		this.nwriter = nwriter;
		this.ncontents = ncontents;
		this.nfile = nfile;
		this.ndeleteyn = ndeleteyn;
		this.ninsertdate = ninsertdate;
		this.nupdatedate = nupdatedate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
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

	// 페이징
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
	

	
	
}

	