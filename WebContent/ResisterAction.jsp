<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>LoginAction</title>
</head>
<body>
	<div class="container-fluid" style="background-color: #525CDE">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div class="jumbotron"
				style="background-color: #FFF2BE; padding-top: 30px; width: 100%; align: center">
				<center>
					<A href="Login.jsp">
					<img src="images/harulogo.png" style="width: 130px; height: 140px;">
					</A>
				</center>
				<div>
				<form style="display:inline;" method="post" action="EmployerResister.jsp">
						<center>
							<button type="submit" 
								style="background-color: #FEFFF2; width: 310px; height: 380px;border:0;border-radius:30px">
									<img src="images/employer.png">
									<p style="font-size:30px;line-height:45px;text-align:center">사장님</p>
							</button>
				</form>
				<form style="display:inline;" method="post" action="EmployeeResister.jsp">
							<button type="submit" 
								style="background-color: #FEFFF2; width: 310px; height: 380px;border:0;border-radius:30px">
									<img src="images/employee.png">
									<p style="font-size:30px;line-height:45px;text-align:center">아르바이트생</p>
							</button>
						</center>
					
				</form>
				</div>
			</div>
		</div>
		<div class="col-log-2"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>