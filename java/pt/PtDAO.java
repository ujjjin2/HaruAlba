package pt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pr.Pr;

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
	

	
	public String ptusername(String userID) { //pt테이블 외래키 userNAME select
		String SQL = "SELECT userNAME FROM user where userID = ? ";
		
		try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID); 
		rs = pstmt.executeQuery();
		while(rs.next()) {
			  return rs.getString(1);
		}
		conn.close();
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 글쓰기 기능
	public int writePT(Pt pt) {
		String SQL = "INSERT INTO pt VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, pt.getUserID());
			pstmt.setString(2, pt.getPtTITLE());
			pstmt.setString(3, pt.getPtINFO());
			pstmt.setString(4, pt.getPtROLE());
			pstmt.setString(5, pt.getPtSDAY());
			pstmt.setString(6, pt.getPtEDAY());
			pstmt.setString(7, pt.getPtMONEY());
			pstmt.setString(8, pt.getPtGIVE());
			pstmt.setString(9, pt.getPtCONTENT());
			pstmt.setString(10, pt.getPtSTATE());
			return pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("글쓰기 실패");
			e.printStackTrace();
			
		}return -1;
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
			pt.setPtSDAY(rs.getString("ptSDAY"));
			pt.setPtEDAY(rs.getString("ptEDAY"));
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
