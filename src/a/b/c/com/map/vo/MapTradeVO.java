package a.b.c.com.map.vo;

public class MapTradeVO {

	// VO SET
	private String TNO;
    private String TTITLE;
    private String TCONTENT;
    private String TWRITER;
    private String TPRICE;
    private String TPHOTO;
    private String TLAT;
    private String TLNG;
    private String MNO;
    private String DELETEYN;
    private String INSERTDATE;
    private String UPDATEDATE;
    
    public MapTradeVO () {}
    
    

	public MapTradeVO(String tNO, String tTITLE, String tCONTENT, String tWRITER, String tPRICE, String tPHOTO,
			String tLAT, String tLNG, String mNO, String dELETEYN, String iNSERTDATE, String uPDATEDATE) {
		super();
		TNO = tNO;
		TTITLE = tTITLE;
		TCONTENT = tCONTENT;
		TWRITER = tWRITER;
		TPRICE = tPRICE;
		TPHOTO = tPHOTO;
		TLAT = tLAT;
		TLNG = tLNG;
		MNO = mNO;
		DELETEYN = dELETEYN;
		INSERTDATE = iNSERTDATE;
		UPDATEDATE = uPDATEDATE;
	}



	public String getTNO() {
		return TNO;
	}

	public String getTTITLE() {
		return TTITLE;
	}

	public String getTCONTENT() {
		return TCONTENT;
	}

	public String getTWRITER() {
		return TWRITER;
	}

	public String getTPRICE() {
		return TPRICE;
	}

	public String getTPHOTO() {
		return TPHOTO;
	}

	public String getTLAT() {
		return TLAT;
	}

	public String getTLNG() {
		return TLNG;
	}

	public String getMNO() {
		return MNO;
	}

	public String getDELETEYN() {
		return DELETEYN;
	}

	public String getINSERTDATE() {
		return INSERTDATE;
	}

	public String getUPDATEDATE() {
		return UPDATEDATE;
	}

	public void setTNO(String tNO) {
		TNO = tNO;
	}

	public void setTTITLE(String tTITLE) {
		TTITLE = tTITLE;
	}

	public void setTCONTENT(String tCONTENT) {
		TCONTENT = tCONTENT;
	}

	public void setTWRITER(String tWRITER) {
		TWRITER = tWRITER;
	}

	public void setTPRICE(String tPRICE) {
		TPRICE = tPRICE;
	}

	public void setTPHOTO(String tPHOTO) {
		TPHOTO = tPHOTO;
	}

	public void setTLAT(String tLAT) {
		TLAT = tLAT;
	}

	public void setTLNG(String tLNG) {
		TLNG = tLNG;
	}

	public void setMNO(String mNO) {
		MNO = mNO;
	}

	public void setDELETEYN(String dELETEYN) {
		DELETEYN = dELETEYN;
	}

	public void setINSERTDATE(String iNSERTDATE) {
		INSERTDATE = iNSERTDATE;
	}

	public void setUPDATEDATE(String uPDATEDATE) {
		UPDATEDATE = uPDATEDATE;
	}
    


    
	
	
}
