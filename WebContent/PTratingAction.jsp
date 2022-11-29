<%@page import="pt.PtDAO"%>
<%@page import="pt.Pt"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:useBean id="pt" class="pt.Pt" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userRATING"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="pt" property="ptID"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserDAO userDAO = new UserDAO();
	PtDAO ptDAO = new PtDAO();
	
	user.setUserID(user.getUserID());
	userDAO.addEval(user.getUserID());
	userDAO.addTotal(user.getUserRATING(), user.getUserID());
	
	pt.setPtID(pt.getPtID());
	ptDAO.checkRatingALBA(pt.getPtID());

	out.println(pt.getPtID());
	
	int result = userDAO.addRating(user.getUserID());
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
	    script.println("alert('평점이 반영되었습니다.')");
	    script.println("location.href = 'MyPage.jsp'");
	    script.println("</script>");
	} else if( result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('DB 오류가 발생했습니다.')");
        script.println("history.back()"); 
        script.println("</script>");
	}
%>

</body>
</html>