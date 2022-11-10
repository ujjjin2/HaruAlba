package pr;

import java.sql.Date;

public class PR_DTO {
	private int prID;
	private String userID;
	private String prTITLE;
	private String prRESUME;
	private String prCONTENT;
	private String prJOB;
	private Date prDATE;
	private String prDAY;
	private String prMONEY;
	
	
	public int getPrID() {
		return prID;
	}
	public void setPrID(int prID) {
		this.prID = prID;
	}

	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPrTITLE() {
		return prTITLE;
	}
	public void setPrTITLE(String prTITLE) {
		this.prTITLE = prTITLE;
	}
	public String getPrRESUME() {
		return prRESUME;
	}
	public void setPrRESUME(String prRESUME) {
		this.prRESUME = prRESUME;
	}
	public String getPrCONTENT() {
		return prCONTENT;
	}
	public void setPrCONTENT(String prCONTENT) {
		this.prCONTENT = prCONTENT;
	}
	public String getPrJOB() {
		return prJOB;
	}
	public void setPrJOB(String prJOB) {
		this.prJOB = prJOB;
	}

	public Date getPrDATE() {
		return prDATE;
	}
	public void setPrDATE(Date prDATE) {
		this.prDATE = prDATE;
	}

	public String getPrDAY() {
		return prDAY;
	}
	public void setPrDAY(String prDAY) {
		this.prDAY = prDAY;
	}
	public String getPrMONEY() {
		return prMONEY;
	}
	public void setPrMONEY(String prMONEY) {
		this.prMONEY = prMONEY;
	}
	
}
