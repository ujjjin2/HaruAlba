package review_comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pt_comment.Ptcomment;

public class ReviewS_CmtDAO {

	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs; 

	public ReviewS_CmtDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/haru?serverTimezone=UTC";
			String dbID = "haru"; 
			String dbPassword = "haru"; 
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Review_Cmt> selectprcmt(int prid) throws SQLException { // 사장 썰 댓글 뽑기
		String SQL = "SELECT * FROM reviewS_cmt WHERE rID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, prid);
			rs = pstmt.executeQuery();

			ArrayList<Review_Cmt> prlist = new ArrayList<Review_Cmt>();

			while (rs.next()) {
				Review_Cmt prcomment = new Review_Cmt();
				prcomment.setCmt_id(rs.getInt("cmt_id"));
				prcomment.setrID(rs.getInt("rID"));
				prcomment.setUserID(rs.getString("userID"));
				prcomment.setComment(rs.getString("comment"));
				prlist.add(prcomment);
			}
			return prlist;
		} finally {

		}
	}

	public int joincomment(Review_Cmt prcomment) { // 사장 썰 댓글 작성
		String SQL = "INSERT INTO reviewS_cmt VALUES(null, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, prcomment.getrID());
			pstmt.setString(2, prcomment.getUserID());
			pstmt.setString(3, prcomment.getComment());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}

}
