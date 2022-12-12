<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
<body style="background-color:#ffb955">
<%
	request.setCharacterEncoding("UTF-8");

	String userID = request.getParameter("userID");
	String userPHONE = request.getParameter("userPHONE");
	String userNAME = request.getParameter("userNAME");
	String userPASSWORD = null;
		
	UserDAO userDAO = new UserDAO();	
	String userpw = userDAO.findPW(userID, userPHONE, userNAME); //아이디를 디비에서 가져옴
	
	if(userpw ==null){
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유저 정보가 잘못되었습니다.')");
        script.println("history.back()");    // 이전 페이지로 사용자를 이동
        script.println("</script>");
	}else{
	
	%>
<!-- 2022-11-06 허유진 헤더 부분  -->
	<div class="parent" style="width: 100%; height: 1120px; background: #585858;">
	    <div class="background" style="background: #ffb955;"></div>
	    
	    <div class="center" style="background: #ffb955;">
	    	<div class="color_white" style="width: 70%; height:75%; background:#FFFFFF; margin: 3% 20% 17% 15%;box-shadow: 10px 10px 20px gray;">
				<div class="jumbotron jumbotron-fluid" style="background-color:#FFFFFF;padding-top:30px;height:100%;align:center;">
					<center>
						<A href="Login.jsp">
							<img src="images/harulogo.png" style="margin: 5% 0 3% 0; width: 200px; height: 200px">
						</A>
					</center>
					<form method="post" action="PassWordChangeAction.jsp">
						<div class="form-group" style="margin: 8% 5% 3% 5%">
		                    <div class="form-group" style="width:80%;  margin:3% 10% 2% 10%">
						 		<p style="line-height:1;color:#525CDE;font-size:20px;margin-bottom:2%;"><b>새로운 비밀번호를 입력해주세요.</b></p>
								<input type="password" class="form-control" placeholder="******"
								name="userPASSWORD" id="userPASSWORD"maxlength="20" style="font-size: 20px; height: 5%;margin-bottom:5%;">
								<p style="line-height:1;color:#525CDE;font-size:20px;margin-bottom:2%;"><b>비밀번호 확인</b></p>
								<input type="password" class="form-control" placeholder="******"
								name="userPASSWORD2" id="userPASSWORD2" maxlength="20" style="font-size: 20px; height: 5%">
								<input type="hidden" name="userID" value="<%=userID%>">
								
							    <input type="submit" style="background-color:#FA4E29;height:60px;font-weight:bold; margin:55% 30% 0 0%;font-size: 20px"
							    class="btn btn-primary form-control" value="비밀번호 변경하기 ">
					        </div>				
						</div>
				</form>
			</div>
		</div>
			<!-- 흰색 부분 끝나는 div -->
	    </div>
	    <div class="background" style="background: #ffb955;"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<%} %>
</body>
</html>