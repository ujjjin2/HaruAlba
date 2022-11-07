<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>EmployeeResister</title>
</head>
<body>
	<div class="container-fluid" style="background-color: #525CDE">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="jumbotron"
				style="background-color: #FFF2BE; padding-top: 30px; width: 100%; align: center">
				<center>
					<A href="Login.jsp">
						<img src="images/harulogo.png" style="width: 110px; height: 120px;">
					</A>
				</center>
				<div>
					<form style="display:inline;" method="post" action="EmployerAction.jsp">
						<div class="form-group" style="width:100%">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">아이디</p>
							<input type="text" class="form-control" placeholder="abcde"
								name="userID" maxlength="25">
						</div>
						<div class="form-group" style="width:100%">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">비밀번호</p>
							<input type="password" class="form-control" placeholder="******"
								name="userPASSWORD" maxlength="20">
						</div>
						<div class="form-group" style="width:100%;">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">이름</p>						
							<input type="text" class="form-control" placeholder="홍길동"
								name="userNAME" maxlength="20">
						</div>
						<div class="form-group" style="width:100%;">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">닉네임</p>
							<input type="text" class="form-control" placeholder="PINKIPPO"
								name="userNICKNAME" maxlength="20">
						</div>
							<div class="form-group" style="width:100%;">
								<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">지역 & 성별</p>
            					<select name="userLOCATION" style="width:200px;height:40px;color:gray" >
               						<option selected disabled>지역을 선택하세요.</option>
                					<option value="서울">서울</option>
                					<option value="인천">인천</option>
               						<option value="경기">경기</option>
            					</select>	
                    			<div class ="btn-group" style="padding:0 0 0 20px" class ="btn-group">
                    				<label class ="btn btn-primary active">
                    					<input type ="radio" name ="userGENDER"  style="background-color:gray;accent-color:#525CDE" autocomplete ="off" value ="남자" checked>남자</label>
                    				<label class ="btn btn-primary">
                    					<input type ="radio" name ="userGENDER"  style="background-color:gray;accent-color:#525CDE" autocomplete ="off" value ="여자" checked>여자</label>
								</div>
							</div>
						<div class="form-group" style="width:100%;">
							<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">전화번호</p>
							<input type="text" class="form-control" placeholder="-를 제외하고 작성"
								name="userPHONE" maxlength="20">
						</div>
						<div class="form-group" style="width:100%;">
						<p style="line-height:1;color:gray;font-size:12px;margin-bottom:0;">나이 </p>
								<input type="text" class="form-control" placeholder="나이"
								name="userAGE" maxlength="5" style="width:60px;height:30px">
						</div>						
					<input type="submit" style="background-color:#FD7401;height:60px;font-size:16px;width:100%" class="btn btn-primary form-control" value="회원가입">
					</form>
				</div>
			</div>
		</div>
		<div class="col-log-3"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>