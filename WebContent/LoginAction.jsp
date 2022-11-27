<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPASSWORD"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>LoginAction</title>
</head>
<body>
    <% // 스크립트릿
    
        UserDAO userDAO = new UserDAO();
    	String saltresult = userDAO.checksalt(user.getUserID());
        int result = userDAO.login(user.getUserID(), user.getUserPASSWORD(),saltresult);
        String role = userDAO.findrole(user.getUserID());
        // ID가 사장 OR 알바
        if (result ==1){
            PrintWriter script = response.getWriter();
            session.setAttribute("userid", user.getUserID()); // 유저 아이디 받아서 세션 변수 설정
            session.setAttribute("role", role); // 유저 아이디 역할 변수 설정
			response.sendRedirect("Main.jsp");
        }
        else if (result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");   //이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");    //이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('DB 오류가 발생했습니다.')");
            script.println("history.back()");    //이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
    %>
 
</body>
</html>