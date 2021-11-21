package a.b.c.com.agency.vo;

public class OfferVO {
	private String tno;
	private String ttitle;
	private String tcontent;
	private String tprice;
	private String tlat;
	private String tlng;
	private String mno;
	private String pno;
	private String startdate;
	private String enddate;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	private String mid;
	
	public OfferVO() {
		
	}
	
	public OfferVO(String tno, String ttitle, String tcontent, 
				   String tprice, String tlat, String tlng, 
				   String mno, String pno, String startdate, 
				   String enddate, String deleteyn, String insertdate, 
				   String updatedate, String mid) {
		this.tno = tno;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tprice = tprice;
		this.tlat = tlat;
		this.tlng = tlng;
		this.mno = mno;
		this.pno = pno;
		this.startdate = startdate;
		this.enddate = enddate;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.mid = mid;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getTtitle() {
		return ttitle;
	}

	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getTprice() {
		return tprice;
	}

	public void setTprice(String tprice) {
		this.tprice = tprice;
	}

	public String getTlat() {
		return tlat;
	}

	public void setTlat(String tlat) {
		this.tlat = tlat;
	}

	public String getTlng() {
		return tlng;
	}

	public void setTlng(String tlng) {
		this.tlng = tlng;
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

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

}
