package pt_comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import user.User;

public class PtcommentDAO {

	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs; 
	
	public PtcommentDAO() { 
		try {
		String dbURL = "jdbc:mysql://localhost:3306/haru?serverTimezone=UTC";
		String dbID = "haru"; 
		String dbPassword = "haru"; 
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
		e.printStackTrace();
	}
	}
	

	public List<Ptcomment> selectptcmt(int ptid) throws SQLException{ // 댓글 뽑기
		String SQL = "SELECT * FROM pt_comment WHERE ptID = ?";
		
		try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, ptid); 
		rs = pstmt.executeQuery();
		
		ArrayList<Ptcomment> ptlist = new ArrayList<Ptcomment>();
		
		while(rs.next()) {
			Ptcomment ptcomment = new Ptcomment();
			ptcomment.setCmt_id(rs.getInt("cmt_id"));
			ptcomment.setPtID(rs.getInt("ptID"));
			ptcomment.setUserID(rs.getString("userID"));
			ptcomment.setComment(rs.getString("comment"));
			ptlist.add(ptcomment);
		}
		return ptlist;
	}finally {

	}
	}
	
	public int joincomment(Ptcomment ptcomment) { // PT 댓글 달기
		String SQL = "INSERT INTO pt_comment VALUES(null, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ptcomment.getPtID());
			pstmt.setString(2, ptcomment.getUserID());
			pstmt.setString(3, ptcomment.getComment());
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
	
	
	
}
	
