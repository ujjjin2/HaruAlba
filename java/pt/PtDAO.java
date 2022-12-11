package pt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pr.Pr;
import user.UserDAO;

public class PtDAO {
	private Connection conn; // db 접근 객체
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체

	public PtDAO() {
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

	public String ptusername(String userID) { // pt테이블 외래키 userNAME select
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

	public String ptiduserid(int ptID) { // ptID로 유저이름 뽑기
		String SQL = "SELECT userID FROM pt where  ptID = ? ";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ptID);
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

	public String ptrating(String userID) { // pt테이블 외래키 userNAME, rating , userPHONE select
		String SQL = "SELECT userRATING FROM user where userID = ? ";

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

	public String ptSTATE(int ptID) { // pt 상태 뽑아오기
		String SQL = "SELECT ptSTATE FROM pt where ptID = ? ";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ptID);
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

	// 글쓰기 기능
	public int writePT(Pt pt) { // PT 글쓰기
		String SQL = "INSERT INTO pt VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, null, ?, ?)";

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
			pstmt.setString(11, "0");
			pstmt.setString(12, "0");
			
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("글쓰기 실패");
			e.printStackTrace();

		}
		return -1;
	}

	public List<Pt> mypt(String userid) throws SQLException { // PT 리스트 뽑아오기
		String SQL = "SELECT * FROM pt WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			ArrayList<Pt> list2 = new ArrayList<Pt>();

			while (rs.next()) {
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
				pt.setPtALBA(rs.getString("ptALBA"));
				pt.setPtWriteSAJANG(rs.getString("ptWriteSAJANG"));
				
				list2.add(pt);
			}
			return list2;
		} finally {
			// 여기 뭐 넣어야함? ㅋㅋ
		}
	}

	public ArrayList<Pt> getSearch(String searchField, String searchText) { // PT 검색
		ArrayList<Pt> list4 = new ArrayList<Pt>();

		if (searchField.equals("") && searchText.equals("")) { // 둘다 비었으면 그냥 select

			String SQL2 = "SELECT * FROM pt";

			try {
				pstmt = conn.prepareStatement(SQL2);
				rs = pstmt.executeQuery();

				while (rs.next()) {
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
					list4.add(pt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (searchField.equals("userID")) {

			String SQL = "select * from pt WHERE " + searchField.trim();

			try {
				if (searchText != null && !searchText.equals("")) {

					UserDAO userDAO = new UserDAO();
					String userid = userDAO.finduserId(searchText);
					
					if(userid != null) {
						SQL += " LIKE '%" + userid.trim() + "%' order by ptID desc";
					}else {
						SQL = "SELECT * FROM pt";
					}
				} else {
					SQL = "SELECT * FROM pt";
				}

				System.out.println(SQL);

				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
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
					list4.add(pt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			String SQL = "select * from pt WHERE " + searchField.trim();

			try {
				if (searchText != null && !searchText.equals("")) {
					SQL += " LIKE '%" + searchText.trim() + "%' order by ptID desc";
				} else {
					SQL = "SELECT * FROM pt";
				}

				System.out.println(SQL);

				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
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
					list4.add(pt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list4;
	}

	
	
	
	
	public List<Pt> endpt(String userid) throws SQLException { // 자신이 지원한 PT
		String SQL = "SELECT * FROM pt WHERE ptALBA= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			ArrayList<Pt> list3 = new ArrayList<Pt>();

			while (rs.next()) {
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
				pt.setPtWriteALBA(rs.getString("ptWriteALBA"));
				list3.add(pt);

			}
			return list3;
		} finally {

		}
	}

	public List<Pt> joinpt(String userid) throws SQLException {
		String SQL = "SELECT * FROM pt where ptID IN (SELECT ptID FROM pt_comment WHERE userID=?) ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			ArrayList<Pt> list4 = new ArrayList<Pt>();

			while (rs.next()) {
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
				list4.add(pt);

			}
			return list4;
		} finally {

		}
	}

	public String checkALBA(String ptID) { // pt테이블 외래키 userNAME, rating , userPHONE select
		String SQL = "SELECT ptSTATE FROM pt where ptID = ? ";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ptID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int selectALBA(String ptID, String ptALBA) { // pt 내용
		try {
			String SQL = "update pt set ptSTATE = ?, ptALBA = ? WHERE ptID= ? ";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "마감");
			pstmt.setString(2, ptALBA);
			pstmt.setString(3, ptID);

			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}

	public int checkRatingALBA(int ptID) { // 알바 레이팅 업데이트
		try {
			String SQL = "UPDATE pt set ptWriteALBA = ? WHERE ptID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "1");
			pstmt.setInt(2, ptID);

			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int checkRatingSAJANG(int ptID) { // 사장 레이팅 업데이트
		try {
			String SQL = "UPDATE pt set ptWriteSAJANG = ? WHERE ptID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, ptID);

			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	
	public ArrayList<Pt> getLocationSearch(String searchField, String searchText, String location) { // PT 검색
		ArrayList<Pt> list4 = new ArrayList<Pt>();

		if (searchField.equals("") && searchText.equals("")) { // 둘다 비었으면 그냥 select

			String SQL2 = "SELECT * FROM pt WHERE ptLOCATION = ? ";

			try {
				pstmt = conn.prepareStatement(SQL2);
				pstmt.setString(1, location.trim());
				rs = pstmt.executeQuery();

				while (rs.next()) {
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
					list4.add(pt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (searchField.equals("userID")) {

			String SQL = "select * from pt WHERE " + searchField.trim();

			try {
				if (searchText != null && !searchText.equals("")) {

					UserDAO userDAO = new UserDAO();
					String userid = userDAO.finduserId(searchText);
					
					if(userid != null) {
						SQL += " LIKE '%" + userid.trim() + "%' order by ptID desc";
					}else {
						SQL = "SELECT * FROM pt";
					}
				} else {
					SQL = "SELECT * FROM pt";
				}

				System.out.println(SQL);

				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
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
					list4.add(pt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			String SQL = "select * from pt WHERE " + searchField.trim();

			try {
				if (searchText != null && !searchText.equals("")) {
					SQL += " LIKE '%" + searchText.trim() + "%' order by ptID desc";
				} else {
					SQL = "SELECT * FROM pt";
				}

				System.out.println(SQL);

				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
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
					list4.add(pt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list4;
	}
	
}
