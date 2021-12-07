package a.b.c.com.agency.vo;

public class AgencyVO {
	private String ano;
	private String tno;
	private String cno;
	private String matchyn;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	public AgencyVO() {
		
	}
	
	public AgencyVO(String ano, String tno, String cno, 
					String matchyn, String deleteyn, String insertdate,
					String updatedate) {
		this.ano = ano;
		this.tno = tno;
		this.cno = cno;
		this.matchyn = matchyn;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}
	
	public String getAno() {
		return ano;
	}
	public void setAno(String ano) {
		this.ano = ano;
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
	public String getMatchyn() {
		return matchyn;
	}
	public void setMatchyn(String matchyn) {
		this.matchyn = matchyn;
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
	
}
