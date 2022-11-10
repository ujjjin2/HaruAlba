package pr;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PR_DAO {
	private Connection conn; //db 접근 객체 
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
	
	public Date getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getDate(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return getDate();
	}

	
	// 글쓰기 기능
	public int writePR(PR_DTO pr) {
		String SQL = "INSERT INTO pr(userID, prTITLE, prRESUME, prCONTENT, prJOB, prDATE, prDAY, prMONEY) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		
		int rs = 0;
		PR_DTO dto = new PR_DTO();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getUserID());
			pstmt.setString(2, dto.getPrTITLE());
			pstmt.setString(3, dto.getPrRESUME());
			pstmt.setString(4, dto.getPrCONTENT());
			pstmt.setString(5, dto.getPrJOB());
			pstmt.setDate(6, dto.getPrDATE());
			pstmt.setString(7, dto.getPrDAY());
			pstmt.setString(8, dto.getPrMONEY());
			
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("글쓰기 실패");
			e.printStackTrace();
			
		}
		return rs; // DB오류
	
	}
	

}
