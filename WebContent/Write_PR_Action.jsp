<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pr.PrDAO" %>
<%@ page import = "java.io.PrintWriter" %>

<jsp:useBean id="pr" class="pr.Pr" scope="page"></jsp:useBean>
<jsp:setProperty name="pr" property="prTITLE"/>
<jsp:setProperty name="pr" property="prRESUME"/>
<jsp:setProperty name="pr" property="prCONTENT"/>
<jsp:setProperty name="pr" property="prJOB"/>
<jsp:setProperty name="pr" property="prDAY"/>
<jsp:setProperty name="pr" property="prMONEY"/>
<%
	String userid = (String)session.getAttribute("userid");
	String role = (String)session.getAttribute("role");
	
	request.setCharacterEncoding("UTF-8"); 

	String [] prDAY = request.getParameterValues("prDAY");
	String prday = new String();
	
	for(int i=0; i<prDAY.length;i++){
		prday += prDAY[i] + " "; 
	}
%>


<%
	pr.setPrDAY(prday);
	pr.setUserID(userid);
		
	Timestamp date = new Timestamp(System.currentTimeMillis());
	pr.setPrDATE(date);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PrDAO prDAO = new PrDAO();
    int result = prDAO.writePR(pr);
    if (result == -1){ // 회원가입 실패
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('작성 실패')");
        script.println("history.back()");    // 이전 페이지로 사용자를 이동
        script.println("</script>");
    }else{ // 회원가입 성공
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('작성이 완료되었습니다.')");
        script.println("location.href = 'TotalTable_PR.jsp'");    // 메인 페이지로 이동
        script.println("</script>");
    }
%>
</body>
</html>