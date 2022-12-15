<%@page import="review_comment.ReviewS_CmtDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String)session.getAttribute("userid");
	String role = (String)session.getAttribute("role");
	request.setCharacterEncoding("UTF-8");

	String rID = request.getParameter("rid");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ReviewS_CmtDAO reviewscmtDAO = new ReviewS_CmtDAO();
	int result = reviewscmtDAO.deleteScmt(rID);
	
    if (result == -1){ // 삭제 실패
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('삭제 실패!')");
        script.println("location.href = 'MyPage.jsp");    // 이전 페이지로 사용자를 이동
        script.println("</script>");
    }else{ // 삭제 완료
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('삭제가 완료되었습니다.')");
        script.println("location.href = 'MyPage.jsp'");    // 마이 페이지로 이동
        script.println("</script>");
    }
	
%>

</body>
</html>