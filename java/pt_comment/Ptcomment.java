package pt_comment;

public class Ptcomment { // 알바 구인구직 댓글 DTO
	int cmt_id;
	int ptID;
	String userID;
	String comment;
	
	
	public int getCmt_id() {
		return cmt_id;
	}
	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
	}
	public int getPtID() {
		return ptID;
	}
	public void setPtID(int ptID) {
		this.ptID = ptID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
