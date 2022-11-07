<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.parent{
    display: flex;
}
.center_write{
    display: flex;
    margin: 5% 10% 5% 10%;
}
.background {
    flex: 1;
}
.center {
    flex: 3;
    
}

.header{
	margin: 0px 0 0 0px;
	



</style>
<meta charset="UTF-8">
<title>글쓰기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<!-- 2022-11-06 허유진 파란 배경색  -->
<body style="background-color:#525CDE">

<!-- 2022-11-06 허유진 헤더 부분  -->
	<div class="parent" style="width: 100%; height: 930px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>
	    
	    <!-- 2022-11-06 허유진 헤더 부분의 흰색 센터 부분 -->
	    <div class="center" style="background: #FFF2BE;">
				<div class="center_write" style="width: 80%; height:90%; background:#FFFFFF">
					<div class="header"> 
						<center>
							<A href="Main.jsp">
								<img src="images/harulogo.png" style="width: 150px; height: 150px;">
							</A>
						</center>
					</div>
				</div>
			
			
			<!-- 흰색 부분 끝나는 div -->
	    </div>
	    
	    <div class="background" style="background: #525CDE;"></div>
	</div>
	
	
	
</body>
</html>