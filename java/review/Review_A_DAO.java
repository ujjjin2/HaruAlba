package review;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pt.Pt;
import user.UserDAO;

public class Review_A_DAO {
	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs; 

	public Review_A_DAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/haru?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
			String dbID = "haru";
			String dbPassword = "haru"; 
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Date getDate() {  // 글 생성 시간 가져오기
		String SQL = "SELECT NOW()";

		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getDate(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getDate();
	}

	public int getNext() { // 댓글 개수 가져오기
		String SQL = "SELECT MAX(prID) FROM pr";

		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt("max(prID)") + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;

	}

	public int writeReview(Review_A review) {  // 글 작성하기
		String SQL = "INSERT INTO reviewA VALUES (null, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, review.getUserID());
			pstmt.setString(2, review.getrTITLE());
			pstmt.setString(3, review.getrCONTENT());
			pstmt.setString(4, review.getrVIEW());
			pstmt.setTimestamp(5, review.getrDATE());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("글쓰기 실패");
			e.printStackTrace();

		}
		return -1;
	}

	public List<Review_A> myreview(String userid) throws SQLException { // 알바 썰 뽑기
		String SQL = "SELECT * FROM reviewA WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			ArrayList<Review_A> list3 = new ArrayList<Review_A>();

			while (rs.next()) {
				Review_A review = new Review_A();
				review.setrID(rs.getInt("rID"));
				review.setUserID(rs.getString("userID"));
				review.setrTITLE(rs.getString("rTITLE"));
				review.setrCONTENT(rs.getString("rCONTENT"));
				review.setrVIEW(rs.getString("rVIEW"));
				review.setrDATE(rs.getTimestamp("rDATE"));
				list3.add(review);
			}
			return list3;
		} finally {

		}
	}

	public ArrayList<Review_A> getSearch(String searchField, String searchText) { //알바 썰 검색
		ArrayList<Review_A> list = new ArrayList<Review_A>();

		if (searchField.equals("") && searchText.equals("")) { 

			String SQL2 = "SELECT * FROM reviewA";

			try {
				pstmt = conn.prepareStatement(SQL2);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					Review_A review = new Review_A();
					review.setrID(rs.getInt("rID"));
					review.setUserID(rs.getString("userID"));
					review.setrTITLE(rs.getString("rTITLE"));
					review.setrCONTENT(rs.getString("rCONTENT"));
					review.setrVIEW(rs.getString("rVIEW"));
					review.setrDATE(rs.getTimestamp("rDATE"));
					list.add(review);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(searchField.equals("userID")){
			
			String SQL = "select * from reviewA WHERE " + searchField.trim();

			try {
				if (searchText != null && !searchText.equals("")) {
					
					UserDAO userDAO = new UserDAO();
					String userid = userDAO.finduserId(searchText);
					
				
					if(userid != null) {	
					SQL += " LIKE '%" + userid.trim() + "%' order by rID desc";
					}else {
					SQL = "SELECT * FROM reviewA order by rID desc";
					}
				}else {
					SQL = "SELECT * FROM reviewA order by rID desc";
				}

				System.out.println(SQL);

				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Review_A review = new Review_A();
					review.setrID(rs.getInt("rID"));
					review.setUserID(rs.getString("userID"));
					review.setrTITLE(rs.getString("rTITLE"));
					review.setrCONTENT(rs.getString("rCONTENT"));
					review.setrVIEW(rs.getString("rVIEW"));
					review.setrDATE(rs.getTimestamp("rDATE"));
					list.add(review);
				}
			
		}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			
			String SQL = "select * from reviewA WHERE " + searchField.trim();

			try {
				if (searchText != null && !searchText.equals("")) {
					SQL += " LIKE '%" + searchText.trim() + "%' order by rID desc";
				} else {
					SQL = "SELECT * FROM reviewA order by rID desc";
				}

				System.out.println(SQL);

				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Review_A review = new Review_A();
					review.setrID(rs.getInt("rID"));
					review.setUserID(rs.getString("userID"));
					review.setrTITLE(rs.getString("rTITLE"));
					review.setrCONTENT(rs.getString("rCONTENT"));
					review.setrVIEW(rs.getString("rVIEW"));
					review.setrDATE(rs.getTimestamp("rDATE"));
					list.add(review);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public String prusername(String userID) { // ID 받아서 이름 가져오기
		String SQL = "SELECT userNAME FROM user where userID = ? ";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString(1);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int delete( String rID) { // 알바썰 지우기
		
		try {
			String SQL = "DELETE FROM reviewa WHERE rID in (" + rID.trim() +")";
			pstmt = conn.prepareStatement(SQL);
			pstmt.executeUpdate();
			
			System.out.println(SQL);
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
