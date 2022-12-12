<%@page import="pt_comment.PtcommentDAO"%>
<%@page import="pt_comment.Ptcomment"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="pt.PtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userid = (String)session.getAttribute("userid");
	String role = (String)session.getAttribute("role");
	request.setCharacterEncoding("UTF-8");

	String ptID = request.getParameter("ptid");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PtcommentDAO ptcmtDAO = new PtcommentDAO();

	int result = ptcmtDAO.deletePTCMT(ptID);
	
    if (result == -1){ // 삭제
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('삭제 실패!')");
        script.println("location.href = 'MyPage.jsp");    // 이전 페이지로 사용자를 이동
        script.println("</script>");
    }else{ // 
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('삭제가 완료되었습니다.')");
        script.println("location.href = 'MyPage.jsp'");    // 메인 페이지로 이동
        script.println("</script>");
    }
	
%>

</body>
</html>