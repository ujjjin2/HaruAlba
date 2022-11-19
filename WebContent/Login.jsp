<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    flex: 3;
    
}
.header{
	margin: 80px 0 0 0px;
}



</style>
<meta charset="UTF-8">
<title>Login</title>

</head>

<!-- 2022-11-06 허유진 파란 배경색  -->
<body style="background-color:#525CDE">

<!-- 2022-11-06 허유진 헤더 부분  -->
	<div class="parent" style="width: 100%; height: 1200px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>
	    
	    <!-- 2022-11-06 허유진 헤더 부분의 흰색 센터 부분 -->
	    <div class="center" style="background: #FFF2BE;">
				<div class="jumbotron jumbotron-fluid" style="background-color:#FFF2BE;width: 100%;height:100%; ">
				<center>
					<A href="Login.jsp">
						<img src="images/harulogo.png" style="margin: 10% 0 5% 0; width: 260px; height: 260px" >
					</A>
				</center>
				<form method="post" action="LoginAction.jsp" style="margin: 4% 10% 0 10%">
					<div class="form-group">
						<p style="line-height:1"></p>
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="25" style="height: 60px; font-size: 20px">
					</div>
					<div class="form-group"style="margin: 5% 0% 0 0%">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPASSWORD" maxlength="20" style="height: 60px;font-size: 20px">
				
					</div>
						<div style="float:right; margin: 10% 0 3% 0%">
						<a href="IdCheck.jsp" style="font-weight:bold;height:30px;font-size:12px;margin-right:10px;font-size: 15px">아이디 찾기</a>
							<a href="PassWordCheck.jsp" style="font-weight:bold;height:30px;font-size:12px;font-size: 15px">비밀번호 찾기</a>
						</div>
					<input type="submit" style="background-color:#FD7401;height:60px;font-weight:bold" class="btn btn-primary form-control" value="로그인">
					</form>
					<hr style="background-color:#858697;border:none;width:80%;height:2px; margin: 3% 0 2% 10%">
					<form method="post" action="ResisterAction.jsp" style="margin: 3% 10% 0 10%">
						<input type="submit" style="background-color:#FFF2BE;height:60px;border-color:#FD7401;color:#FD7401;font-weight:bold;border-width:medium" class="btn btn-primary form-control" value="회원가입">
					</form>
			</div>
			
			<!-- 흰색 부분 끝나는 div -->
	    </div>
	    
	    <div class="background" style="background: #525CDE;"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>