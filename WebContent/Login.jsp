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
	<div class="container" style="background-color:#525CDE">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="background-color:#FFF2BE""padding-top:20px;"  >
				<img src="images/harulogo.png" >
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="25">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPASSWORD" maxlength="20">
					</div>
					<input type="submit" style="background-color:#FD7401" class="btn btn-primary form-control" value="로그인">
					</form>
					<p>
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