<%@page import="java.io.PrintWriter"%>
<%@page import="pr.PR_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pr" class="pr.PR_DTO" scope="page"></jsp:useBean>
<jsp:setProperty name="pr" property="prID"/>
<jsp:setProperty name="pr" property="prUESRID"/>
<jsp:setProperty name="pr" property="prTITLE"/>
<jsp:setProperty name="pr" property="prRESUME"/>
<jsp:setProperty name="pr" property="prCONTENT"/>
<jsp:setProperty name="pr" property="prJOB"/>
<jsp:setProperty name="pr" property="prDATE"/>
<jsp:setProperty name="pr" property="prDAY"/>
<jsp:setProperty name="pr" property="prMONEY"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(pr.getPrTITLE() == null && pr.getPrCONTENT() == null && pr.getPrDATE() == null && pr.getPrDAY() == null
			&& pr.getPrMONEY()  == null &&  pr.getPrJOB() == null && pr.getPrRESUME() == null) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 문항을 입력해주세요.')");
            script.println("</script>");
		} else {
			PR_DAO prdao = new PR_DAO();
			PrintWriter script = response.getWriter();
            script.println("<script>"); 
            script.println("location.href = 'TotalTable_PR.jsp'"); // 자기PR페이지로 이동
            script.println("</script>");
		}
	
	
	
	
		
		
		
	
	
	%>
</body>
</html>