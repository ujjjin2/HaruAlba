<%@page import="java.io.PrintWriter"%>
<%@page import="pr_comment.PrcommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>

<jsp:useBean id="prcomment" class="pr_comment.Prcomment" scope="page"></jsp:useBean>
<jsp:setProperty name="prcomment" property="comment"/>
<jsp:setProperty name="prcomment" property="prID"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userid = (String)session.getAttribute("userid");
	PrcommentDAO pr_comment = new PrcommentDAO();
	prcomment.setUserID(userid);

	
int result = pr_comment.joincomment(prcomment);
	
    if (result == -1){ // 회원가입 실패
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('댓글작성 실패')");
        script.println("history.back()");    // 이전 페이지로 사용자를 이동
        script.println("</script>");
    }else{ // 회원가입 성공
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('댓글작성이 이 완료되었습니다.')");
        script.println("location.href = 'Detail_PR.jsp?prid="+prcomment.getPrID()+"'");    // 메인 페이지로 이동
        script.println("</script>");
    }
%>
</body>
</html>