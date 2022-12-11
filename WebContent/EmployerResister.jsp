<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>EmployerResister</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<!--파란 배경색  -->
<body style="background-color:#525CDE">

	<div class="parent" style="width: 100%; height: 1145px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>
	    
	    <!-- 노란새센터 부분 -->
	    <div class="center" style="background: #FFF2BE;">
	    		<center>
					<A href="Login.jsp">
						<img src="images/harulogo.png" style="width: 15%; height: 15%; margin: 3% 0 3% 0">
					</A>
				</center>
			<div class="color_white" style="width: 80%; height:73%; background:#FFFFFF; margin: 0% 10% 10% 10%;">
				<div class="jumbotron"
				style="background-color: #FFFFFF; padding-top: 30px; width: 100%; align: center">
				<div>
					<form style="display:inline;" method="post" action="EmployerAction.jsp">
						<div class="form-group" style="width:80%; margin:5% 10% 2% 10%">
							<p style="line-height:1;color:#525CDE;;font-size:20px;margin-bottom:2%;"><b>아이디</b></p>
							<input type="text" class="form-control" placeholder="abcde" 
								name="userID" maxlength="25" style="font-size: 20px; height: 5%;">
						</div>
						<div class="form-group" style="width:80%;  margin:3% 10% 2% 10%">
							<p style="line-height:1;color:#525CDE;font-size:20px;margin-bottom:2%;"><b>비밀번호</b></p>
							<input type="password" class="form-control" placeholder="******"
								name="userPASSWORD" maxlength="20" style="font-size: 20px; height: 5%">
						</div>
						<div class="form-group" style="width:80%;  margin:3% 10% 2% 10%">
							<p style="line-height:1;color:#525CDE;font-size:20px;margin-bottom:2%;"><b>이름</b></p>						
							<input type="text" class="form-control" placeholder="홍길동"
								name="userNAME" maxlength="20"  style="font-size: 20px; height: 5%">
						</div>
						<div class="form-group" style="width:80%;  margin:3% 10% 2% 10%">
							<p style="line-height:1;color:#525CDE;font-size:20px;margin-bottom:2%;"><b>닉네임</b></p>
							<input type="text" class="form-control" placeholder="PINKIPPO"
								name="userNICKNAME" maxlength="20" style="font-size: 20px; height: 5%">
						</div>
							<div class="form-group" style="width:80%;  margin:3% 10% 2% 10%">
								<p style="line-height:1;color:#525CDE;font-size:20px;margin-bottom:2%;"><b>지역 & 성별</b></p>
            					<select name="userLOCATION" style="width:200px;height:40px;color:gray" >
               						<option selected disabled>지역을 선택하세요.</option>
                					<option value="서울">서울</option>
                					<option value="인천">인천</option>
               						<option value="경기">경기</option>
            					</select>	
                    			<div class ="btn-group" style="padding:0 0 0 20px" class ="btn-group">
                    				<label class ="btn btn-primary active">
                    					<input type ="radio" name ="userGENDER"  style="background-color:gray;accent-color:#525CDE;width: 30px " autocomplete ="off" value ="남자" checked>남자</label>
                    				<label class ="btn btn-primary">
                    					<input type ="radio" name ="userGENDER"  style="background-color:gray;accent-color:#525CDE; width: 30px" autocomplete ="off" value ="여자" checked>여자</label>
								</div>
							</div>
						<div class="form-group" style="width:80%;  margin:3% 10% 2% 10%">
							<p style="line-height:1;color:#525CDE;font-size:20px;margin-bottom:2%;"><b>전화번호</b></p>
							<input type="text" class="form-control" placeholder="-를 제외하고 작성"
								name="userPHONE" maxlength="20" style="font-size: 20px; height: 5%">
						</div>
						<div class="form-group" style="width:100%;  margin:3% 10% 2% 10%">
						<p style="line-height:1;color:#525CDE;font-size:20px;margin-bottom:2%;"><b>나이</b> </p>
								<input type="text" class="form-control" placeholder="나이"
								name="userAGE" maxlength="5" style="width:10%; font-size: 20px; height: 5%">
						</div>						
					<input type="submit" style="background-color:#FA4E29;height:60px;font-size:16px;width:80%;margin:2% 10% 0% 10%;font-size: 20px" class="btn btn-primary form-control" value="회원가입">
					</form>
				</div>
			</div>
			</div>
	    </div>
	    
	    <div class="background" style="background: #525CDE;"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>