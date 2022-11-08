package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; // 단축키 : ctrl + shift + 'o'

public class UserDAO {
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체
	
	public UserDAO() { // dao 생성자에서 db connection 
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
	// 로그인 기능 
	public int login(String userID, String userPASSWORD) {
		String SQL = "SELECT userPASSWORD FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPASSWORD)) // rs.getString(1) : select된 첫번째 컬럼
					return 1; //로그인 성공
				else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디 없음 
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -2; //DB 오류 
	}
	
	public int joinEmployer(User user) {
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPASSWORD());
			pstmt.setString(3, user.getUserNAME());
			pstmt.setString(4, user.getUserLOCATION());
			pstmt.setInt(5, user.getUserAGE());
			pstmt.setString(6, user.getUserGENDER());
			pstmt.setString(7, user.getUserPHONE());
			pstmt.setString(8, user.getUserNICKNAME());
			pstmt.setInt(9, 36);
			pstmt.setString(10, "사장");
			return pstmt.executeUpdate(); // 0이상 값이 return된 경우 성공 
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1; //DB 오류 
	}
	
	public int joinEmployee(User user) {
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPASSWORD());
			pstmt.setString(3, user.getUserNAME());
			pstmt.setString(4, user.getUserLOCATION());
			pstmt.setInt(5, user.getUserAGE());
			pstmt.setString(6, user.getUserGENDER());
			pstmt.setString(7, user.getUserPHONE());
			pstmt.setString(8, user.getUserNICKNAME());
			pstmt.setInt(9, 36);
			pstmt.setString(10, "알바");
			return pstmt.executeUpdate(); // 0이상 값이 return된 경우 성공 
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1; //DB 오류 
	}
	
	//이후 기능 구현
	
}