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
<% request.setCharacterEncoding("UTF-8"); %>

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
*{
	font-family: 'Jua', sans-serif;
}

</style>


<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>글쓰기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body style="background-color:#ffb955">


	<div class="parent" style="width: 100%; height: 300%; background: #585858;">
	    <div class="background" style="background: #ffb955;"></div>
	    
	    <div class="center" style="background: #ffb955;">
				<div class="center_write" style="width: 80%; height:90%; background:#FFFFFF;box-shadow: 10px 10px 20px gray;">
					<div class="header">
						<center>
							<a href="Main.jsp">
								<img src="images/harulogo.png" style="width: 150px; height: 150px;">
							</a>
						</center>
						<center>
							<div style="width: 80%; height: 80%; margin-top: 3%">
								 <form action="Write_PartTime_Action.jsp" method="get" accept-charset="utf8">
								  <!-- 제목 div -->
								    <div class="form-group">
								      <label for="title" style="float: left; margin: 1% 0 2% 0;font-size: 18px;color:#525CDE">제목 </label>
								      <input type="text" class="form-control" id="ptTITLE" placeholder="제목을 입력해주세요" name="ptTITLE" >
								    </div>
								  <!-- 매장정보 div -->
								     <div class="form-group">
								      <label for="category" style="float: left; margin: 1% 0 2% 0;font-size: 18px;color:#525CDE">매장정보 </label>
								      <input type="text" class="form-control" id="ptINFO" placeholder="매장정보를 적어주세요" name="ptINFO" >
								    </div>
								   <!-- 역할 div -->
								     <div class="form-group">
								      <label for="category" style="float: left; margin: 1% 0 2% 0;font-size: 18px;color:#525CDE">역할</label>
								      <input type="text" class="form-control" id="ptROLE" placeholder="역할을 적어주세요" name="ptROLE" >
								    </div>
								   <!-- 일시 div -->
								     <div class="form-group">
								      <label for="date" style="float: left; margin: 1% 0 2% 0;font-size: 18px;color:#525CDE">일시 </label>
								      <div class="form-date" style="display: inlin-block;">
								      	<input type="date" name="ptSDAY" value="시작일" style="width: 100%; height: 5%;">
								      	<input type="date" name="ptEDAY" value="종료일" style="width: 100%; height: 5%;">
								      </div>
								    </div>
								  <!-- 시급  div -->
								    <div class="form-group">
								      <label for="pay" style="float: left; margin: 1% 0 2% 0;font-size: 18px;color:#525CDE">시급 </label>
								      <input type="text" class="form-control" placeholder="시급을 적어주세요" name="ptMONEY" >
								    </div>
								   <!-- 지급방법 div -->
								     <div class="form-group" style="height: ">
								      <label for="category" style="float: left; margin: 1% 0 2% 0;font-size: 18px;color:#525CDE">지급 방법 </label>
								     <div>
								      <select style="width: 100%;height: 30px; font-size: 17px" name="ptGIVE">
								      		<option>당일 지급</option>
								      		<option>추후 지급</option>
								      </select>
								    </div>
								   <!-- 모집중 div -->
								     <div class="form-group">
								      <label for="category" style="float: left; margin: 2% 0 2% 0;font-size: 18px;color:#525CDE">모집상황 </label>
								     <div>
								      <select style="width: 100%;height: 30px; font-size: 17px" name="ptSTATE">
								      		<option>모집중</option>
								      		<option>마감</option>
								      </select>
								      
								    </div>
								    <!-- 내용 -->
								    <div class="form-group" style="display: inline-block;">
								      <label for="self_PR" style="float: left; margin: 3% 0 1% 0;font-size: 18px;color:#525CDE">매장 업무 관련 내용</label>
								      <textarea class="form-control" name="ptCONTENT" id="ptCONTENT" rows="4" cols="1000" placeholder="내용을 입력해주세요" style="font-size: 18px"></textarea> 
								    </div>
								    <button type="submit" class="btn" style="font-size: 20px;width: 100%;margin-bottom: 20px">글쓰기</button>
								  </form>
							</div>
						</center>
					</div>
				</div>
			
			
			<!-- 흰색 부분 끝나는 div -->
	    </div>
	    
	    <div class="background" style="background: #ffb955;"></div>
	</div>
	
	
	
</body>
</html>