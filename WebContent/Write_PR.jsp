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
	margin: 30px 0 30px 0px;
	width: 100%;
	height:100%; 
}
.btn{
	background: #FA4E29;
	color: #FFFFFF;
	width: 60%;
	height: 5%;
	margin-top: 3%;
}


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
				<div class="center_write" style="width: 80%; height:90%; background:#FFFFFF;">
				<!-- 공간을 나눠줘야지만 그림의 센터값이 먹음/ 안하면 세로로 배치가 되서 왼쪽에만 붙어있음 -->
					<div class="header">
						<center>
							<a href="Main.jsp">
								<img src="images/harulogo.png" style="width: 150px; height: 150px;">
							</a>
						</center>
						<center>
							<div style="width: 80%; height: 80%; margin-top: 3%">
								 <form action="TotalTable_PR">
								    <div class="form-group">
								      <label for="title" style="float: left; margin: 1% 0 3% 0 ">제목 </label>
								      <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title" >
								    </div>
								    <div class="form-group">
								      <label for="self_PR" style="float: left; margin: 1% 0 3% 0 ">자기 PR</label>
								      <textarea class="form-control" name="self_PR" rows="7" cols="100" placeholder="자기소개를 해주세요"></textarea>
								      
								    </div>
								    <div class="form-group">
								      <label for="simpleresume" style="float: left; margin: 1% 0 3% 0 ">간편 이력서</label>
								      <textarea class="form-control" name="simpleresume" rows="7" cols="100" placeholder="지금까지 했던 경력을 적어주세요"></textarea>
								      
								    </div>
								    
								     
								    <button type="submit" class="btn">글쓰기</button>
								  </form>
							</div>
						</center>
					</div>
				</div>
			
			
			<!-- 흰색 부분 끝나는 div -->
	    </div>
	    
	    <div class="background" style="background: #525CDE;"></div>
	</div>
	
	
	
</body>
</html>