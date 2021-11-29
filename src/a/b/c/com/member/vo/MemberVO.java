package a.b.c.com.member.vo;

import java.io.Serializable;
import java.util.List;

// 멤버 VO객체
public class MemberVO implements Serializable{
	
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
	
	private List<MemberAuth> authList;
	
	@Override
	public String toString() {
		return "Member [mno=" + mno + ", mid=" + mid + ", mpw=" + mpw + ", memail=" + memail + ", mname=" + mname
				+ ", mbirth=" + mbirth + ", mphoto=" + mphoto + ", mzonecode=" + mzonecode + ", mroadaddress="
				+ mroadaddress + ", mjibunaddress=" + mjibunaddress + ", deleteyn=" + deleteyn + ", insertdate="
				+ insertdate + ", updatedate=" + updatedate + ", authList=" + authList + "]";
	}

	public MemberVO() {
		
	}
	
	public MemberVO(String mno, String mid, String mpw, 
				  String memail, String mname, String mphoto, 
				  String mzonecode, String mroadaddress, String mjibunaddress, 
				  String deleteyn, String insertdate, String updatedate,
				  List<MemberAuth> authList) {
		this.mno = mno;
		this.mid = mid;
		this.mpw = mpw;
		this.memail = memail;
		this.mname = mname;
		this.mphoto = mphoto;
		this.mzonecode = mzonecode;
		this.mroadaddress = mroadaddress;
		this.mjibunaddress = mjibunaddress;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.authList = authList;
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

	public List<MemberAuth> getAuthList() {
		return authList;
	}

	public void setAuthList(List<MemberAuth> authList) {
		this.authList = authList;
	}	
	
}
