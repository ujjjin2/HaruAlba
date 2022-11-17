<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% // 로그아웃 버튼 후 캐시 삭제

response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 

%>

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
    flex: 3;
    
}

.my-info{
	display: flex;
    flex-direction: column;
    margin: 0% 5% 0% 5%;
}

.my-info-title{
    padding: 24px 16px;
    border-bottom: 1px solid #000000;
}

.main-info{
	padding: 24px 16px 0px 16px;
}
#menu{
    float: right ;
    text-align: right;
    margin: 10px 30px 0 0;
}
#menu li{
    display: inline-block;
}
#top_menu li{
    margin: 5px 0 0 10px;
}
table{
	margin:auto;
	text-align: center;
}



</style>
<meta charset="UTF-8">
<title>마이페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body style="background-color:#525CDE">

<% //세션 설정 + 정보 없이 출입 시 다시 로그인으로 보냄

	String userid = (String)session.getAttribute("userid");

	if(session.getAttribute("userid")==null){ 
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href='Login.jsp'");   
        script.println("</script>");
	}
%>

	<div class="parent" style="width: 100%; height: 930px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>

	    <div class="center" style="background: #ffffff;">
			<div class="header"> 
				<center>
					<A href="Main.jsp">
						<img src="images/harulogo.png" style="width: 150px; height: 150px;">
					</A>
				</center>
			</div>
			<p>
			<!-- 노란색 부분  -->
			<div class="mainfunction" style="background:#FFF2BE; width: 100%; height: 100%;">
			<div class="my-info">
				<div class="my-info-title">
					내정보
				</div>
				<div class="main-info">
				<table>
					<colgroup>
						<col style="width: 120px;">
					</colgroup>
						<tbody>
							<tr>
								<th>이름</th>
								<td>손윤호</td>
							</tr>
							<tr class="space"></tr>										
							<tr>
								<th>위치</th>
								<td>인천</td>
							</tr>
							<tr class="space"></tr>	
							<tr>
								<th>나이</th>
								<td>21</td>
							</tr>
							<tr class="space"></tr>	
							<tr>
								<th>성별</th>
								<td>남자</td>
							</tr>
							<tr class="space"></tr>	
								<th>전화번호</th>
								<td>01012345678</td>
							</tr>
							<tr class="space"></tr>	
								<th>나의 평점</th>
								<td>5.0</td>
							</tr>
							
						</tbody>
					</table>
					</div>
			</div>
				<center>
	    			<div class="container" style="width: 85%; height: 50%;">
					<b style="float: left; margin: 5% 0 0 0;">나의 글</b>
					  <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:10% 0 1% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center">글번호</th>
					        <th style="text-align: center">제목</th>
					        <th style="text-align: center">일시</th>
					        <th style="text-align: center">작성자</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td onclick="location.href='Detail_PartTime.jsp'">1</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">자기PR</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">일</td>
							<td onclick="location.href='Detail_PartTime.jsp'">작성자</td>
					      </tr>
					    </tbody>
					  </table>
					</div>
	    		</center>
	   		</div>
			
	    </div>
	    
	    <div class="background" style="background: #525CDE;"></div>
	</div>
	
	
	
</body>
</html>