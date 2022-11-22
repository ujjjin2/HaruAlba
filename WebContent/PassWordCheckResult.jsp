<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<style type="text/css">
.parent {
    display: flex;
}
.background {
    flex: 1;
} 
.center {
    flex: 2;
    
}
.header{
	margin: 80px 0 0 0px;
}
*{
	font-family: 'Jua', sans-serif;
}


</style>
<meta charset="UTF-8">
<title>IDCheckResult</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<!-- 2022-11-06 허유진 파란 배경색  -->
<body style="background-color:#525CDE">
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
<!-- 2022-11-06 허유진 헤더 부분  -->
	<div class="parent" style="width: 100%; height: 1145px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>
	    
	    <div class="center" style="background: #FFF2BE;">
	    	<div class="color_white" style="width: 60%; height:75%; background:#FFFFFF; margin: 15% 20% 17% 20%;box-shadow: 7px 7px #9E9E9E;">
				<div class="jumbotron jumbotron-fluid" style="background-color:#FFFFFF;padding-top:30px;height:100%;align:center;">
					<center>
						<A href="Login.jsp">
							<img src="images/harulogo.png" style="margin: 5% 0 7% 0; width: 200px; height: 200px">
						</A>
					</center>
					<form method="post" action="Login.jsp">
						<div class="form-group" style="margin: 8% 5% 10% 5%">
							<div style="background-color:#FFFFFF;padding:75px 0;border-style:solid;border-color:#525CDE;height:200px;font-weight:bold;text-align:center;margin-bottom:30px">
								<center style="font-size:22px;">비밀번호는 [ <%= userpw %> ] 입니다.</center>
							</div>
							
							
							<input type="submit" style="background-color:#FA4E29;height:60px;font-weight:bold; margin:25% 30% 0 0%;font-size: 20px"
							 class="btn btn-primary form-control" value="돌아가기 ">
						</div>
			
				</form>
			</div>
		</div>
			<!-- 흰색 부분 끝나는 div -->
	    </div>
	    <div class="background" style="background: #525CDE;"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<%} %>
</body>
</html>