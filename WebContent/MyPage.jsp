<%@page import="review.Review_S"%>
<%@page import="review.Review_S_DAO"%>
<%@page import="java.util.ArrayList"%>
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
<%@ page import = "review.Review_A_DAO" %>
<%@ page import = "review.Review_A" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>

<%
// 로그아웃 버튼 후 캐시 삭제

	response.setHeader("Pragma", "no-cache"); 
	response.setHeader("Cache-Control", "no-store"); 
	
%>

<html>
<head>
<meta charset="UTF-8">

<!-- 롤링 배너 -->
<meta http-equiv="Content-Type" Content="text/html; charset=utf-8">  
<meta name="viewport" content="width=device-width, user-scalable=no">

<style type="text/css">
<!--
	/* banner */
	.banner {position: relative; width: 680px; height: 170px; top: 50px;  margin:0 0 0 -3%; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 680px; height: 170px; margin:0; padding:0;}

//-->
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<title>하루 알바 메인</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <style>
    *{
      margin : 0;
      padding: 0;
      box-sizing: border-box;
	  font-family: 'Jua', sans-serif;
    }
    li{
      list-style-type: none;
      ist-style:none
    }
	a{text-decoration:none;font-size:14px}
    header{
      height: 166px;
    }
    .box{
      width: 100%;
      height: 100%;
      margin: 0 auto;
    }
    #logo{
      float: left;
      margin: 3% 0 0 17%;
    }
    #menu{
      float: right ;
      text-align: right;
      margin: 0 12% 0 0;
    }
    #menu li{
      display: inline-block;
    }
    #top_menu li{
      margin: 30px 0 0 10px;
    }
    #main_menu li{
      margin: 50px 0 0 80px;
      font-weight: bold;
      font-size: 20px;
    }
    .menubar {
	  width: 70%;
	  overflow: hidden;
	  margin: 5% 0 0 16%;
	}
	
	.menubar > li {
	  width: 25%; /*20*5=100%*/
	  float: left;
	  text-align: center;
	  line-height: 40px;
	  background-color: #ffb955;
	}
	
	.menubar a {
	  color: #fff;
	  font-size: 20px;
	  text-decoration: none;
	}
	
	.submenu > li {
	  line-height: 50px;
	  background-color: #FF9B09;
	}
	
	.submenu {
	  height: 0; /*ul의 높이를 안보이게 처리*/
	  overflow: hidden;
	}
	.menubar > li:hover {
  background-color: #FF9B09;
  transition-duration: 0.5s;
}
.search_main{
	width: 100%;
	height: 30% ;
}

.menubar > li:hover .submenu {
  height: 160px; /*서브메뉴 li한개의 높이 50*5*/
  transition-duration: 1s;
  }
  
  /*footer 부분 */
footer{
        height: 300px;
        background-color: #FF9B09;
       	width: 100%;
        color: white;
        position: relative;
        transform: translateY(100px);
        float: left;
    }
    #buttom_menu ul{
    	margin: 5% 0 0 10%;
        padding: 20px 20px 0 80px;
        font-weight: bold;
    }
    #bottom_menu li{
        display: inline;
        font-size:20px;
        margin: 20% 30px 0 10%;
    }
    footer .items{
        float: left;
        margin: 5px 0 0 10%
    }
    footer h3{color: white;}
    footer .items ul{margin-top: 15px;}
    footer .items li{margin-top: 5px;}
    footer .phone{
        font-size: 25px;
        font-weight: bold;
    }
    
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
	margin: 5% 0 0 0;
    padding: 18px 16px;
    border-bottom: 1px solid #000000;
   	font-weight: bold;
   	font-size: 25px;
}

.main-info{
	padding: 24px 16px 0px 16px;
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

  </style>
</head>
<%
//세션 설정 + 정보 없이 출입 시 다시 로그인으로 보냄

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
	
	Review_A_DAO prDAO = new Review_A_DAO();
	Review_S_DAO s_DAO = new Review_S_DAO();
	
	List<Review_A> list3 = prDAO.myreview(userid);
	List<Review_S> list6 = s_DAO.myreview(userid);
	
	List<Pt> list4 = ptDAO.endpt(userid);
	List<Pt> list5 = ptDAO.joinpt(userid);
%>
<body>
<header>
    <div class="box">
        <div id="logo">
            <A href="Main.jsp">
				<img src="images/harulogo.png" style="width: 170px; height: 170px; margin-bottom: 2%">
			</A>
        </div>
        <nav id="menu">
           <ul id = "top_menu" style="margin: 3% 0 5% 0">
		                <li>
		                <%
		                out.print(userDAO.sessionname(userid)); // 세션 ID로 이름/ID 출력
		                %>
        				</li><li>|</li>
		                <li><a href="MyPage.jsp" style="text-decoration: none; color: black;">마이페이지</a></li><li>|</li>
		                <li><a href="Logout.jsp"  style="text-decoration: none; color: black">LOGOUT</a></li>
		    </ul>
        </nav> 
        <!-- 수정해야됨 -->
        <form class="search_main" method="post" action="TotalTable_PartTime.jsp">
        	<div>
			<input type="text" name="search_main" style="margin: 6% 0 0 10%;height: 50px;width: 25%; font-size: 20px; border: 3px solid #FF9B09;">
			<input type="submit" value="검색" style="margin: 4% 0 0 -20px;height: 50px; width: 6%;font-size: 20px;border: 3px solid #F29000; color: #FFFFFF; background: #FF9B09">
			<a href="TotalTable_PartTime.jsp" style="margin: 10% 0 0% 11%" >단기알바</a>
        	<a href="Question.jsp" style="margin: 10% 0 0% 20px">시급</a>
        	<a href="TotalTable_Location_detail.jsp?_location=서울" style="margin: 10% 0 0% 20px">서울알바</a>
        	<a href="TotalTable_Location_detail.jsp?_location=인천" style="margin: 10% 0 0% 20px">인천알바</a>
			</div>
		</form>
        
    </div>
  </header>
  <nav style="background: #ffb955">
  	<div class = "header">
  		 <ul class="menubar">
	      <li>
	        <a href="#">단기 알바</a>
	        <ul class="submenu">
	          <li><a href="TotalTable_PartTime.jsp">단기알바 목록</a></li>
	          <%if(role.equals("사장")) {%>
	          <li><a href="Write_PartTime.jsp">단기알바 글쓰기</a></li>
	          <%} %>
	        </ul>
	      </li>
	      <li>
	        <a href="#">지역별 알바</a>
	        <ul class="submenu">
	          <li><a href="TotalTable_Location_detail.jsp?_location=서울">서울</a></li>
	          <li><a href="TotalTable_Location_detail.jsp?_location=인천">인천</a></li>
	          <li><a href="TotalTable_Location_detail.jsp?_location=경기도">경기도</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">후기</a>
	        <ul class="submenu">
	          <li><a href="TotalTable_review_Alba.jsp">알바 썰</a></li>
	          <li><a href="TotalTable_review_Sajang.jsp">사장 후기</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">고객센터</a>
	        <ul class="submenu">
	          <li><a href="Question.jsp">문의사항</a></li>
	        </ul>
	      </li>
	    </ul>
  </div>
  </nav>
  
  <div class="mainfunction" style="background:#FFFfff; width: 70%; height: 100%; margin-left: 15%">
			<div class="my-info">
				<div class="my-info-title">
					마이페이지
				</div>
				<form action="MyPageAction.jsp" method="post">
				<div class="main-info">
				<div class="info-edit">개인정보 수정</div>
					<table class="type03">
							<tbody>
							<%
							for(User user : list) { // 리스트 객체를 꺼내서 user dto에 너어주겠다
							%>
								<tr>
									<th>이름</th>
									<td ><%=user.getUserNAME()%></td>
									<th>성별</th>
									<td><%=user.getUserGENDER()%></td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td bgcolor="#FFFFFF"><input type="text" name="userNICKNAME" value="<%=user.getUserNICKNAME()%>" style="border: 1px solid #EDEFF1;"></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>역할</th>
									<td bgcolor="#FFFFFF"><%=user.getRole()%></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>위치</th>
									<td bgcolor="#FFFFFF"><select name="userLOCATION" style="border: 1px solid #EDEFF1; width:200px;height:40px;color:gray" >
	               						<option selected disabled><%=user.getUserLOCATION()%></option>
	                					<option value="서울">서울</option>
	                					<option value="인천">인천</option>
	               						<option value="경기">경기</option>
	            					</select></td>
	            					<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>나이</th>
									<td bgcolor="#FFFFFF"><input type="text" name="userAGE" style="border: 1px solid #EDEFF1;" value=<%=user.getUserAGE()%>></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td bgcolor="#FFFFFF"><input type="text" class="form-control" placeholder="-를 제외하고 작성"
									name="userPHONE" maxlength="20" value="<%=user.getUserPHONE()%>" style="border: 1px solid #EDEFF1; font-size: 17px; height: 5% "></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<th>나의 평점</th>
									<td bgcolor="#FFFFFF"><%=user.getUserRATING()%></td>
									<th bgcolor="#FFFFFF"></th>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<%
								}
								%>
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
							if(role.equals("사장")){
										      %>
					    	  
					    	 <!-- 끝난 알바 리스트 + 점수 기입 + 버튼 = > 그 아이디의 사용자 평점 올라가게  + 평점 기입은 한번만 되게끔 -->
					    	  
				    	  <b style="float: left; margin: 5% 0 0 0;font-size: 18px">내가 작성한 구인 글</b>
					  <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:8% 0 5% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center;background: #ffb955;color:white;">글번호</th>
					        <th style="text-align: center;background: #ffb955;color:white;">제목</th>
					        <th style="text-align: center;background: #ffb955;color:white;">일시</th>
					        <th style="text-align: center;background: #ffb955;color:white;">작성자</th>
					        <th style="text-align: center;background: #ffb955;color:white;">상태</th>
					        <th style="text-align: center;background: #ffb955;color:white;">평점주기</th>
					      </tr>
					    </thead>
					    <tbody>
				      	<tr>
					    	
					      	<%
					    	for(Pt pt : list2) { // 리스트 객체를 꺼내서 pt dto에 넣어주겠다
					    						      	%>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle; font-size: 17px"> <%=pt.getPtID()%></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle; font-size: 17px"> <%=pt.getPtTITLE()%></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle; font-size: 17px"> <%=pt.getPtSDAY() + "~" + pt.getPtEDAY()%></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle; font-size: 17px"> <%=ptDAO.ptusername(pt.getUserID())%></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" <%if(pt.getPtSTATE().equals("마감")){%>style="color: #D11E35;vertical-align: middle; font-size: 17px"<%}
					      		else {%> style="color: #0F52FC;vertical-align: middle; font-size: 17px"<%}%>> <%=pt.getPtSTATE()%></td>
			      		<form action="PTrating_SAJANG.jsp" method="post"> <!-- 알바생 평점 주러가기 폼 -->
				      		<td><input type="submit" class="btn" value="평점주기" <%if(!pt.getPtSTATE().equals("마감") || pt.getPtWriteSAJANG().equals("1")){%>disabled><%
				      		}
				      		%></td>
		      				<input type="hidden" value="<%=pt.getPtTITLE()%>" name="ptTITLE">
			      			<input type="hidden" value="<%=pt.getPtROLE()%>" name="ptROLE">
			      			<input type="hidden" value="<%=pt.getPtMONEY()%>" name="ptMONEY">
			      			<input type="hidden" value="<%=pt.getPtALBA()%>" name="ptALBA">
			      			<input type="hidden" value="<%=pt.getPtID()%>" name="ptID">
				     	 </tr>
			    		 </form>
			    		 <%} %>
			    		 </tbody>
			    		 </table>
			    		  <!--   -->
			    		  <b style="float: left; margin: 5% 0 0 0;">내가 작성한 후기</b>
					  <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:8% 0 5% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center;background: #ffb955;color:white;">글번호</th>
					        <th style="text-align: center;background: #ffb955;color:white;">제목</th>
					        <th style="text-align: center;background: #ffb955;color:white;">일시</th>
					        <th style="text-align: center;background: #ffb955;color:white;">작성자</th>
					      </tr>
					    </thead>
					    <tbody>
				      	<tr>
					    	
					      	<%
					    	for(Review_S review_s : list6) { // 리스트 객체를 꺼내서 pt dto에 넣어주겠다
					    	%>
					        <td onclick="location.href='Detail_ReviewS.jsp?rid=<%=review_s.getrID()%>'" style="vertical-align: middle; font-size: 17px"> <%=review_s.getrID()%></td>
					        <td onclick="location.href='Detail_ReviewS.jsp?rid=<%=review_s.getrID()%>'" style="vertical-align: middle; font-size: 17px"> <%=review_s.getrTITLE()%></td>
					        <td onclick="location.href='Detail_ReviewS.jsp?rid=<%=review_s.getrID()%>'" style="vertical-align: middle; font-size: 17px"> <%=review_s.getrDATE()%></td>
					      	<td onclick="location.href='Detail_ReviewS.jsp?rid=<%=review_s.getrID()%>'" style="vertical-align: middle; font-size: 17px"> <%=ptDAO.ptusername(review_s.getUserID())%></td>
				     	 </tr>
			    		 </form>
					      <%
					    	} }else if(role.equals("알바")){
					      %>
					    	  
					    	  </tbody>
					    	  </table>
					    	  
					    	  <!--  //끝난 알바 리스트 + 점수 기입 + 버튼 = > 평점 오르게
					    			  
					    	  // 테이블 하나 만들어서 외래키로 평점 연결해서 해야함 / 평점 올라가게 + 평점 기입은 한번만 되게끔
					    			  
					    	  // 자기가 지원한 댓글 확인 + pt_comment <a>ptid로 넘기면 바로 누르면 글로 간다! -> (낙방) -->
					    	  <b style="float: left; margin: 5% 0 0 0; font-size: 20px">내가 작성한 글</b>
					  <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:10% 0 1% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center;background: #ffb955;color:white;">글번호</th>
					        <th style="text-align: center;background: #ffb955;color:white;">제목</th>
					        <th style="text-align: center;background: #ffb955;color:white;">일시</th>
					        <th style="text-align: center;background: #ffb955;color:white;">작성자</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					    	  
					    		<%
 	  					    		for(Review_A review : list3) {
	  					    	%>
					    	 <tr>
					        <td onclick="location.href='Detail_PR.jsp?rid=<%=review.getrID()%>'" style="vertical-align: middle;"> <%= review.getrID() %></td>
					        <td onclick="location.href='Detail_PR.jsp?rid=<%=review.getrID()%>'" style="vertical-align: middle;"> <%= review.getrTITLE() %></td>
					        <td onclick="location.href='Detail_PR.jsp?rid=<%=review.getrID()%>'" style="vertical-align: middle;"> <%= review.getrDATE() %></td>
					      	<td onclick="location.href='Detail_PR.jsp?rid=<%=review.getrID()%>'" style="vertical-align: middle;"> <%= prDAO.prusername(review.getUserID()) %></td>
					      	</tr>
					      <% } %>
					    </tbody>
					   </table>
   					  <b style="float: left; margin: 5% 0 0 0;">내가 지원한 알바</b>
					   <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:10% 0 1% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center;background: #ffb955;color:white;">글번호</th>
					        <th style="text-align: center;background: #ffb955;color:white;">제목</th>
					        <th style="text-align: center;background: #ffb955;color:white;">일시</th>
					        <th style="text-align: center;background: #ffb955;color:white;">작성자</th>
					        <th style="text-align: center;background: #ffb955;color:white;">상태</th>
					      </tr>
					    </thead>
					    <tbody>
					    	<tr><%for(Pt pt : list5) { %>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle;"> <%= pt.getPtID() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle;"> <%= pt.getPtTITLE() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle;"> <%= pt.getPtSDAY() + "~" + pt.getPtEDAY() %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle;"> <%= ptDAO.ptusername(pt.getUserID()) %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"<%if(pt.getPtSTATE().equals("마감")){ %>style="color: #D11E35;vertical-align: middle;"<%}
					      		else {%> style="color: #0F52FC;"<%} %>> <%= pt.getPtSTATE()%></td>
					    	</tr>
					    	<%} %>
					    </tbody>
					    </table>
 						<b style="float: left; margin: 5% 0 0 0;">내가 참여한 알바</b>
					   <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:10% 0 5% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center;background: #ffb955;color:white;">글번호</th>
					        <th style="text-align: center;background: #ffb955;color:white;">제목</th>
					        <th style="text-align: center;background: #ffb955;color:white;">일시</th>
					        <th style="text-align: center;background: #ffb955;color:white;">작성자</th>
					        <th style="text-align: center;background: #ffb955;color:white;">상태</th>
					        <th style="text-align: center;background: #ffb955;color:white;">평점주기</th>
					      </tr>
					    </thead>
					    <tbody>
					    <%for(Pt pt : list4) { %>
					    	<tr>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle;" > <%= pt.getPtID() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle;"> <%= pt.getPtTITLE() %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle;"> <%= pt.getPtSDAY() + "~" + pt.getPtEDAY() %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'" style="vertical-align: middle;"> <%= ptDAO.ptusername(pt.getUserID()) %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=pt.getPtID()%>'"<%if(pt.getPtSTATE().equals("마감")){ %>style="color: #D11E35;vertical-align: middle;"<%}
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
  
	   		 
	 <footer>
    <div class="box" style="">
        <nav id="bottom_menu">
            <ul>
                <li style="margin-left: 10%">하루 알바</li>
                <li style="margin-left: 1%">고객센터</li>
            </ul>
        </nav>
        <div class="items">
            <h3>문의전화</h3>
            <ul>
                <li class="phone">(+82)032-555-5555</li>
                <li> 10:00 - 18:00 ( Lunch 12:00 - 13:00 ) </li>
            </ul>
        </div><!--item-->
        <div class="items">
            <h3>하루 알바</h3>
            <ul>
                <li>주소 : 인천광역시 미추홀구 </li>
                <li>전화 : (+82)032-555-5555</li>
                <li>팩스 : (+82)032-555-5555</li>
                <li>이메일 : haru@gmail.com</li>
            </ul>
        </div><!--items-->
        <div class="items">
            <h3>콘텐츠산업진흥법에 의한 표시</h3>
            <ul>
                <li>① 콘텐츠의 명칭 : 취업정보</li>
                <li>② 콘텐츠의 제작 및 표시 : 2022년 12월 11일 (업그레이드된 콘텐츠의 경우 갱신일)</li>
                <li>③ 콘텐츠의 제작자 : 잡코리아</li>
                <li>④ 콘텐츠의 이용조건 : 이용약관 참조 (동의없이 무단복제 및 가공을 금함)</li>
                
            </ul>
        </div>
    </div>
</footer>
</body>
</html>