package pr_comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pt_comment.Ptcomment;

public class PrcommentDAO {

		private Connection conn; //db 접근 객체 
		private PreparedStatement pstmt;
		private ResultSet rs; // db 결과를 담는 객체
	
	public PrcommentDAO() {
		try {
		String dbURL = "jdbc:mysql://localhost:3306/haru?serverTimezone=UTC";
		String dbID = "haru"; //계정
		String dbPassword = "haru"; //비밀번호
		Class.forName("com.mysql.cj.jdbc.Driver"); //mysql에 접속을 도와주는 라이브러리 
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
		e.printStackTrace();
	}
	}
	
	public List<Prcomment> selectprcmt(int prid) throws SQLException{ // PR댓글 리스트 뽑아오기
		String SQL = "SELECT * FROM pr_comment WHERE prID = ?";
		
		try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, prid); 
		rs = pstmt.executeQuery();
		
		ArrayList<Prcomment> prlist = new ArrayList<Prcomment>();
		
		while(rs.next()) {
			Prcomment prcomment = new Prcomment();
			prcomment.setCmt_id(rs.getInt("cmt_id"));
			prcomment.setPrID(rs.getInt("prID"));
			prcomment.setUserID(rs.getString("userID"));
			prcomment.setComment(rs.getString("comment"));
			prlist.add(prcomment);
		}
		return prlist;
	}finally {
		//여기 뭐 넣어야함? ㅋㅋ
	}
	}
	
	public int joincomment(Prcomment prcomment) { // 댓글달기 
		String SQL = "INSERT INTO pr_comment VALUES(null, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, prcomment.getPrID());
			pstmt.setString(2, prcomment.getUserID());
			pstmt.setString(3, prcomment.getComment());
			return pstmt.executeUpdate(); // 0이상 값이 return된 경우 성공 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
	
}
