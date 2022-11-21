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
<title>IDCheck</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<!-- 2022-11-06 허유진 파란 배경색  -->
<body style="background-color:#525CDE">

<!-- 2022-11-06 허유진 헤더 부분  -->
	<div class="parent" style="width: 100%; height: 1145px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>
	    <div class="center" style="background: #FFF2BE;">
	    	<div class="color_white" style="width: 60%; height:80%; background:#FFFFFF; margin: 12% 20% 17% 20%;box-shadow: 7px 7px #9E9E9E;">
	    	<center>
					<A href="Login.jsp">
						<img src="images/harulogo.png" style="margin: 5% 0 5% 0; width: 150px; height: 150px">
					</A>
			</center>
				<div class="jumbotron jumbotron-fluid" style="background-color:#FFFFFF;padding-top:30px;height:70%;align:center; margin: 5% 10% 5% 10%">
					<form method="post" action="IdCheckResult.jsp">
						<div class="form-group" class="find-name">
							<p style="line-height:1;color:#525CDE;font-size:12px;margin-bottom:3%;font-size: 20px">이름</p>
							<input type="text" class="form-control" placeholder="이름"
							name="userNAME" maxlength="10" style="height: 50px; font-size: 20px">
						</div>
						<div class="form-group" class="find-phone" style="margin: 10% 0 40% 0">
							<p style="line-height:1;color:#525CDE;font-size:12px;margin-bottom:3%;font-size: 20px">전화번호</p>
							<input type="text" class="form-control" placeholder="-를 제외하고 작성"
								name="userPHONE" maxlength="20" style="height: 50px; font-size: 20px">
						</div>
			
				<input type="submit" style="background-color:#FA4E29;height:60px;font-weight:bold;margin-bottom:30px;font-size: 20px" class="btn btn-primary form-control" value="아이디찾기">
				<input type="button" style="background-color:#FA4E29;height:60px;font-weight:bold;margin-bottom:100px;font-size: 20px" class="btn btn-primary form-control" onclick="history.back()" value="취소">
				</form>
		</div>
			</div>
		</div>
			<!-- 흰색 부분 끝나는 div -->
	    
	    <div class="background" style="background: #525CDE;"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>