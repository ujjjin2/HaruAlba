<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String title = request.getParameter("title");
	String category = request.getParameter("category");
	String pay = request.getParameter("pay");
	String [] checkbox = request.getParameterValues("checkbox");
	String self_PR = request.getParameter("self_PR");
	String simpleresume = request.getParameter("simpleresume");
	
	String str_checkbox = Arrays.toString(checkbox);

	if(title==null) title="";
	if(category==null) category="";
	if(pay==null) pay="";
	if(str_checkbox==null) str_checkbox="";
	if(self_PR == null) self_PR="";
	if(simpleresume == null) simpleresume = "";
	
	int readCount = 0;
	
	Timestamp date = new Timestamp(System.currentTimeMillis());
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/haru?serverTimezone=UTC", "haru", "haru");
	
	int prID = 0;
	String SQL = "SELECT MAX(prID) FROM pr";
	PreparedStatement pstmt = conn.prepareStatement(SQL);
	
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
	prID = rs.getInt("max(prID)")+1;
	}
	
	SQL ="insert into pr(prID, userID, prTITLE, prRESUME, prCONTENT, prJOB, prDATE, prDAY, prMONEY) values(?,?,?,?,?,?,?,?,?)";

	pstmt=conn.prepareStatement(SQL);

	pstmt.setInt(1, prID);

	pstmt.setString(2, "dd");

	pstmt.setString(3, title);

	pstmt.setString(4, simpleresume);

	pstmt.setString(5, self_PR);

	pstmt.setString(6, category);

	pstmt.setTimestamp(7, date);
	
	pstmt.setString(8, str_checkbox);
	
	pstmt.setString(9, pay);
	
	pstmt.executeUpdate();
	
	
	pstmt.close();
	conn.close();
	PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('글쓰기 완료.')");
    script.println("location.href = 'TotalTable_PR.jsp'");    // 메인 페이지로 이동
    script.println("</script>");
%>
</body>
</html>