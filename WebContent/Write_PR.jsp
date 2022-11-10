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
	<div class="parent" style="width: 100%; height: 300%; background: #585858;">
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
								 <form action="Write_PR_Action.jsp" method="get">
								  <!-- 제목 div -->
								    <div class="form-group">
								      <label for="title" style="float: left; margin: 1% 0 2% 0 ">제목 </label>
								      <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title" >
								    </div>
								  <!-- 업직종 div -->
								     <div class="form-group">
								      <label for="category" style="float: left; margin: 1% 0 2% 0 ">업직종 </label>
								      <input type="text" class="form-control" id="category" placeholder="원하는 직종을 적어주세요" name="category" >
								    </div>
								  <!-- 시급  div -->
								    <div class="form-group">
								      <label for="pay" style="float: left; margin: 1% 0 2% 0 ">시급 </label>
								      <input type="text" class="form-control" id="pay" placeholder="원하시는 시급을 적어주세요" name="pay" >
								    </div>
								  <!-- 근무가능 요일  div -->
								    <div class="form-group" style="display: block;  width:100%; float: left">
								      <label for="date" style="float: left; margin: 2% 0 3% 0 ">근무 가능 요일 </label>
									      <div class="from-checkbox" >
										      <div class="checkbox" style="margin: 10% 0 0 0;">
											      <label style="margin: 0 5% 0 0"><input type="checkbox" value="월" name="checkbox">월</label>
											      <label style="margin: 0 5% 0 0"><input type="checkbox" value="화 " name="checkbox">화</label>
											      <label style="margin: 0 5% 0 0"><input type="checkbox" value="수 " name="checkbox">수</label>
											      <label style="margin: 0 5% 0 0"><input type="checkbox" value="목 " name="checkbox">목</label>
											      <label style="margin: 0 5% 0 0"><input type="checkbox" value="금 " name="checkbox">금</label>
											      <label style="margin: 0 5% 0 0"><input type="checkbox" value="토 " name="checkbox">토</label>
											      <label style="margin: 0 5% 0 0"><input type="checkbox" value="일 " name="checkbox">일</label>
											    </div>
										</div>
								    </div>
								    <!-- 자기 PR -->
								    <div class="form-group" style="display: inline-block;">
								      <label for="self_PR" style="float: left; margin: 1% 0 3% 0 ">자기 PR</label>
								      <textarea class="form-control" name="self_PR" rows="4" cols="100" placeholder="자기소개를 해주세요"></textarea> 
								    </div>
								     <!-- 간편 이력서 -->
								    <div class="form-group">
								      <label for="simpleresume" style="float: left; margin: 1% 0 3% 0 ">간편 이력서</label>
								      <textarea class="form-control" name="simpleresume" rows="4" cols="100" placeholder="지금까지 했던 경력을 적어주세요"></textarea>
								      
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