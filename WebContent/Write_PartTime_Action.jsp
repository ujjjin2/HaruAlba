<%@page import="java.io.PrintWriter"%>
<%@page import="pt.PtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:useBean id="pt" class="pt.Pt" scope="page"></jsp:useBean>
<jsp:setProperty name="pt" property="ptTITLE"/>
<jsp:setProperty name="pt" property="ptINFO"/>
<jsp:setProperty name="pt" property="ptROLE"/>
<jsp:setProperty name="pt" property="ptSDAY"/>
<jsp:setProperty name="pt" property="ptEDAY"/>
<jsp:setProperty name="pt" property="ptMONEY"/>
<jsp:setProperty name="pt" property="ptGIVE"/>
<jsp:setProperty name="pt" property="ptSTATE"/>
<jsp:setProperty name="pt" property="ptCONTENT"/>
<%
	String userid = (String)session.getAttribute("userid");
	String role = (String)session.getAttribute("role");
	request.setCharacterEncoding("UTF-8");

	pt.setUserID(userid);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PtDAO ptDAO = new PtDAO();
	int result = ptDAO.writePT(pt);
    if (result == -1){ // 작성 실패
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('작성 실패')");
        script.println("history.back()");    // 이전 페이지로 사용자를 이동
        script.println("</script>");
    }else{ // 작성 완료
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('작성이 완료되었습니다.')");
        script.println("location.href = 'TotalTable_PartTime.jsp'");    // 단기 알바 페이지로 이동
        script.println("</script>");
    }
	
%>
</body>
</html>