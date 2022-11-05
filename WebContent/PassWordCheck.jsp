<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>PassWordCheck</title>
</head>
<body>
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
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">아이디</p>
							<input type="text" class="form-control" placeholder="ID"
							name="userID" maxlength="25">
						</div>
						<div class="form-group">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">전화번호</p>
							<input type="text" class="form-control" placeholder="000-0000-0000"
							name="userPHONE" maxlength="20">
						</div>
			
				<input type="submit" style="background-color:#FD7401;height:60px;font-weight:bold;margin-bottom:100px" class="btn btn-primary form-control" value="비밀번호찾기">
		</div>
		<div class="col-log-3"></div>
		</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>