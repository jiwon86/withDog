package a.b.c.com.qna.vo;

public class RqnaVO {

	private String rqnanum;
	private String qnanum;
	private String rqnatitle;
	private String rqnacon;
	private String rqnawriter;
	private String rqnapw;
	private String rqnadelyn;
	private String rqnainsert;
	private String rqnaupdatedate;
	
	public RqnaVO() {
		
	}

	public RqnaVO(String rqnanum, String qnanum, String rqnatitle, 
				  String rqnacon, String rqnawriter, String rqnapw,
				  String rqnadelyn, String rqnainsert, String rqnaupdatedate) {
		
		this.rqnanum = rqnanum;
		this.qnanum = qnanum;
		this.rqnatitle = rqnatitle;
		this.rqnacon = rqnacon;
		this.rqnawriter = rqnawriter;
		this.rqnapw = rqnapw;
		this.rqnadelyn = rqnadelyn;
		this.rqnainsert = rqnainsert;
		this.rqnaupdatedate = rqnaupdatedate;
	}

	public String getRqnanum() {
		return rqnanum;
	}

	public String getQnanum() {
		return qnanum;
	}

	public String getRqnatitle() {
		return rqnatitle;
	}

	public String getRqnacon() {
		return rqnacon;
	}

	public String getRqnawriter() {
		return rqnawriter;
	}

	public String getRqnapw() {
		return rqnapw;
	}

	public String getRqnadelyn() {
		return rqnadelyn;
	}

	public String getRqnainsert() {
		return rqnainsert;
	}
	
	public String getRqnaupdatedate() {
		return rqnaupdatedate;
	}

	public void setRqnanum(String rqnanum) {
		this.rqnanum = rqnanum;
	}

	public void setQnanum(String qnanum) {
		this.qnanum = qnanum;
	}

	public void setRqnatitle(String rqnatitle) {
		this.rqnatitle = rqnatitle;
	}

	public void setRqnacon(String rqnacon) {
		this.rqnacon = rqnacon;
	}

	public void setRqnawriter(String rqnawriter) {
		this.rqnawriter = rqnawriter;
	}

	public void setRqnapw(String rqnapw) {
		this.rqnapw = rqnapw;
	}

	public void setRqnadelyn(String rqnadelyn) {
		this.rqnadelyn = rqnadelyn;
	}

	public void setRqnainsert(String rqnainsert) {
		this.rqnainsert = rqnainsert;
	}

	public void setRqnaupdatedate(String rqnaupdatedate) {
		this.rqnaupdatedate = rqnaupdatedate;
	}

	@Override
	public String toString() {
		return "RqnaVO [rqnanum=" + rqnanum + ", qnanum=" + qnanum + ", rqnatitle=" + rqnatitle + ", rqnacon=" + rqnacon
				+ ", rqnawriter=" + rqnawriter + ", rqnapw=" + rqnapw + ", rqnadelyn=" + rqnadelyn + ", rqnainsert="
				+ rqnainsert + ", rqnaupdatedate=" + rqnaupdatedate + "]";
	}
}