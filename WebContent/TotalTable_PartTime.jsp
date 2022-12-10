<%@page import="pt.Pt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pt.PtDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<!DOCTYPE html>

<% request.setCharacterEncoding("UTF-8"); %>
<% // 로그아웃 버튼 후 캐시 삭제

response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 


	PtDAO ptDAO = new PtDAO();
	String searchField = request.getParameter("searchField");
	String searchText = request.getParameter("searchText");
	
	if(searchField == null){
		searchField = "";
	}
	if(searchText == null){
		searchText = "";
	}

	
	ArrayList<Pt> list = ptDAO.getSearch(searchField,searchText); // 검색 결과 리스트 반환

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
*{
	font-family: 'Jua', sans-serif;
}

table > thead > tr > td{
text-align: center;
}


</style>
<meta charset="UTF-8">
  <title>자기 PR 전체 테이블</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- 2022-11-06 허유진 파란 배경색  -->
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

<!-- 2022-11-06 허유진 헤더 부분  -->
	<div class="parent" style="width: 100%; height: 930px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>
	    
	    <!-- 2022-11-06 허유진 헤더 부분의 흰색 센터 부분 -->
	    <div class="center" style="background: #ffffff;">
				<nav id="menu">
		            <ul id = "top_menu" style="margin: 10px 0 5px 0">
		                <li>
		                <% 		                
		                UserDAO userDAO = new UserDAO();
		                out.print(userDAO.sessionname(userid)); // 세션 ID로 이름/ID 출력
		                String role = (String)session.getAttribute("role");
        				%>
        				</li><li>|</li>
		                <li><a href="MyPage.jsp" style="text-decoration: none; color: black">마이페이지</a></li><li>|</li>
		                <li><a href="Logout.jsp"  style="text-decoration: none; color: black">LOGOUT</a></li>
		            </ul>
		        </nav>
			<div class="header"> 
				<center>
					<A href="Main.jsp">
						<img src="images/harulogo.png" style="width: 170px; height: 170px;margin-bottom: 2%">
					</A>
				</center>
			</div>
			<p>
			<!-- 노란색 부분  -->
			<div class="mainfunction" style="background:#FFF2BE; width: 100%; height: 100%;">
			
			<!-- 단기 알바 구인 테이블 부분  -->
			<center>
	    			<div class="container" style="width: 85%; height: 100%;">
					  	<h3 style="margin: 5% 0 5% 0;"><a href="TotalTable_PartTime.jsp" style="text-decoration: none; color: black;font-size: 30px">단 기 알 바 구 인</a></h3>

						<div>
							<div>
								<form method="post" action="TotalTable_PartTime.jsp">
									<table class="pull-left">
										<tr>
											<td><select class="form-control" name="searchField">
													<option value="ptTITLE">제목</option>
													<option value="userID">작성자</option>
													<option value="ptCONTENT">내용</option>
											</select></td>
											<td><input type="text" class="form-control"
												placeholder="검색어 입력" name="searchText" maxlength="100"></td>
											<td><button type="submit" class="btn btn-success">검색</button></td>
										</tr>
									</table>
								</form>

						<% if(role.equals("사장")){ %>
					   <!-- 글쓰기 버튼  -->
                       <a href="Write_PartTime.jsp">                       
                        <img src="images/write.png" style="width: 30px; height: 30px; float: right; margin: 0 20px 10px 0">       
                       </a>
                    <%} %>   
                     </div>
                      </div>
					  <table class="table table-striped" style="background: #ffffff; text-align: center;margin-top: 10%" >
					    <thead>
					      <tr>
					        <th style="text-align: center;font-size: 18px; width: 15%">글번호</th>
					        <th style="text-align: center;font-size: 18px; width: 25%">제목</th>
					        <th style="text-align: center;font-size: 18px; width: 30%">일시</th>
					        <th style="text-align: center;font-size: 18px; width: 15%">작성자</th>
					        <th style="text-align: center;font-size: 18px; width: 15%">상태</th>
					      </tr>
					    </thead>
					    <tbody>
					    	<%
						      	for(Pt pt : list) { // 리스트 객체를 꺼내서 pt dto에 너어주겠다 %>
						      		<tr>
							        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= pt.getPtID() %></td>
							        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= pt.getPtTITLE() %></td>
							        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= pt.getPtSDAY() + "~" + pt.getPtEDAY() %></td>
							      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= ptDAO.ptusername(pt.getUserID()) %></td>
							      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"<%if(pt.getPtSTATE().equals("마감")){ %>style="color: #D11E35;"<%}
							      		else {%> style="color: #0F52FC;"<%} %>> <%= pt.getPtSTATE() %></td>
							     </tr>
							      <%
					    	  }
					      %>
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