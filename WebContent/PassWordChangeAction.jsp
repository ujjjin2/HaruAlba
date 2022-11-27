<%@page import="util.SALT"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>

<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPASSWORD"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>PassWordChangeAction</title>
</head>
<body>
<%

	String userPASSWORD = request.getParameter("userPASSWORD");
	String userPASSWORD2 = request.getParameter("userPASSWORD2");
	
	if(userPASSWORD.equals(userPASSWORD2)){

	UserDAO userDAO = new UserDAO();
	SALT salt = new SALT();
	String saltresult = salt.makeSALT();
	int result = userDAO.changePW(user.getUserID(), user.getUserPASSWORD(), saltresult);
	if (result ==1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 변경되었습니다.')");
        script.println("location.href = 'Login.jsp'");
        script.println("</script>");
	}else if (result == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('DB 오류가 발생했습니다.')");
        script.println("history.back()"); 
        script.println("</script>");
		}
	}else if(!userPASSWORD.equals(userPASSWORD2)){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 일치하지 않습니다.')");
        script.println("history.back()");
        script.println("</script>");
	}
	
	
	
%>

</body>
</html>