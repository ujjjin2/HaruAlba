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
.center_text{
	display: flex;
	margin: 10% 5% 10% 5%;
}
.background {
    flex: 1;
}
.center {
    flex: 3;
    
}

.header{
	margin: 0px 0 0 0px;
	width: 100%;
	height: 100%;
}

</style>
<meta charset="UTF-8">
<title>상세정보</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<!-- 파란색 배경 -->
<body style="background-color:#525CDE">
	
	<!-- 헤더 -->
	<div class="parent" style="width:100%; height: 930px;	background: #585858;">
		<div class="background" style="background: #525CDE;"></div>
		
		<!-- 노란색 -->
		<div class="center" style="background: #FFF2BE;">
		<!-- 흰색 -->
			<div class="center_write" style="width: 80%; height: 90%; background: #FFFFFF">
					<div class="header">
						<center>
							<a href="Main.jsp">
								<img src="images/harulogo.png" style="width: 150px; height: 150px;">
							</a>
						</center>
					</div>
				
			</div> <!-- 흰색 끝 --> 
			
			
		</div>
		<!--  노란색  -->
		
		<div class="background" style="background: #525CDE;"></div>
	
	</div>


</body>
</html>
