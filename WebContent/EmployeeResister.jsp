<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>EmployeeResister</title>
</head>
<body>
	<div class="container-fluid" style="background-color: #525CDE">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="jumbotron"
				style="background-color: #FFF2BE; padding-top: 30px; width: 100%; align: center">
				<center>
					<A href="Login.jsp">
						<img src="images/harulogo.png" style="width: 110px; height: 120px;">
					</A>
				</center>
				<div>
					<form style="display:inline;" method="post" action="Login.jsp">
						<div class="form-group" style="width:100%">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">아이디</p>
							<input type="text" class="form-control" placeholder="ID"
								name="userID" maxlength="25">
						</div>
						<div class="form-group" style="width:100%">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">비밀번호</p>
							<input type="password" class="form-control" placeholder="PassWord"
								name="userPASSWORD" maxlength="20">
						</div>
						<div class="form-group" style="width:100%;">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">이름</p>						
							<input type="text" class="form-control" placeholder="Name"
								name="userNAME" maxlength="20">
						</div>
						<div class="form-group" style="width:100%;">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">지역</p>
							<input type="text" class="form-control" placeholder="Adress"
								name="userLOCATION" maxlength="20">
						</div>
						<div class="form-group" style="width:100%;">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">나이</p>
							<input type="text" class="form-control" placeholder="Age"
								name="userAGE" maxlength="20">
						</div>
						<div class="form-group" style="width:100%;">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">전화번호</p>
							<input type="text" class="form-control" placeholder="000-0000-0000"
								name="userPHONE" maxlength="20">
						</div>
					<input type="submit" style="background-color:#FD7401;height:60px;font-size:16px;width:100%" class="btn btn-primary form-control" value="회원가입">
					</form>
				</div>
			</div>
		</div>
		<div class="col-log-3"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="Resister.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>