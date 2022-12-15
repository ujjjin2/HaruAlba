<%@page import="java.io.PrintWriter"%>
<%@page import="review_comment.Review_CmtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>

<jsp:useBean id="rcomment" class="review_comment.Review_Cmt" scope="page"></jsp:useBean>
<jsp:setProperty name="rcomment" property="comment"/>
<jsp:setProperty name="rcomment" property="rID"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String userid = (String)session.getAttribute("userid");
	Review_CmtDAO pr_comment = new Review_CmtDAO();
	rcomment.setUserID(userid);

	
int result = pr_comment.joincomment(rcomment);
	
    if (result == -1){ // 댓글작성 실패
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('댓글작성 실패')");
        script.println("history.back()");    // 이전 페이지로 사용자를 이동
        script.println("</script>");
    }else{ // 댓글작성 성공
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('댓글작성이 이 완료되었습니다.')");
        script.println("location.href = 'Detail_PR.jsp?rid="+rcomment.getrID()+"'");    // Detail_PR로 이동
        script.println("</script>");
    }
%>
</body>
</html>