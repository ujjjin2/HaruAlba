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
import pt.PtDAO;
import review_comment.ReviewS_CmtDAO;
import review_comment.Review_CmtDAO;
import user.UserDAO;

public class Review_S_DAO {
	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs; 

	public Review_S_DAO() {
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

	public Date getDate() {  // 날짜 가져오기
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

	public int getNext() { // 총개수 가져오기
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

	// 글쓰기 기능
	public int writeReview(Review_A review) { // 사장썰 작성하기
		String SQL = "INSERT INTO reviewS VALUES (null, ?, ?, ?, ?, ?)";

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

	public List<Review_S> myreview(String userid) throws SQLException { // 내가 작성한 리뷰 뽑아오기
		String SQL = "SELECT * FROM reviewS WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			ArrayList<Review_S> list3 = new ArrayList<Review_S>();

			while (rs.next()) {
				Review_S review = new Review_S();
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

	public ArrayList<Review_S> getSearch(String searchField, String searchText) { // 검색하기
		ArrayList<Review_S> list = new ArrayList<Review_S>();

		if (searchField.equals("") && searchText.equals("")) { 

			String SQL2 = "SELECT * FROM reviewS order by rID desc";

			try {
				pstmt = conn.prepareStatement(SQL2);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					Review_S review = new Review_S();
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
		} else if(searchField.equals("userID")) {
			
			String SQL = "select * from reviewS WHERE " + searchField.trim();

			try {
				if (searchText != null && !searchText.equals("")) {
					
					UserDAO userDAO = new UserDAO();
					String userid = userDAO.finduserId(searchText);
					
				if(userid != null) {
					SQL += " LIKE '%" + userid.trim() + "%' order by rID desc";
				} else {
					SQL = "SELECT * FROM reviewS order by rID desc";
				}
				}else {
					SQL = "SELECT * FROM reviewS order by rID desc";
				}
				
				
				System.out.println(SQL);

				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Review_S review = new Review_S();
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
			String SQL = "select * from reviewS WHERE " + searchField.trim();

			try {
				if (searchText != null && !searchText.equals("")) {
					SQL += " LIKE '%" + searchText.trim() + "%' order by rID desc";
				} else {
					SQL = "SELECT * FROM reviewS order by rID desc";
				}

				System.out.println(SQL);

				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Review_S review = new Review_S();
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

	public String prusername(String userID) { // ID로 이름 가져오기
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
	
	public int deleteS( String rID) { // 사장썰 지우기
		
		try {
			String SQL = "DELETE FROM reviews WHERE rID in (" + rID.trim() +")";
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
