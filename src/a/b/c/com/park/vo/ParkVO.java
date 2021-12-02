package a.b.c.com.park.vo;

public class ParkVO {
	
	private String inum;
	private String iid;
	private String iphoto;
	private String iupload;
	private String icontent;
	private String deleteyn;
	private String iupdate;
	private String iinsert;
	
	public ParkVO() {
		
	}
	
	public ParkVO(String inum,    String iid,      String iphoto, 
				  String iupload, String icontent, String deleteyn,
				  String iupdate, String iinsert) {
		
		this.inum = inum;
		this.iid = iid;
		this.iphoto = iphoto;
		this.iupload = iupload;
		this.icontent = icontent;
		this.deleteyn = deleteyn;
		this.iupdate = iupdate;
		this.iinsert = iinsert;
	}
	public String getInum() {
		return inum;
	}
	public void setInum(String inum) {
		this.inum = inum;
	}
	public String getIid() {
		return iid;
	}
	public void setIid(String iid) {
		this.iid = iid;
	}
	public String getIphoto() {
		return iphoto;
	}
	public void setIphoto(String iphoto) {
		this.iphoto = iphoto;
	}
	public String getIupload() {
		return iupload;
	}
	public void setIupload(String iupload) {
		this.iupload = iupload;
	}
	public String getIcontent() {
		return icontent;
	}
	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}
	public String getDeleteyn() {
		return deleteyn;
	}
	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}
	public String getIupdate() {
		return iupdate;
	}
	public void setIupdate(String iupdate) {
		this.iupdate = iupdate;
	}
	public String getIinsert() {
		return iinsert;
	}
	public void setIinsert(String iinsert) {
		this.iinsert = iinsert;
	}

}
