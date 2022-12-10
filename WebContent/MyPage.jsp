<%@page import="pt.PtDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.User" %>
<%@ page import = "pt.PtDAO" %>
<%@ page import = "pt.Pt" %>
<%@ page import = "pr.PrDAO" %>
<%@ page import = "pr.Pr" %>
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
    overflow: auto;
}
.background {
    flex: 1;
    overflow: auto;
}
.center {
    flex: 3;
    width: 100%;
    height: 100%;
}

.my-info{
	display: flex;
    flex-direction: column;
    margin: 0% 5% 0% 5%;
}

.my-info-title{
    padding: 24px 16px;
    border-bottom: 1px solid #000000;
   	font-weight: bold;
   	font-size: 25px;
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
	text-align: center;
	width: 100%
}
th, td {
	font-size: 16px;
}

.type03 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 4px solid #F53520;
}
.type03 th {
  width: 160px;
  padding: 10px;
  font-weight: bold;
  vertical-align: center;
  color: #F53520;
  border-bottom: 2px solid #F53520;

}
.type03 td {
  width: 349px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 2px solid #F53520;
}

.info-edit{
   	font-weight: bold;
   	font-size: 18px;
   	margin-bottom: 5px
}

.btn{	
	background: #FA4E29;
	color: #FFFFFF;
    outline: 0;
    height: 40px;
    margin: 3% 0 0 0 ;
    float: none;
    flex-grow: 1;
}

.btn2{	
	background: #FA4E29;
	color: #FFFFFF;
    outline: 0;
    height: 40px;
    width: 30%;
    margin: 3% 0 0 0 ;
    width : 100px;
    float: right;
    flex-grow: 1;
    border: 0;
    border-radius: 5px;

}

.btn-place{
	padding: 0px 16px 0px 16px;
}

*{
	font-family: 'Jua', sans-serif;
}


</style>
<meta charset="UTF-8">
<title>마이페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body style="background-color:#525CDE">

<% //세션 설정 + 정보 없이 출입 시 다시 로그인으로 보냄

	String userid = (String)session.getAttribute("userid");
	String role = (String)session.getAttribute("role");

	if(session.getAttribute("userid")==null){ 
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href='Login.jsp'");   
        script.println("</script>");
	}
	
	UserDAO userDAO = new UserDAO();
	List<User> list = userDAO.selectall(userid);
	PtDAO ptDAO = new PtDAO();
	List<Pt> list2 = ptDAO.mypt(userid);
	PrDAO prDAO = new PrDAO();
	List<Pr> list3 = prDAO.mypr(userid);
	List<Pt> list4 = ptDAO.endpt(userid);
	List<Pt> list5 = ptDAO.joinpt(userid);
	
	
%>

	<div class="parent" style="width: 100%; height: 100%; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>

	    <div class="center" style="background: #ffffff;">
			<div class="header"> 
				<center>
					<A href="Main.jsp">
						<img src="images/harulogo.png" style="width: 170px; height: 170px; margin: 2% 0 2% 0">
					</A>
				</center>
			</div>
			<p>
			<!-- 노란색 부분  -->
			<div class="mainfunction" style="background:#FFF2BE; width: 100%; height: 100%;">
			<div class="my-info">
				<div class="my-info-title">
					마이페이지
				</div>
				<form action="MyPageAction.jsp" method="post">
				<div class="main-info">
				<div class="info-edit">개인정보 수정</div>
					<table class="type03">
							<tbody>
							<% for(User user : list) { // 리스트 객체를 꺼내서 user dto에 너어주겠다 %>
								<tr>
									<th>이름</th>
									<td bgcolor="#FFFFFF"><%= user.getUserNAME() %></td>
									<th>성별</th>
									<td bgcolor="#FFFFFF"><%= user.getUserGENDER() %></td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td bgcolor="#FFFFFF"><input type="text" name="userNICKNAME" value="<%= user.getUserNICKNAME() %>" style="border: 1px solid #EDEFF1;"></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>역할</th>
									<td bgcolor="#FFFFFF"><%= user.getRole() %></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>위치</th>
									<td bgcolor="#FFFFFF"><select name="userLOCATION" style="border: 1px solid #EDEFF1; width:200px;height:40px;color:gray" >
	               						<option selected disabled><%= user.getUserLOCATION() %></option>
	                					<option value="서울">서울</option>
	                					<option value="인천">인천</option>
	               						<option value="경기">경기</option>
	            					</select></td>
	            					<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>나이</th>
									<td bgcolor="#FFFFFF"><input type="text" name="userAGE" style="border: 1px solid #EDEFF1;" value=<%= user.getUserAGE() %>></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td bgcolor="#FFFFFF"><input type="text" class="form-control" placeholder="-를 제외하고 작성"
									name="userPHONE" maxlength="20" value="<%= user.getUserPHONE() %>" style="border: 1px solid #EDEFF1; font-size: 17px; height: 5% "></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>나의 평점</th>
									<td bgcolor="#FFFFFF"><%= user.getUserRATING() %></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<% } %>
							</tbody>
					</table>
				</div>
				<div class="btn-place">
					<button type="submit" class="btn2">수정</button>
				</div>
			</form>
			</div>
				<center>
	    			<div class="container" style="width: 91%; height: 50%;">
					
					      <% 
					      if(role.equals("사장")){ %>
					    	  
					    	 <!-- 끝난 알바 리스트 + 점수 기입 + 버튼 = > 그 아이디의 사용자 평점 올라가게  + 평점 기입은 한번만 되게끔 -->
					    	  
				    	  <b style="float: left; margin: 5% 0 0 0;font-size: 18px">내가 작성한 글</b>
					  <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:8% 0 5% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center">글번호</th>
					        <th style="text-align: center">제목</th>
					        <th style="text-align: center">일시</th>
					        <th style="text-align: center">작성자</th>
					        <th style="text-align: center">상태</th>
					        <th style="text-align: center">평점주기</th>
					      </tr>
					    </thead>
					    <tbody>
				      	<tr>
					    	
					      	<%for(Pt pt : list2) { // 리스트 객체를 꺼내서 pt dto에 너어주겠다 %>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle; font-size: 17px"> <%= pt.getPtID() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle; font-size: 17px"> <%= pt.getPtTITLE() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle; font-size: 17px"> <%= pt.getPtSDAY() + "~" + pt.getPtEDAY() %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle; font-size: 17px"> <%= ptDAO.ptusername(pt.getUserID()) %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" <%if(pt.getPtSTATE().equals("마감")){ %>style="color: #D11E35;vertical-align: middle; font-size: 17px"<%}
					      		else {%> style="color: #0F52FC;vertical-align: middle; font-size: 17px"<%} %>> <%= pt.getPtSTATE() %></td>
			      		<form action="PTrating_SAJANG.jsp" method="post"> <!-- 알바생 평점 주러가기 폼 -->
				      		<td><input type="submit" class="btn" value="평점주기" <%if(!pt.getPtSTATE().equals("마감") || pt.getPtWriteSAJANG().equals("1")){ %>disabled><%}%></td>
		      				<input type="hidden" value="<%=pt.getPtTITLE() %>" name="ptTITLE">
			      			<input type="hidden" value="<%=pt.getPtROLE() %>" name="ptROLE">
			      			<input type="hidden" value="<%=pt.getPtMONEY() %>" name="ptMONEY">
			      			<input type="hidden" value="<%=pt.getPtALBA() %>" name="ptALBA">
			      			<input type="hidden" value="<%=pt.getPtID() %>" name="ptID">
				     	 </tr>
			    		 </form>
					      <% 	} }else if(role.equals("알바")){ %>
					    	  
					    	  </tbody>
					    	  </table>
					    	  
					    	  <!--  //끝난 알바 리스트 + 점수 기입 + 버튼 = > 평점 오르게
					    			  
					    	  // 테이블 하나 만들어서 외래키로 평점 연결해서 해야함 / 평점 올라가게 + 평점 기입은 한번만 되게끔
					    			  
					    	  // 자기가 지원한 댓글 확인 + pt_comment <a>ptid로 넘기면 바로 누르면 글로 간다! -> (낙방) -->
					    	  <b style="float: left; margin: 5% 0 0 0; font-size: 20px">내가 작성한 글</b>
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
					    	  
					    		<%for(Pr pr : list3) { %>
					    	 <tr>
					        <td onclick="location.href='Detail_PR.jsp?prid=<%=pr.getPrID()%>'"> <%= pr.getPrID() %></td>
					        <td onclick="location.href='Detail_PR.jsp?prid=<%=pr.getPrID()%>'"> <%= pr.getPrTITLE() %></td>
					        <td onclick="location.href='Detail_PR.jsp?prid=<%=pr.getPrID()%>'"> <%= pr.getPrDATE() %></td>
					      	<td onclick="location.href='Detail_PR.jsp?prid=<%=pr.getPrID()%>'"> <%= prDAO.prusername(pr.getUserID()) %></td>
					      	</tr>
					      <% } %>
					    </tbody>
					   </table>
   					  <b style="float: left; margin: 5% 0 0 0;">내가 지원한 알바</b>
					   <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:10% 0 1% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center">글번호</th>
					        <th style="text-align: center">제목</th>
					        <th style="text-align: center">일시</th>
					        <th style="text-align: center">작성자</th>
					        <th style="text-align: center">상태</th>
					      </tr>
					    </thead>
					    <tbody>
					    	<tr><%for(Pt pt : list5) { %>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= pt.getPtID() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= pt.getPtTITLE() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= pt.getPtSDAY() + "~" + pt.getPtEDAY() %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= ptDAO.ptusername(pt.getUserID()) %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"<%if(pt.getPtSTATE().equals("마감")){ %>style="color: #D11E35;"<%}
					      		else {%> style="color: #0F52FC;"<%} %>> <%= pt.getPtSTATE()%></td>
					    	</tr>
					    	<%} %>
					    </tbody>
					    </table>
 						<b style="float: left; margin: 5% 0 0 0;">내가 참여한 알바</b>
					   <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:10% 0 5% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center">글번호</th>
					        <th style="text-align: center">제목</th>
					        <th style="text-align: center">일시</th>
					        <th style="text-align: center">작성자</th>
					        <th style="text-align: center">상태</th>
					        <th style="text-align: center">평점주기</th>
					      </tr>
					    </thead>
					    <tbody>
					    <%for(Pt pt : list4) { %>
					    	<tr>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= pt.getPtID() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= pt.getPtTITLE() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= pt.getPtSDAY() + "~" + pt.getPtEDAY() %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"> <%= ptDAO.ptusername(pt.getUserID()) %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"<%if(pt.getPtSTATE().equals("마감")){ %>style="color: #D11E35;"<%}
					      		else {%> style="color: #0F52FC;"<%} %>> <%= pt.getPtSTATE()%></td>
 						<form action="PTrating_ALBA.jsp" method="post"> <!-- 평점 주러가기 폼 -->
				      		<td><input type="submit" class="btn" value="평점주러가기" <%if(!pt.getPtSTATE().equals("마감") || pt.getPtWriteALBA().equals("1")){ %>disabled<%} %>> </td>
				      			<input type="hidden" value="<%=pt.getPtTITLE() %>" name="ptTITLE">
				      			<input type="hidden" value="<%=pt.getPtROLE() %>" name="ptROLE">
				      			<input type="hidden" value="<%=pt.getPtMONEY() %>" name="ptMONEY">
				      			<input type="hidden" value="<%=pt.getUserID() %>" name="userID">
				      			<input type="hidden" value="<%=pt.getPtID() %>" name="ptID">
					    	</tr>
					    </form>
					    	<%} }%>
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