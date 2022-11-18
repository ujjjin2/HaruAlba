package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList; // 단축키 : ctrl + shift + 'o'
import java.util.List;

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

	public String sessionname(String userid) {
		String SQL = "SELECT userNAME, userID FROM user WHERE userID = ?";
		
			try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid); 
			rs = pstmt.executeQuery();
			while(rs.next()) {
				  return rs.getString(1) + "님" +"("+ rs.getString(2)+")";
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	
	public String findId(String userNAME, String userPHONE) { // ID 찾기 메서드
		String userid = null;
		
		try {
			String SQL = "SELECT userID FROM user WHERE userNAME= ? and userPHONE= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userNAME);
			pstmt.setString(2, userPHONE);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userid = rs.getString("userID");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userid;
	}
	
	public String findPW(String userID, String userPHONE) { // PW 찾기 메서드
		String userpw = null;
		
		try {
			String SQL = "SELECT userPASSWORD FROM user WHERE userID= ? and userPHONE= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPHONE);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userpw = rs.getString("userPASSWORD");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userpw;
	}
	
	public String findrole(String userID) { // PW 찾기 메서드
		String userrole = null;
		
		try {
			String SQL = "SELECT role FROM user WHERE userID= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userrole = rs.getString("role");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userrole;
	}
	
	public List<User> selectall(String userid) throws SQLException{
		String SQL = "SELECT userNAME, userLOCATION, userAGE, userGENDER, userPHONE, userRATING, role FROM user WHERE userID = ?";
		
		try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userid); 
		rs = pstmt.executeQuery();
		
		ArrayList<User> list = new ArrayList<User>();
		
		while(rs.next()) {
			User user = new User();
			user.setUserNAME(rs.getString("userNAME"));
			user.setUserLOCATION(rs.getString("userLOCATION"));
			user.setUserAGE(rs.getInt("userAGE"));
			user.setUserGENDER(rs.getString("userGENDER"));
			user.setUserPHONE(rs.getString("userPHONE"));
			user.setUserRATING(rs.getInt("userRATING"));
			user.setRole(rs.getString("role"));
			list.add(user);
		}
		return list;
	}finally {
		//여기 뭐 넣어야함? ㅋㅋ
	}
	}
	
	
	//이후 기능 구현
}

