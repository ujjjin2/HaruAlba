package pt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<Pt> mypt(String userid) throws SQLException{
		String SQL = "SELECT * FROM pt WHERE userID = ?";
		
		try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userid); 
		rs = pstmt.executeQuery();
		
		ArrayList<Pt> list2 = new ArrayList<Pt>();
		
		while(rs.next()) {
			Pt pt = new Pt();
			pt.setPtID(rs.getInt("ptID"));
			pt.setUserID(rs.getString("userID"));
			pt.setPtTITLE(rs.getString("ptTITLE"));
			pt.setPtINFO(rs.getString("ptINFO"));
			pt.setPtROLE(rs.getString("ptROLE"));
			pt.setPtPERIOD(rs.getString("ptPERIOD"));
			pt.setPtMONEY(rs.getString("ptMONEY"));
			pt.setPtGIVE(rs.getString("ptGIVE"));
			pt.setPtCONTENT(rs.getString("ptCONTENT"));
			pt.setPtSTATE(rs.getString("ptSTATE"));
			list2.add(pt);
		}
		return list2;
	}finally {
		//여기 뭐 넣어야함? ㅋㅋ
	}
	}
	
	
}
