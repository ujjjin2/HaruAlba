package user;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.SALT;
import util.SHA256;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs; 

	SHA256 sha256 = new SHA256();
	SALT salt = new SALT();

	public UserDAO() { 
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

	public String checksalt(String userID) { // ID의 SALT 받아오기
		String SQL = "SELECT salt FROM user WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int login(String userID, String userPASSWORD, String saltresult) { // 아이디 비밀번호 + 사용자의 SALT 받아서 로그인
		String SQL = "SELECT userPASSWORD FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(sha256.getSHA256(userPASSWORD, saltresult))) // 로그인 할때도 사용자가 입력한 암호를 해쉬로 변환하여 대조
																						
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -2; // DB 오류
	}

	public int joinEmployer(User user) { // 사장 가입

		String saltresult = salt.makeSALT();

		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, sha256.getSHA256(user.getUserPASSWORD(), saltresult)); // 회원가입할때 사용자가 입력한 비밀번호에 해쉬 적용 후 DB 저장
																						
			pstmt.setString(3, user.getUserNAME());
			pstmt.setString(4, user.getUserLOCATION());
			pstmt.setInt(5, user.getUserAGE());
			pstmt.setString(6, user.getUserGENDER());
			pstmt.setString(7, user.getUserPHONE());
			pstmt.setString(8, user.getUserNICKNAME());
			pstmt.setFloat(9, 0);
			pstmt.setString(10, "사장");
			pstmt.setInt(11, 0);
			pstmt.setInt(12, 0);
			pstmt.setString(13, saltresult);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1; // DB 오류
	}

	public int joinEmployee(User user) { // 알바 가입

		String saltresult = salt.makeSALT();

		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, sha256.getSHA256(user.getUserPASSWORD(), saltresult)); // 회원가입할때 사용자가 입력한 비밀번호에 해쉬 적용 후 DB 저장
																						
			pstmt.setString(3, user.getUserNAME());
			pstmt.setString(4, user.getUserLOCATION());
			pstmt.setInt(5, user.getUserAGE());
			pstmt.setString(6, user.getUserGENDER());
			pstmt.setString(7, user.getUserPHONE());
			pstmt.setString(8, user.getUserNICKNAME());
			pstmt.setFloat(9, 0);
			pstmt.setString(10, "알바");
			pstmt.setInt(11, 0);
			pstmt.setInt(12, 0);
			pstmt.setString(13, saltresult);

			return pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1; // DB 오류
	}

	public String sessionnameonly(String userid) {  // ID로 이름 뽑기
		String SQL = "SELECT userNAME FROM user WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String sessionname(String userid) { // ID로 이름이랑 ID 형식 맞춰서 뽑기 
		String SQL = "SELECT userNAME, userID FROM user WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString(1) + "님" + "(" + rs.getString(2) + ")";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String findId(String userNAME, String userPHONE) { // ID 찾기
		String userid = null;

		try {
			String SQL = "SELECT userID FROM user WHERE userNAME= ? and userPHONE= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userNAME);
			pstmt.setString(2, userPHONE);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				userid = rs.getString("userID");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return userid;
	}

	public String finduserId(String userNAME) { // 이름으로 ID 찾기
		String userid = null;

		try {
			String SQL = "SELECT userID FROM user WHERE userNAME= ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userNAME);

			rs = pstmt.executeQuery();

			if (rs.next()) {
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

			if (rs.next()) {
				userpw = rs.getString("userPASSWORD");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return userpw;
	}

	public int changePW(String userID, String userPASSWORD, String saltresult) { // PW 수정

		try {
			String SQL = "update user set userPASSWORD=? , salt=? WHERE userID= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, sha256.getSHA256(userPASSWORD, saltresult));
			pstmt.setString(2, saltresult);
			pstmt.setString(3, userID);

			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}

	public String findrole(String userID) { // 사용자 역할 찾기
		String userrole = null;

		try {
			String SQL = "SELECT role FROM user WHERE userID= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				userrole = rs.getString("role");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return userrole;
	}

	public List<User> selectall(String userid) throws SQLException { // 유저 정보 뽑기
		String SQL = "SELECT userNAME, userLOCATION, userAGE, userGENDER, userPHONE, userRATING, role, userNICKNAME FROM user WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			ArrayList<User> list = new ArrayList<User>();

			while (rs.next()) {
				User user = new User();
				user.setUserNAME(rs.getString("userNAME"));
				user.setUserLOCATION(rs.getString("userLOCATION"));
				user.setUserAGE(rs.getInt("userAGE"));
				user.setUserGENDER(rs.getString("userGENDER"));
				user.setUserPHONE(rs.getString("userPHONE"));
				user.setUserRATING(rs.getFloat("userRATING"));
				user.setRole(rs.getString("role"));
				user.setUserNICKNAME(rs.getString("userNICKNAME"));
				list.add(user);
			}
			return list;
		} finally {
			
		}
	}

	public String findRATING(String userID) { // 특정 유저 평점 뽑기
		String rating = null;

		try {
			String SQL = "SELECT userRATING FROM user WHERE userID= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				rating = rs.getString("userRATING");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rating;
	}

	public int changeRATING(String userID, String userRATING) { // 특정 유저 평점 변경

		try {
			String SQL = "update user set userRATING=? WHERE userID= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userRATING);
			pstmt.setString(2, userID);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}

	public int changeUserInfo(String userID, String userLOCATION, int userAGE, String userPHONE, String userNCIKNAME) { // 유저 정보 수정
																														
																														
		try {
			String SQL = "UPDATE user set userLOCATION=?, userAGE=?, userPHONE=?, userNICKNAME=? WHERE userID=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userLOCATION);
			pstmt.setInt(2, userAGE);
			pstmt.setString(3, userPHONE);
			pstmt.setString(4, userNCIKNAME);
			pstmt.setString(5, userID);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int addEval(String userID) { // 평점 기입 횟수 수정
		String SQL = "UPDATE user SET userEVAL = userEVAL + 1 WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);

			return pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1; // DB 오류
	}

	public int addTotal(float rating, String userID) { // 평점 추가하기
		String SQL = "UPDATE user SET userTOTAL = userTOTAL + ? WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setFloat(1, rating);
			pstmt.setString(2, userID);

			
			return pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1; // DB 오류
	}

	public int addRating(String userID) { // 평점 변환하기
		String SQL = "UPDATE user SET userRATING = TRUNCATE(userTOTAL/userEVAL, 1) WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);

			return pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1; // DB 오류
	}

}
