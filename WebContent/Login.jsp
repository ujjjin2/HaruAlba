<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>Login</title>
</head>
<body style="background-color:#525CDE">
	<div class="container-fluid" style="background-color:#525CDE">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="jumbotron jumbotron-fluid" style="background-color:#FFF2BE;padding-top:30px;height:100%;align:center">
				<center>
					<A href="Login.jsp">
						<img src="images/harulogo.png">
					</A>
				</center>
				<form method="post" action="LoginAction.jsp">
					<div class="form-group">
						<p style="line-height:1"></p>
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="25">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPASSWORD" maxlength="20">
				
					</div>
						<div style="float:right">
							<A href="PassWordCheck.jsp" style="font-weight:bold;height:30px;font-size:12px;">비밀번호 찾기</A>
						</div>
					<input type="submit" style="background-color:#FD7401;height:60px;font-weight:bold" class="btn btn-primary form-control" value="로그인">
					</form>
					<hr style="background-color:gray;border:none;width:100%;height:2px;">
					<form method="post" action="ResisterAction.jsp">
						<input type="submit" style="background-color:#FFF2BE;height:60px;border-color:#FD7401;color:#FD7401;font-weight:bold;border-width:medium" class="btn btn-primary form-control" value="회원가입">
					</form>
			</div>
		</div>
		<div class="col-log-3"></div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>