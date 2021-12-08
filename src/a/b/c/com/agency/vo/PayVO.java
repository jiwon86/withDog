package a.b.c.com.agency.vo;

public class PayVO {
	private String payno;
	private String impid;
	private String tno;
	private String cno;
	private String merchantid;
	private String applynum;
	private String cardname;
	private String paymethod;
	private String cardnumber;
	private String payamount;
	private String payname;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	private String tmno;
	private String cmno;
	
	// 페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;	
	
	public PayVO() {
		
	}

	public PayVO(String payno, String impid, String tno, String cno, 
			String merchantid, String applynum, String cardname, String paymethod, 
			String cardnumber, String payamount, String payname, String deleteyn,
			String insertdate, String updatedate, String tmno, String cmno, 
			String pageSize, String groupSize, String curPage, String totalCount) {
		this.payno = payno;
		this.impid = impid;
		this.tno = tno;
		this.cno = cno;
		this.merchantid = merchantid;
		this.applynum = applynum;
		this.cardname = cardname;
		this.paymethod = paymethod;
		this.cardnumber = cardnumber;
		this.payamount = payamount;
		this.payname = payname;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.tmno = tmno;
		this.cmno = cmno;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}

	public String getPayno() {
		return payno;
	}

	public void setPayno(String payno) {
		this.payno = payno;
	}

	public String getImpid() {
		return impid;
	}

	public void setImpid(String impid) {
		this.impid = impid;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getMerchantid() {
		return merchantid;
	}

	public void setMerchantid(String merchantid) {
		this.merchantid = merchantid;
	}

	public String getApplynum() {
		return applynum;
	}

	public void setApplynum(String applynum) {
		this.applynum = applynum;
	}

	public String getCardname() {
		return cardname;
	}

	public void setCardname(String cardname) {
		this.cardname = cardname;
	}

	public String getPaymethod() {
		return paymethod;
	}

	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}

	public String getCardnumber() {
		return cardnumber;
	}

	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}

	public String getPayamount() {
		return payamount;
	}

	public void setPayamount(String payamount) {
		this.payamount = payamount;
	}

	public String getPayname() {
		return payname;
	}

	public void setPayname(String payname) {
		this.payname = payname;
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

	public String getTmno() {
		return tmno;
	}

	public void setTmno(String tmno) {
		this.tmno = tmno;
	}

	public String getCmno() {
		return cmno;
	}

	public void setCmno(String cmno) {
		this.cmno = cmno;
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
