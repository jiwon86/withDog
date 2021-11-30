package a.b.c.com.member.vo;

import java.io.Serializable;
import java.util.List;

// 멤버 VO객체
public class Member implements Serializable{
	
	private static final long serialVersionUID = -4346265086625051741L;
	
	private String mno;
	private String mid;
	private String mpw;
	private String memail;
	private String mname;
	private String mbirth;
	private String mphoto;
	
	private String mzonecode;
	private String mroadaddress;
	private String mjibunaddress;
	
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;
	
	// 페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	@Override
	public String toString() {
		return "Member [mno=" + mno + ", mid=" + mid + ", mpw=" + mpw + ", memail=" + memail + ", mname=" + mname
				+ ", mbirth=" + mbirth + ", mphoto=" + mphoto + ", mzonecode=" + mzonecode + ", mroadaddress="
				+ mroadaddress + ", mjibunaddress=" + mjibunaddress + ", deleteyn=" + deleteyn + ", insertdate="
				+ insertdate + ", updatedate=" + updatedate + ", keyfilter=" + keyfilter + ", keyword=" + keyword
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", pageSize=" + pageSize + ", groupSize="
				+ groupSize + ", curPage=" + curPage + ", totalCount=" + totalCount + ", authList=" + authList + "]";
	}


	public Member(String mno, String mid, String mpw, String memail, String mname, String mbirth, String mphoto,
			String mzonecode, String mroadaddress, String mjibunaddress, String deleteyn, String insertdate,
			String updatedate, String keyfilter, String keyword, String startdate, String enddate, String pageSize,
			String groupSize, String curPage, String totalCount, List<MemberAuth> authList) {
		super();
		this.mno = mno;
		this.mid = mid;
		this.mpw = mpw;
		this.memail = memail;
		this.mname = mname;
		this.mbirth = mbirth;
		this.mphoto = mphoto;
		this.mzonecode = mzonecode;
		this.mroadaddress = mroadaddress;
		this.mjibunaddress = mjibunaddress;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.keyfilter = keyfilter;
		this.keyword = keyword;
		this.startdate = startdate;
		this.enddate = enddate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.authList = authList;
	}

	private List<MemberAuth> authList;
	
	

	public Member() {
		
	}


	public String getMno() {
		return mno;
	}


	public void setMno(String mno) {
		this.mno = mno;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getMpw() {
		return mpw;
	}


	public void setMpw(String mpw) {
		this.mpw = mpw;
	}


	public String getMemail() {
		return memail;
	}


	public void setMemail(String memail) {
		this.memail = memail;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getMbirth() {
		return mbirth;
	}


	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}


	public String getMphoto() {
		return mphoto;
	}


	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}


	public String getMzonecode() {
		return mzonecode;
	}


	public void setMzonecode(String mzonecode) {
		this.mzonecode = mzonecode;
	}


	public String getMroadaddress() {
		return mroadaddress;
	}


	public void setMroadaddress(String mroadaddress) {
		this.mroadaddress = mroadaddress;
	}


	public String getMjibunaddress() {
		return mjibunaddress;
	}


	public void setMjibunaddress(String mjibunaddress) {
		this.mjibunaddress = mjibunaddress;
	}


	public String getDeleteyn() {
		return deleteyn;
	}


	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
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


	public String getKeyfilter() {
		return keyfilter;
	}


	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getStartdate() {
		return startdate;
	}


	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}


	public String getEnddate() {
		return enddate;
	}


	public void setEnddate(String enddate) {
		this.enddate = enddate;
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


	public List<MemberAuth> getAuthList() {
		return authList;
	}


	public void setAuthList(List<MemberAuth> authList) {
		this.authList = authList;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
	
	
	
}
