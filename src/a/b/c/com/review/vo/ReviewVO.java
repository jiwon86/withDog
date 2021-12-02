package a.b.c.com.review.vo;

import org.apache.log4j.Logger;

import a.b.c.com.member.controller.MemberController;

public class ReviewVO {

	private static Logger logger = Logger.getLogger(ReviewVO.class);
	
	private String crnum;
	private String mid;
	private String rwriter;
	private String crsubject;
	private String crscore;
	private String crmemo;
	private String crreport;
	private String insertdate;
	private String updatedate;
	private String delyn;
	
	// 검색 구분자 및 검색어 
	private String keyfilter;
	private String keyword;
	
	// 페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	
	// toString 조회
	@Override
	public String toString() {
		return "ReviewVO [crnum=" + crnum + ", mid=" + mid + ", rwriter=" + rwriter + ", crsubject=" + crsubject
				+ ", crscore=" + crscore + ", crmemo=" + crmemo + ", crreport=" + crreport + ", insertdate="
				+ insertdate + ", updatedate=" + updatedate + ", delyn=" + delyn + ", keyfilter=" + keyfilter
				+ ", keyword=" + keyword + ", pageSize=" + pageSize + ", groupSize=" + groupSize + ", curPage="
				+ curPage + ", totalCount=" + totalCount + "]";
	}

	// 생성자
	public ReviewVO() {
		
	}

	public ReviewVO(String keyfilter, String keyword) {
		
		this.keyfilter = keyfilter;
		this.keyword = keyword;
	}

	public ReviewVO(String crnum, String mid, String rwriter, String crscore, String crsubject, String crmemo, String crreport,
			String insertdate, String updatedate, String delyn, String pageSize, String groupSize, String curPage,
			String totalCount) {
		
		this.crnum = crnum;
		this.mid = mid;
		this.rwriter = rwriter;
		this.crscore = crscore;
		this.crsubject = crsubject;
		this.crmemo = crmemo;
		this.crreport = crreport;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.delyn = delyn;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}

	public static Logger getLogger() {
		return logger;
	}

	public String getCrnum() {
		return crnum;
	}

	public String getMid() {
		return mid;
	}

	public String getRwriter() {
		return rwriter;
	}

	public String getCrsubject() {
		return crsubject;
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

	public String getPageSize() {
		return pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public static void setLogger(Logger logger) {
		ReviewVO.logger = logger;
	}

	public void setCrnum(String crnum) {
		this.crnum = crnum;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public void setCrsubject(String crsubject) {
		this.crsubject = crsubject;
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

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public String getKeyfilter() {
		return keyfilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
