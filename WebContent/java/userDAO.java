package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn; //데이터베이스에 접근하게 해주는 객체
	private PreparedStatement pstmt;
	private ResultSet rs; //정보를 담을 수 있는 객체
	
	// 자동으로 데이터베이스 커넥션이 이루어질 수 있도록 접속하게 해주는 소스
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC&useSSL=false"; 
			String dbID = "haru"; //
			String dbPassword = "haru";
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인 검증
	public int login(String userID, String userPASSWORD) { 
		String SQL = "SELECT userPASSWORD FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPASSWORD))
					return 1; //로그인 성공
				else
					return 0; // 비밀번호 다름
			}
			return -1; // 아이디 없음 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //DB 오류 
	}
	
	//회원가입
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPASSWORD());
			pstmt.setString(3, user.getUserNAME());
			pstmt.setString(4, user.getUserLOCATION());
			pstmt.setString(5, user.getUserAGE());
			pstmt.setString(6, user.getUserPHONE());
			pstmt.setString(7, user.getUserNICKNAME());
			return pstmt.executeUpdate(); // 0이상 값이 return된 경우 성공 
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1; //DB 오류 
	}
}