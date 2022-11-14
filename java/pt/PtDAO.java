package pt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PtDAO {
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체
	
	public PtDAO() {
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
	
	public String prusername(String userID) { //pr테이블 외래키 userNAME select
		String SQL = "SELECT userNAME FROM pr, user where pr.userID = user.userID AND user.userID = ? ";
		
		try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID); 
		rs = pstmt.executeQuery();
		while(rs.next()) {
			  return rs.getString(1);
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String ptusername(String userID) { //pt테이블 외래키 userNAME select
		String SQL = "SELECT userNAME FROM pt, user where pt.userID = user.userID AND user.userID = ? ";
		
		try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID); 
		rs = pstmt.executeQuery();
		while(rs.next()) {
			  return rs.getString(1);
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
