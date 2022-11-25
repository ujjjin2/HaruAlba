<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userLOCATION"/>
<jsp:setProperty name="user" property="userAGE"/>
<jsp:setProperty name="user" property="userNICKNAME"/>
<jsp:setProperty name="user" property="userPHONE"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userid = (String) session.getAttribute("userid");
	UserDAO userDAO = new UserDAO();
	user.setUserID(userid);
	int result = userDAO.changeUserInfo(user.getUserID(), user.getUserLOCATION(), user.getUserAGE(), user.getUserPHONE(), user.getUserNICKNAME());
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
	    script.println("alert('회원정보 변경이 완료되었습니다.')");
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