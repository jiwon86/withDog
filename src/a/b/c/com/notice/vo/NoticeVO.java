package a.b.c.com.notice.vo;

public class NoticeVO {
	
	private String nnum;
	private String nsubject;
	private String nwriter;
	private String ncontents;
	private String nfile;
	private String ndeleteyn;
	private String insertdate;
	private String updatedate;
	// 페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	public NoticeVO() {
				
	}

	public NoticeVO(String nnum, String nsubject, String nwriter, String ncontents, String nfile, String ndeleteyn,
			String insertdate, String updatedate) {

		this.nnum = nnum;
		this.nsubject = nsubject;
		this.nwriter = nwriter;
		this.ncontents = ncontents;
		this.nfile = nfile;
		this.ndeleteyn = ndeleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	public NoticeVO(String nnum, String nsubject, String nwriter, String ncontents, String nfile, String ndeleteyn,
			String insertdate, String updatedate, String pageSize, String groupSize, String curPage,
			String totalCount) {

		this.nnum = nnum;
		this.nsubject = nsubject;
		this.nwriter = nwriter;
		this.ncontents = ncontents;
		this.nfile = nfile;
		this.ndeleteyn = ndeleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
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

	