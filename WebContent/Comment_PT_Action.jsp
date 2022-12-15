<%@page import="java.io.PrintWriter"%>
<%@page import="pt_comment.PtcommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>

<jsp:useBean id="ptcomment" class="pt_comment.Ptcomment" scope="page"></jsp:useBean>
<jsp:setProperty name="ptcomment" property="comment"/>
<jsp:setProperty name="ptcomment" property="ptID"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String userid = (String)session.getAttribute("userid");
	PtcommentDAO pt_comment = new PtcommentDAO();
	ptcomment.setUserID(userid);
	
	int result = pt_comment.joincomment(ptcomment);
	
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
        script.println("location.href = 'Detail_PartTime.jsp?ptid="+ptcomment.getPtID()+"'");    // 단기알바로 이동
        script.println("</script>");
    }


%>
</body>
</html>