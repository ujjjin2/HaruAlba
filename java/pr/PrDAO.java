package pr;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PrDAO {
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체
	
	public PrDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/haru?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
			String dbID = "haru"; //계정
			String dbPassword = "haru"; //비밀번호
			Class.forName("com.mysql.cj.jdbc.Driver"); //mysql에 접속을 도와주는 라이브러리 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Date getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getDate(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return getDate();
	}
	
	public int getNext() {
		String SQL = "SELECT MAX(prID) FROM pr";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("max(prID)") + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}

	
	// 글쓰기 기능
	public int writePR(Pr pr) {
		String SQL = "INSERT INTO pr VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, pr.getUserID());
			pstmt.setString(2, pr.getPrTITLE());
			pstmt.setString(3, pr.getPrRESUME());
			pstmt.setString(4, pr.getPrCONTENT());
			pstmt.setString(5, pr.getPrJOB());
			pstmt.setTimestamp(6, pr.getPrDATE());
			pstmt.setString(7, pr.getPrDAY());
			pstmt.setString(8, pr.getPrMONEY());
			return pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("글쓰기 실패");
			e.printStackTrace();
			
		}return -1;
	}
	

}
