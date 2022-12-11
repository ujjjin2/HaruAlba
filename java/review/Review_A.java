package review;

import java.sql.Timestamp;
import java.util.Date;

public class Review_A {
	private int rID;
	private String userID;
	private String rTITLE;
	private String rCONTENT;
	private String rVIEW;
	private Timestamp rDATE;
	
	
	public Timestamp getrDATE() {
		return rDATE;
	}
	public void setrDATE(Timestamp rDATE) {
		this.rDATE = rDATE;
	}
	public int getrID() {
		return rID;
	}
	public void setrID(int rID) {
		this.rID = rID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getrTITLE() {
		return rTITLE;
	}
	public void setrTITLE(String rTITLE) {
		this.rTITLE = rTITLE;
	}
	public String getrCONTENT() {
		return rCONTENT;
	}
	public void setrCONTENT(String rCONTENT) {
		this.rCONTENT = rCONTENT;
	}
	public String getrVIEW() {
		return rVIEW;
	}
	public void setrVIEW(String rVIEW) {
		this.rVIEW = rVIEW;
	}
	
	
}
