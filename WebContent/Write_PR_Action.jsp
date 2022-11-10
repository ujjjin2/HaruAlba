<%@page import="java.util.Arrays"%>
<%@page import="pr.PR_DTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="pr.PR_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pr" class="pr.PR_DTO" scope="page"></jsp:useBean>
<jsp:setProperty name="pr" property="prID"/>
<jsp:setProperty name="pr" property="userID"/>
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
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String category = request.getParameter("category");
	String pay = request.getParameter("pay");
	String [] checkbox = request.getParameterValues("checkbox");
	String selfPr = request.getParameter("self_PR");
	String resume = request.getParameter("simpleresume");
	
	String str_checkbox = Arrays.toString(checkbox);
	PR_DTO dto = new PR_DTO();
	
	dto.setPrTITLE(title);
	dto.setPrJOB(category);
	dto.setPrMONEY(pay);
	dto.setPrDAY(str_checkbox);
	dto.setPrCONTENT(selfPr);
	dto.setPrRESUME(resume);
	
	PR_DAO dao = new PR_DAO();
	dao.writePR(dto);
	
	out.println(pr.getPrCONTENT());
	out.println(dto.getPrCONTENT());
	out.println(dto.getPrDAY());
	out.println(dto.getPrMONEY());
	out.println(dto.getPrRESUME());
	out.println(dto.getPrTITLE());
	
	String userID = null;
	if(session.getAttribute("userid") != null) {
		userID = (String) session.getAttribute("userid");
	}
	
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 이후 이용 가능한 서비스 입니다.')");
		script.println("location.href = 'Login.jsp'");
		script.println("</script>");
	} else {
		if (pr.getPrTITLE() == null || pr.getPrCONTENT() == null || pr.getPrDAY() == null
				|| pr.getPrJOB() == null || pr.getPrMONEY() == null || pr.getPrRESUME() == null) {

		} else {
			// DB 저장
			PR_DAO prdao = new PR_DAO();
			int result = prdao.writePR(pr);
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("userid", pr.getUserID());
				 PrintWriter script = response.getWriter();
	             script.println("<script>");
	             script.println("alert('가입이 완료되었습니다.')");
	             script.println("location.href = 'TotalTable_PR.jsp'");    // 메인 페이지로 이동
	             script.println("</script>");
			}
		}
	}








%>
</body>
</html>