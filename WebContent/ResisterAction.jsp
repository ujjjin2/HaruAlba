<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>LoginAction</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
*{
	font-family: 'Jua', sans-serif;
}
.parent {
    display: flex;
}
.background {
    flex: 1;
} 
.center {
    flex: 3;
    
}
.header{
	margin: 80px 0 0 0px;
}
</style>
</head>
<body style="background-color:#525CDE">

	<div class="parent" style="width: 100%; height: 1200px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>
	    
	    
	    <div class="center" style="background: #FFF2BE;">
				<div class="jumbotron"
				style="background-color: #FFF2BE; padding-top: 30px; width: 100%; align: center">
				<center>
					<A href="Login.jsp">
					<img src="images/harulogo.png" style="width: 200px; height: 200px;">
					</A>
				</center>
				<div>
				<form style="display:inline;" method="post" action="EmployerResister.jsp" >
						<center>
							<button type="submit" 
								style="background-color: #FEFFF2; width:40%; height: 800px;border:0;border-radius:30px;  margin: 5% 8% 0 0">
									<img src="images/employer.png" style="width: 225px; height: 225px;">
									<p style="font-size:40px;line-height:45px;text-align:center"><b>사장님</b></p>
							</button>
				</form>
				<form style="display:inline;" method="post" action="EmployeeResister.jsp">
							<button type="submit" 
								style="background-color: #FEFFF2; width: 40%; height: 800px;border:0;border-radius:30px">
									<img src="images/employee.png" style="width: 200px; height: 200px;">
									<p style="font-size:40px;line-height:45px;text-align:center; margin: 10px 0 0 0"><b>아르바이트생</b></p>
							</button>
						</center>
					
				</form>
				</div>
			</div>
			
			<!-- 흰색 부분 끝나는 div -->
	    </div>
	    
	    <div class="background" style="background: #525CDE;"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>