<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPASSWORD"/>
<jsp:setProperty name="user" property="userNAME"/>
<jsp:setProperty name="user" property="userGENDER"/>
<jsp:setProperty name="user" property="userPHONE"/>
<jsp:setProperty name="user" property="userNICKNAME"/>
<jsp:setProperty name="user" property="userLOCATION"/>
<jsp:setProperty name="user" property="userAGE"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>EmployeeAction</title>
</head>
<body>
    <%
    	if (user.getUserID() == null || user.getUserPASSWORD() == null || user.getUserNAME() == null 
    		|| user.getUserGENDER() == null || user.getUserPHONE() == null ||
    		Integer.toString(user.getUserAGE()) ==null || user.getUserNICKNAME()==null
    		
    			){
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든 문항을 입력해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 이동
            script.println("</script>");
    	}else{
    		UserDAO userDAO = new UserDAO(); // 성공
            int result = userDAO.joinEmployee(user);	// 회원가입 기능 시작
            if (result == -1){ // 회원가입 실패
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 이동
                script.println("</script>");
            }else{ // 회원가입 성공
                session.setAttribute("userid", user.getUserID()); // 유저 아이디 받아서 세션 변수 설정
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('가입이 완료되었습니다.')");
                script.println("location.href = 'Login.jsp'");    // 메인 페이지로 이동
                script.println("</script>");
            }
    	}
    %>
 
</body>
</html>