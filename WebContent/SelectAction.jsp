<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="pt.PtDAO"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>SelectAction</title>
</head>
<body>
<%
	String ptALBA = request.getParameter("ptALBA");
	String ptID = request.getParameter("ptID");
	String ptSTATE = null;
	PtDAO ptDAO = new PtDAO();
	
	ptSTATE = ptDAO.checkALBA(ptID);
	
	if (ptSTATE.equals("모집중")){
		
		int result = ptDAO.selectALBA(ptID, ptALBA);
		if(result ==1){
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('선택이 완료되었습니다.')");
	        script.println("history.back()");
	        script.println("</script>");
		}else if(result == -1){
			
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('DB 오류가 발생했습니다.')");
	        script.println("history.back()"); 
	        script.println("</script>");
			
		}
		
	}else{
		
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 모집완료된 사항입니다.')");
        script.println("history.back()"); 
        script.println("</script>");	
	}
	
%>
</body>
</html>