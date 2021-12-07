package a.b.c.com.park.vo;

public class RparkVO {
	
	private String rinum;
	private String inum;
	private String riname;
	private String ricontent;
	private String riinsert;
	private String ridelete;
	
	public RparkVO() {
		
	}
	
	public RparkVO(String rinum,     String inum,     String riname, 
				   String ricontent, String riinsert, String ridelete) {
	
		this.rinum = rinum;
		this.inum = inum;
		this.riname = riname;
		this.ricontent = ricontent;
		this.riinsert = riinsert;
		this.ridelete = ridelete;
	}

	public String getRinum() {
		return rinum;
	}

	public void setRinum(String rinum) {
		this.rinum = rinum;
	}

	public String getInum() {
		return inum;
	}

	public void setInum(String inum) {
		this.inum = inum;
	}

	public String getRiname() {
		return riname;
	}

	public void setRiname(String riname) {
		this.riname = riname;
	}

	public String getRicontent() {
		return ricontent;
	}

	public void setRicontent(String ricontent) {
		this.ricontent = ricontent;
	}

	public String getRiinsert() {
		return riinsert;
	}

	public void setRiinsert(String riinsert) {
		this.riinsert = riinsert;
	}

	public String getRidelete() {
		return ridelete;
	}

	public void setRidelete(String ridelete) {
		this.ridelete = ridelete;
	}

}
