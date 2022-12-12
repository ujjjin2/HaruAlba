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

public class Review_S_DAO {
	private Connection conn; // db 접근 객체
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체

	public Review_S_DAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/haru?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
			String dbID = "haru"; // 계정
			String dbPassword = "haru"; // 비밀번호
			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql에 접속을 도와주는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Date getDate() { // 현재 시간 가져오기
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

	public int getNext() {
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
	public int writeReview(Review_A review) {
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

	public List<Review_S> myreview(String userid) throws SQLException { // PR 리스트 뽑아오기
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
			// 여기 뭐 넣어야함? ㅋㅋ
		}
	}

	public ArrayList<Review_S> getSearch(String searchField, String searchText) { // PR 검색
		ArrayList<Review_S> list = new ArrayList<Review_S>();

		if (searchField.equals("") && searchText.equals("")) { // 둘다 비었으면 그냥 select

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

	public String prusername(String userID) { // pr테이블 외래키 userNAME select
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

}
