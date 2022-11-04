<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>LOGIN</title>
</head>
<body>
	<div class="container-fluid" style="background-color:#525CDE">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="background-color:#FFF2BE;padding-top:30px;width:100%;align: center">
				<img src="images/harulogo.png" style="text-align: center;">
				<form method="post" action="loginAction.jsp">
					<div class="form-group">
						<p></p>
						<p style="color:gray;font-weight:400;font-size:16px;lint-height:24px;line-height:30%">Id</p>
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="25">
					</div>
					<div class="form-group">
						<p style="color:gray;font-weight:400;font-size:16px;lint-height:24px;line-height:30%">Password</p>
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPASSWORD" maxlength="20">
					</div>
					<input type="submit" style="background-color:#FD7401" class="btn btn-primary form-control" value="로그인">
					</form>
					<hr style="background-color:#525CDE;border:none;width:100%;height:2px;">
					<form method="post" action="register.jsp">
						<input type="submit" style="background-color:#FD7401" class="btn btn-primary form-control" value="회원가입">
					</form>
			</div>
		</div>
		<div class="col-log-4"></div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>