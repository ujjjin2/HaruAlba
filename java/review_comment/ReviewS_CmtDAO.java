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

	private Connection conn; // db 접근 객체
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체

	public ReviewS_CmtDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/haru?serverTimezone=UTC";
			String dbID = "haru"; // 계정
			String dbPassword = "haru"; // 비밀번호
			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql에 접속을 도와주는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Review_Cmt> selectprcmt(int prid) throws SQLException { // PR댓글 리스트 뽑아오기
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
			// 여기 뭐 넣어야함? ㅋㅋ
		}
	}

	public int joincomment(Review_Cmt prcomment) { // 댓글달기
		String SQL = "INSERT INTO reviewS_cmt VALUES(null, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, prcomment.getrID());
			pstmt.setString(2, prcomment.getUserID());
			pstmt.setString(3, prcomment.getComment());
			return pstmt.executeUpdate(); // 0이상 값이 return된 경우 성공
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}

}
