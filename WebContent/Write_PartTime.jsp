<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ArrayAllocationExpression"%>
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
								 <form action="Write_PR_Action.jsp" method="get" accept-charset="utf8">
								  <!-- 제목 div -->
								    <div class="form-group">
								      <label for="title" style="float: left; margin: 1% 0 2% 0 ">제목 </label>
								      <input type="text" class="form-control" id="ptTITLE" placeholder="제목을 입력해주세요" name="ptTITLE" >
								    </div>
								  <!-- 매장정보 div -->
								     <div class="form-group">
								      <label for="category" style="float: left; margin: 1% 0 2% 0 ">매장정보 </label>
								      <input type="text" class="form-control" id="ptINFO" placeholder="매장정보를 적어주세요" name="ptINFO" >
								    </div>
								   <!-- 역할 div -->
								     <div class="form-group">
								      <label for="category" style="float: left; margin: 1% 0 2% 0 ">역할</label>
								      <input type="text" class="form-control" id="ptROLE" placeholder="역할을 적어주세요" name="ptROLE" >
								    </div>
								   <!-- 일시 div -->
								     <div class="form-group">
								      <label for="category" style="float: left; margin: 1% 0 2% 0 ">일시 </label>
								      <div style="display: inline;">
								      	<input type="date" id="ptSDay" value="2022-11-14" style="width: 80%; height: 5%; position: relative;">
								      	<input type="date" id="ptEDay" value="2022-11-14" style="width: 80%; height: 5%; position: relative;">
								      </div>
								    </div>
								  <!-- 시급  div -->
								    <div class="form-group">
								      <label for="pay" style="float: left; margin: 1% 0 2% 0 ">시급 </label>
								      <input type="text" class="form-control" id="prMONEY" placeholder="시급을 적어주세요" name="prMONEY" >
								    </div>
								   <!-- 지급방법 div -->
								     <div class="form-group">
								      <label for="category" style="float: left; margin: 1% 0 1% 0 ">지급 방법 </label>
								     <div>
								      <select style="width: 100%;height: 2%">
								      		<option>당일 지급</option>
								      		<option>추후 지급</option>
								      </select>
								    </div>
								   <!-- 모집중 div -->
								     <div class="form-group">
								      <label for="category" style="float: left; margin: 1% 0 1% 0 ">모집상황 </label>
								     <div>
								      <select style="width: 100%;height: 10%">
								      		<option>모집중</option>
								      		<option>모집 완료</option>
								      </select>
								      
								    </div>
								    <!-- 내용 -->
								    <div class="form-group" style="display: inline-block;">
								      <label for="self_PR" style="float: left; margin: 3% 0 3% 0 ">매장 업무 관련 내용</label>
								      <textarea class="form-control" name="ptCONTENT" id="ptCONTENT" rows="4" cols="100" placeholder="내용을 입력해주세요"></textarea> 
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