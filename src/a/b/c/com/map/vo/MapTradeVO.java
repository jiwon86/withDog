package a.b.c.com.map.vo;

public class MapTradeVO {

	// VO SET
	private String tno;
    private String tcontent;
    private String tprice;
    private String tlat;
    private String tlng;
    private String taddress;
    private String tphoto;
    private String twriter;
    private String mno;
    private String pno;
    private String propose;
    private String startdate;
    private String enddate;
    private String deleteyn;
    private String insertdate;
    private String updatedate;
    
    public MapTradeVO () {}

    public MapTradeVO(String tno, String tcontent, String tprice, String tlat, String tlng, String taddress,
			String tphoto, String twriter, String mno, String pno, String propose, String startdate, String enddate,
			String deleteyn, String insertdate, String updatedate) {
		super();
		this.tno = tno;
		this.tcontent = tcontent;
		this.tprice = tprice;
		this.tlat = tlat;
		this.tlng = tlng;
		this.taddress = taddress;
		this.tphoto = tphoto;
		this.twriter = twriter;
		this.mno = mno;
		this.pno = pno;
		this.propose = propose;
		this.startdate = startdate;
		this.enddate = enddate;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	// GET
	public String getTno() {
		return tno;
	}

	public String getTcontent() {
		return tcontent;
	}

	public String getTprice() {
		return tprice;
	}

	public String getTlat() {
		return tlat;
	}

	public String getTlng() {
		return tlng;
	}

	public String getTaddress() {
		return taddress;
	}

	public String getTphoto() {
		return tphoto;
	}

	public String getTwriter() {
		return twriter;
	}

	public String getMno() {
		return mno;
	}

	public String getPno() {
		return pno;
	}

	public String getPropose() {
		return propose;
	}

	public String getStartdate() {
		return startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}
	
	// SET
	public void setTno(String tno) {
		this.tno = tno;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public void setTprice(String tprice) {
		this.tprice = tprice;
	}

	public void setTlat(String tlat) {
		this.tlat = tlat;
	}

	public void setTlng(String tlng) {
		this.tlng = tlng;
	}

	public void setTaddress(String taddress) {
		this.taddress = taddress;
	}

	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}

	public void setTwriter(String twriter) {
		this.twriter = twriter;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public void setPropose(String propose) {
		this.propose = propose;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
    
	
	
}
