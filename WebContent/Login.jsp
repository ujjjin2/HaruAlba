<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Login</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<body style="background-color:#ffb955">

	<div class="parent" style="width: 100%; height: 1120px; background: #585858;">
	    <div class="background" style="background: #ffb955;"></div>
	    
	    <div class="center" style="background: #ffb955;">
	    	<div class="color_white" style="width: 70%; height:75%; background:#FFFFFF; margin: 3% 20% 17% 15%;box-shadow: 10px 10px 20px gray;">
				<div class="jumbotron jumbotron-fluid" style="background-color:#FFFFFF;width: 100%;height:100%; ">
				<center>
					<A href="Login.jsp">
						<img src="images/harulogo.png" style="margin: 6% 0 10% 0; width: 210px; height: 210px" >
					</A>
				</center>
				<form method="post" action="LoginAction.jsp" style="margin: 4% 17% 0 17%">
					<div class="form-group">
						<p style="line-height:1"></p>
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="25" style="height: 60px; font-size: 20px">
					</div>
					<div class="form-group"style="margin: 7% 0% 0 0%">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPASSWORD" maxlength="20" style="height: 60px;font-size: 20px">
				
					</div>
						<div style="float:right; margin: 10% 0 3% 0%">
						<a href="IdCheck.jsp" style="font-weight:bold;height:30px;font-size:12px;margin-right:10px;font-size: 17px">아이디 찾기</a>
							<a href="PassWordChange.jsp" style="font-weight:bold;height:30px;font-size:12px;font-size: 17px">비밀번호 변경</a>
						</div>
					<input type="submit" style="background-color:#FA4E29;height:60px;font-weight:bold; font-size: 25px" class="btn btn-primary form-control" value="로그인">
					</form>
					<hr style="background-color:#8C8C8C;border:none;width:60%%;height:2px; margin: 3% 17% 2% 17%;opacity: 0.6">
					<form method="post" action="ResisterAction.jsp" style="margin: 3% 17% 0 17%">
						<input type="submit" style="background-color:#FFFFFF;height:60px;border-color:#FA4E29;color:#FA4E29;font-weight:bold;border-width:medium;font-size: 25px" class="btn btn-primary form-control" value="회원가입">
					</form>
				</div>
			</div>
		</div>
			<!-- 흰색 부분 끝나는 div -->
	    
	    <div class="background" style="background: #ffb955"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>