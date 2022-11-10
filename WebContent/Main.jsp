<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
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
.header{
	margin: 80px 0 0 0px;
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
<title>메인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<!-- 2022-11-06 허유진 파란 배경색  -->
<body style="background-color:#525CDE">

<% //세션 설정 + 정보 없이 출입 시 다시 로그인으로 보냄 and 사장님일 경우 다른 페이지 이동
	String userid = (String)session.getAttribute("userid");
	String role = (String)session.getAttribute("role");

	if(session.getAttribute("userid")==null){ 
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href='Login.jsp'");    
        script.println("</script>");
	}
	
	if(role.equals("사장")){
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('사장님 환영합니다.')");
        script.println("location.href='Main2.jsp'");    
        script.println("</script>");
	}

	
%>

<!-- 2022-11-06 허유진 헤더 부분  -->
	<div class="parent" style="width: 100%; height: 930px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>
	    
	    <!-- 2022-11-06 허유진 헤더 부분의 흰색 센터 부분 -->
	    <div class="center" style="background: #ffffff;">
				<nav id="menu">
		            <ul id = "top_menu">
		                <li>
		                <% 		                
		                UserDAO userDAO = new UserDAO();
		                out.print(userDAO.sessionname(userid)); // 세션 ID로 이름/ID 출력
        				%>
        				</li><li>|</li>
		                <li><a href="Mypage.jsp" style="text-decoration: none; color: black">마이페이지</a></li><li>|</li>
		                <li><a href="Logout.jsp"  style="text-decoration: none; color: black">logout</a></li>
		            </ul>
		        </nav>
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
			
			<!-- 단기 알바 구인 테이블 부분  -->
			<center>
	    			<div class="container" style="width: 85%; height: 100%;">
	    			
					<b style="float: left; margin: 5% 0 0 0;">단기 알바 구인</b>
					  		<a href="TotalTable_PartTime.jsp">
					  		
					  		<!-- +버튼  -->
					   		<img src="images/pluse_button.png" style="width: 20px; height: 20px; float: right; margin: 5% 0 0 0;">       
					  		</a>
					  		
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
					        <td onclick="location.href='Detail_PartTime.jsp'">John</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">Doe</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">john@example.com</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">돈</td>
					      </tr>
					      <tr>
					        <td onclick="location.href='Detail_PartTime.jsp'">Mary</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">Moe</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">mary@example.com</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">존</td>
					      </tr>
					      <tr>
					        <td onclick="location.href='Detail_PartTime.jsp'">July</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">Dooley</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">july@example.com</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">으</td>
					      </tr>
					      <tr>
					        <td onclick="location.href='Detail_PartTime.jsp'">Dully</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">Dooley</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">jsdf@example.com</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">잉</td>
					      </tr>
					      <tr>
					        <td onclick="location.href='Detail_PartTime.jsp'">Dully2</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">Dooley2</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">jsdf22@example.com</td>
					        <td onclick="location.href='Detail_PartTime.jsp'">잉</td>
					      </tr>
					    </tbody>
					  </table>
					</div>
	    		</center>
	    		
	    		<!-- 자기 PR 테이블 부분  -->
			<center>
	    			<div class="container" style="width: 85%; height: 100%;">
	    			
					<b style="float: left; margin: 5% 0 0 0;">자기 PR</b>
					  		<a href="TotalTable_PR.jsp">
					  		
					  		<!-- +버튼  -->
					   		<img src="images/pluse_button.png" style="width: 20px; height: 20px; float: right; margin: 5% 0 0 0;">       
					  		</a>
					  		
					  <table class="table table-striped"   style="background: #ffffff; text-align: center; margin:10% 0 1% 0" >
					    <thead>
					      <tr>
					        <th  style="text-align: center">글번호</th>
					        <th style="text-align: center">제목</th>
					        <th style="text-align: center">일시</th>
					        <th style="text-align: center">작성자</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td id="t1">John</td>
					        <td>Doe</td>
					        <td>john@example.com</td>
					        <td>돈</td>
					      </tr>
					      <tr>
					        <td id="t2">Mary</td>
					        <td>Moe</td>
					        <td>mary@example.com</td>
					        <td>존</td>
					      </tr>
					      <tr>
					        <td id="t3">July</td>
					        <td>Dooley</td>
					        <td>july@example.com</td>
					        <td>으</td>
					      </tr>
					      <tr>
					        <td id="t4">Dully</td>
					        <td>Dooley</td>
					        <td>jsdf@example.com</td>
					        <td>잉</td>
					      </tr>
					      <tr>
					        <td id="t5">Dully2</td>
					        <td>Dooley2</td>
					        <td>jsdf22@example.com</td>
					        <td>잉</td>
					      </tr>
					    </tbody>
					  </table>
					</div>
	    		</center>
	   		 </div>
			
			<!-- 흰색 부분 끝나는 div -->
	    </div>
	    
	    <div class="background" style="background: #525CDE;"></div>
	</div>
	
	
	
</body>
</html>