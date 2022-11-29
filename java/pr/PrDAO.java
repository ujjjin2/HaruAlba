package pr;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


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
	
	public Date getDate() { //현재 시간 가져오기
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
	
	public List<Pr> mypr(String userid) throws SQLException{ //PR 리스트 뽑아오기
		String SQL = "SELECT * FROM pr WHERE userID = ?";
		
		try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userid); 
		rs = pstmt.executeQuery();
		
		ArrayList<Pr> list3 = new ArrayList<Pr>();
		
		while(rs.next()) {
			Pr pr = new Pr();
			pr.setPrID(rs.getInt("prID"));
			pr.setUserID(rs.getString("userID"));
			pr.setPrTITLE(rs.getString("prTITLE"));
			pr.setPrRESUME(rs.getString("prRESUME"));
			pr.setPrCONTENT(rs.getString("prCONTENT"));
			pr.setPrJOB(rs.getString("prJOB"));
			pr.setPrDATE(rs.getTimestamp("prDATE"));
			pr.setPrDAY(rs.getString("prDAY"));
			pr.setPrMONEY(rs.getString("prMONEY"));			
			list3.add(pr);
		}
		return list3;
	}finally {
		//여기 뭐 넣어야함? ㅋㅋ
	}
	}
	
	
	public String prusername(String userID) { //pr테이블 외래키 userNAME select
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

}
