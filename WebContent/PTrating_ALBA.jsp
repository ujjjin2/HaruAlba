<%@page import="com.mysql.cj.protocol.a.NativeConstants.IntegerDataType"%>
<%@page import="pt.PtDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pt" class="pt.Pt" scope="page"></jsp:useBean>
<jsp:setProperty name="pt" property="ptTITLE"/>
<jsp:setProperty name="pt" property="ptROLE"/>
<jsp:setProperty name="pt" property="ptMONEY"/>
<jsp:setProperty name="pt" property="userID"/>
<jsp:setProperty name="pt" property="ptID"/>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="css/rating.css">
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
					<A href="Main.jsp">
						<img src="images/harulogo.png" style="margin: 5% 0 5% 0; width: 150px; height: 150px">
					</A>
			</center>
				<div class="jumbotron jumbotron-fluid" style="background-color:#FFFFFF;padding-top:30px;height:70%;align:center; margin: 5% 10% 5% 10%">
					<form method="post" action="PTratingAction_ALBA.jsp">
						
			<!-- 평점 주는 별점 모양 -->
<div>
1. 사장님이 친절한가요?
<div class="star-rating space-x-4 mx-auto">
	<input type="radio" id="5-stars" name="RATE1" value=5 v-model="ratings"/>
	<label for="5-stars" class="star pr-4">★</label>
	<input type="radio" id="4-stars" name="RATE1" value=4 v-model="ratings"/>
	<label for="4-stars" class="star">★</label>
	<input type="radio" id="3-stars" name="RATE1" value=3 v-model="ratings"/>
	<label for="3-stars" class="star">★</label>
	<input type="radio" id="2-stars" name="RATE1" value=2 v-model="ratings"/>
	<label for="2-stars" class="star">★</label>
	<input type="radio" id="1-star" name="RATE1" value=1 v-model="ratings" />
	<label for="1-star" class="star">★</label>
</div>
</div>
<div>
2. 알바 시간은 합의된 내용과 같았나요?
<div class="star-rating space-x-4 mx-auto">
	<input type="radio" id="10-stars" name="RATE2" value=5 v-model="ratings"/>
	<label for="10-stars" class="star pr-4">★</label>
	<input type="radio" id="9-stars" name="RATE2" value=4 v-model="ratings"/>
	<label for="9-stars" class="star">★</label>
	<input type="radio" id="8-stars" name="RATE2" value=3 v-model="ratings"/>
	<label for="8-stars" class="star">★</label>
	<input type="radio" id="7-stars" name="RATE2" value=2 v-model="ratings"/>
	<label for="7-stars" class="star">★</label>
	<input type="radio" id="6-star" name="RATE2" value=1 v-model="ratings" />
	<label for="6-star" class="6-star">★</label>
</div>
</div>
<div>
3. 시급은 제대로 지급 받았나요?
<div class="star-rating space-x-4 mx-auto">
	<input type="radio" id="15-stars" name="RATE3" value=5 v-model="ratings"/>
	<label for="15-stars" class="star pr-4">★</label>
	<input type="radio" id="14-stars" name="RATE3" value=4 v-model="ratings"/>
	<label for="14-stars" class="star">★</label>
	<input type="radio" id="13-stars" name="RATE3" value=3 v-model="ratings"/>
	<label for="13-stars" class="star">★</label>
	<input type="radio" id="12-stars" name="RATE3" value=2 v-model="ratings"/>
	<label for="12-stars" class="star">★</label>
	<input type="radio" id="11-star" name="RATE3" value=1 v-model="ratings" />
	<label for="11-star" class="star">★</label>
</div>
</div>
<div>
4. 다음에도 해당 공고가 올라왔을때 이용할 것인가요?
<div class="star-rating space-x-4 mx-auto">
	<input type="radio" id="20-stars" name="RATE4" value=5 v-model="ratings"/>
	<label for="20-stars" class="star pr-4">★</label>
	<input type="radio" id="19-stars" name="RATE4" value=4 v-model="ratings"/>
	<label for="19-stars" class="star">★</label>
	<input type="radio" id="18-stars" name="RATE4" value=3 v-model="ratings"/>
	<label for="18-stars" class="star">★</label>
	<input type="radio" id="17-stars" name="RATE4" value=2 v-model="ratings"/>
	<label for="17-stars" class="star">★</label>
	<input type="radio" id="16-star" name="RATE4" value=1 v-model="ratings" />
	<label for="16-star" class="star">★</label>
</div>
</div>

	<input type="hidden" value="<%= pt.getUserID()%>" name="userID"> <!-- 알바가 사장한테 평점 줄 때 -->
	<input type="hidden" value="<%= pt.getPtID() %>" name="ptID">
				<input type="submit" style="background-color:#FA4E29;height:60px;font-weight:bold;margin-bottom:30px;font-size: 20px" class="btn btn-primary form-control" value="평점 기입하기">
				<input type="button" style="background-color:#FA4E29;height:60px;font-weight:bold;margin-bottom:100px;font-size: 20px" class="btn btn-primary form-control" onclick="history.back()" value="돌아가기">
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