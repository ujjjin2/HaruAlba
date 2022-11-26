package user;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList; 
import java.util.List;

import util.SHA256;

public class UserDAO {
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체
	
	SHA256 sha256 = new SHA256();
	
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
				if (rs.getString(1).equals(sha256.getSHA256(userPASSWORD))) //로그인 할때도 사용자가 입력한 암호를 해쉬로 변환하여 대조
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
			pstmt.setString(2, sha256.getSHA256(user.getUserPASSWORD())); // 회원가입할때 사용자가 입력한 비밀번호에 해쉬 적용 후 DB에 저장
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
			pstmt.setString(2, sha256.getSHA256(user.getUserPASSWORD())); // 회원가입할때 사용자가 입력한 비밀번호에 해쉬 적용 후 DB에 저장
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

	
	public String sessionnameonly(String userid) {
		String SQL = "SELECT userNAME FROM user WHERE userID = ?";
		
			try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid); 
			rs = pstmt.executeQuery();
			while(rs.next()) {
				  return rs.getString(1);
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return null;
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
	
	
	
	public String findPW(String userID, String userPHONE, String userNAME) { // 정보가 맞는지에 대한 검증
		String userpw = null;
		
		try {
			String SQL = "SELECT userPASSWORD FROM user WHERE userID= ? and userPHONE= ? and userNAME = ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPHONE);
			pstmt.setString(3, userNAME);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userpw = rs.getString("userPASSWORD");
				
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sha256.getSHA256(userpw);
	}
	
	public int changePW(String userID, String userPASSWORD) { // PW 수정
		
		try {
			String SQL = "update user set userPASSWORD=? WHERE userID= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, sha256.getSHA256(userPASSWORD));
			pstmt.setString(2, userID);
			
			pstmt.executeUpdate();
			return 1;	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
	
	public String findrole(String userID) { 
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
		String SQL = "SELECT userNAME, userLOCATION, userAGE, userGENDER, userPHONE, userRATING, role, userNICKNAME FROM user WHERE userID = ?";
		
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
			user.setUserNICKNAME(rs.getString("userNICKNAME"));
			list.add(user);
		}
		return list;
	}finally {
		//여기 뭐 넣어야함? ㅋㅋ
	}
	}
	
	public String findRATING(String userID) {  // 특정 유저 평점 셀렉트
		String rating = null;
		
		try {
			String SQL = "SELECT userRATING FROM user WHERE userID= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rating = rs.getString("userRATING");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rating;
	}
	
	public int changeRATING(String userID, String userRATING) { // 특정 유저 평점 수정
		
		try {
			String SQL = "update user set userRATING=? WHERE userID= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userRATING);
			pstmt.setString(2, userID);
			
			return pstmt.executeUpdate(); // 수정되면 1 나옴
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
	
	public int changeUserInfo(String userID, String userLOCATION, int userAGE, String userPHONE, String userNCIKNAME) {
		try {
			String SQL = "UPDATE user set userLOCATION=?, userAGE=?, userPHONE=?, userNICKNAME=? WHERE userID=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userLOCATION);
			pstmt.setInt(2, userAGE);
			pstmt.setString(3,userPHONE);
			pstmt.setString(4,userNCIKNAME);
			pstmt.setString(5, userID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	//이후 기능 구현
}

