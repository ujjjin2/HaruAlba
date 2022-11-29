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
	// 작성, 보이게하는거랑
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체
	
	public PtcommentDAO() { 
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
	
	//리스트 뽑기
	public List<Ptcomment> selectptcmt(int ptid) throws SQLException{
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
		//여기 뭐 넣어야함? ㅋㅋ
	}
	}
	
	public int joincomment(Ptcomment ptcomment) { // PT 댓글 달기
		String SQL = "INSERT INTO pt_comment VALUES(null, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ptcomment.getPtID());
			pstmt.setString(2, ptcomment.getUserID());
			pstmt.setString(3, ptcomment.getComment());
			return pstmt.executeUpdate(); // 0이상 값이 return된 경우 성공 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
	
	
	
}
	
