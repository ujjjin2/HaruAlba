<%@page import="review.Review_S_DAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "review.Review_A_DAO" %>
<%

request.setCharacterEncoding("UTF-8");
%>
<%@ page import = "java.io.PrintWriter" %>

<jsp:useBean id="review" class="review.Review_A" scope="page"></jsp:useBean>
<jsp:setProperty name="review" property="rTITLE"/>
<jsp:setProperty name="review" property="rCONTENT"/>
<%


	String userid = (String)session.getAttribute("userid");
	String role = (String)session.getAttribute("role");
	
	request.setCharacterEncoding("UTF-8"); 

	review.setUserID(userid);
	Timestamp date = new Timestamp(System.currentTimeMillis());
	review.setrDATE(date);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Review_S_DAO reviewDAO = new Review_S_DAO();
    int result = reviewDAO.writeReview(review);
    if (result == -1){ // 작성 실패
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('작성 실패')");
        script.println("history.back()");    // 이전 페이지로 사용자를 이동
        script.println("</script>");
    }else{ // 작성 성공
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('작성이 완료되었습니다.')");
        script.println("location.href = 'TotalTable_review_Sajang.jsp'");    // 사장리뷰 페이지로 이동
        script.println("</script>");
        
    }
%>
</body>
</html>