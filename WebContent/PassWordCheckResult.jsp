<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>PassWordCheckResult</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String userID = request.getParameter("userID");
	String userPHONE = request.getParameter("userPHONE");
		
	UserDAO userDAO = new UserDAO();	
	String userpw = userDAO.findPW(userID, userPHONE); //아이디를 디비에서 가져옴
	
	if(userpw ==null){
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('정보가 잘못되었습니다.')");
        script.println("history.back()");    // 이전 페이지로 사용자를 이동
        script.println("</script>");
	}else{
	
	%>
	<div class="container-fluid" style="background-color:#525CDE">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="jumbotron jumbotron-fluid" style="background-color:#FFF2BE;padding-top:30px;height:100%;align:center">
				<center>
					<A href="Login.jsp">
						<img src="images/harulogo.png">
					</A>
				</center>
					<form method="post" action="Login.jsp">
						<div class="form-group">
							<div style="background-color:#FFF2BE;padding:75px 0;border-style:solid;border-color:#525CDE;height:200px;font-weight:bold;text-align:center;margin-bottom:30px">
								<center style="font-size:22px;">아이디는 [ <%= userpw %> ] 입니다.</center>
							</div>
						</div>
			
				<input type="submit" style="background-color:#FD7401;height:60px;font-weight:bold;margin-bottom:30px" class="btn btn-primary form-control" value="돌아가기 ">
				</form>
		</div>
		<div class="col-log-3"></div>
		</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
	<%} %>
	
</html>