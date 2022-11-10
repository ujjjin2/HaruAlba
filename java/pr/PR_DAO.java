package pr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PR_DAO {
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체
	
	public PR_DAO() {
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
	
	// 글쓰기 기능
	public String writePR(PR_DTO pr) {
		String SQL = "INSERT INTO pr VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pr.getPrID());
			pstmt.setString(2, pr.getPrUESRID());
			pstmt.setString(3, pr.getPrTITLE());
			pstmt.setString(4, pr.getPrRESUME());
			pstmt.setString(5, pr.getPrCONTENT());
			pstmt.setString(6, pr.getPrJOB());
			pstmt.setDate(7, pr.getPrDATE());
			pstmt.setString(8, pr.getPrDAY());
			pstmt.setString(9, pr.getPrMONEY());
			
		} catch(SQLException e) {
			System.out.println("글쓰기 실패");
			e.printStackTrace();
			
		}
		return SQL;
	
	}
	

}
