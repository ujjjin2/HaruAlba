<%@page import="pr.PrDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "pt.PtDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>

<% // 로그아웃 버튼 후 캐시 삭제

	response.setHeader("Pragma", "no-cache"); 
	response.setHeader("Cache-Control", "no-store"); 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost/haru?serverTimezone=UTC", "haru", "haru");
	String sql = "SELECT * FROM pr ORDER BY prid DESC LIMIT 5";
	String sql2 = "SELECT * FROM pt ORDER BY ptid DESC LIMIT 5";
	pstmt = conn.prepareStatement(sql);
	pstmt2 = conn.prepareStatement(sql2);
	int prid = 0;
	String prtitle ="";
	String prday ="";
	String userid_1 = "";
	
	int ptid = 0;
	String pttitle ="";
	String ptperiod ="";
	String ptstate = "";
	
	String sqlPartTime = "SELECT * FROM ";
	
	rs = pstmt.executeQuery(sql);
	rs2 = pstmt2.executeQuery(sql2);

%>

<html>
<head>
<meta charset="UTF-8">
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
      height: 2000px;
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
	  width: 20%; /*20*5=100%*/
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

  </style>
</head>
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
		                UserDAO userDAO = new UserDAO();
		                PtDAO ptDAO = new PtDAO();
		                PrDAO prDAO = new PrDAO();
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
        	<a href="#" style="margin: 10% 0 0% 20px">시급</a>
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
	          <li><a href="Write_PartTime.jsp">단기알바 글쓰기</a></li>
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
	        <a href="#">자기 PR</a>
	        <ul class="submenu">
	          <li><a href="TotalTable_PR.jsp">자기PR 목록</a></li>
	          <li><a href="Write_PR.jsp">자기PR 글쓰기</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">후기</a>
	        <ul class="submenu">
	          <li><a href="TotalTable_review_Alba.jsp">알바 후기</a></li>
	          <li><a href="TotalTable_review_Sajang.jsp">사장 후기</a></li>
	        </ul>
	      </li>
	      <li>
	        <a href="#">고객센터</a>
	        <ul class="submenu">
	          <li><a href="#">공지사항</a></li>
	          <li><a href="#">신고하기 </a></li>
	          <li><a href="#">문의사항</a></li>
	        </ul>
	      </li>
	    </ul>
  </div>
  </nav>
  
  <img src="https://apple.contentsfeed.com/RealMedia/ads/Creatives/jobkorea/221128_handon_al_mt/221128_handon_570110.png"
  style="margin: 2% 0 0 16%;float: left;width: 35%;height: 170px;">
  
  <div style="float: left; margin: 2% 5% 2% 1%;  border: 1px solid #747474;width : 33%; height: 170px; border-radius: 10px">
  	<a href="TotalTable_PartTime.jsp"><img src="images\PT.png" style="height: 70%; weight:20%; margin: 5% 5% 5% 5%"></a>
  	<a href="TotalTable_PR.jsp"><img src="images\PR.png" style="height: 70%; weight:20%; margin: 5% 5% 5% 5%"></a>
  	<a href="#"><img src="images\AlbaReview.png" style="height: 70%; weight:20%; margin: 5% 5% 5% 5%"></a>
  	<a href="#"><img src="images\sajangReview.png" style="height: 70%; weight:20%;margin: 5% 5% 5% 5%"></a>
  </div>
  
  <div class="mainfunction" style="background:#ffffff; width: 100%; height: 100%;">
			
			<!-- 단기 알바 구인 테이블 부분  -->
			<center>
	    			<div class="container" style="width: 70%; height: 50%;">
	    			
					<b style="float: left; margin: 4% 0 0 0;font-size: 20px;">단기 알바 구인 </b>
					  		<a href="TotalTable_PartTime.jsp">
					  		
					  		<!-- +버튼  -->
					   		<img src="images/pluse_button.png" style="width: 20px; height: 20px; float: right; margin: 4% 0 0 0;">       
					  		</a>
					  		
					  <table class="table table-striped" id="shortTime" style="background: #ffffff; text-align: center; margin:10% 0 1% 0" >
					    <thead>
					      <tr>
					        <th style="text-align: center;font-size: 17px; width: 15%; background: #ffb955;color:white;">글번호</th>
					        <th style="text-align: center;font-size: 18px;width: 25%;background: #ffb955;color:white;">제목</th>
					        <th style="text-align: center;font-size: 18px;width: 30%;background: #ffb955;color:white;">일시</th>
					        <th style="text-align: center;font-size: 18px;width: 15%;background: #ffb955;color:white;">작성자</th>
					        <th style="text-align: center;font-size: 18px;width: 15%;background: #ffb955;color:white;">상태</th>
					      </tr>
					    </thead>
					    <tbody>
					    <%
					    	while(rs2.next()){
					    	%>
					      <tr>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=rs2.getInt("ptid")%>'" style="font-size: 15px; "> <%= rs2.getInt("ptid") %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=rs2.getInt("ptid")%>'" style="font-size: 15px"> <%= rs2.getString("pttitle") %></td>
					        <td onclick="location.href='Detail_PartTime.jsp?ptid=<%=rs2.getInt("ptid")%>'" style="font-size: 15px"> <%= rs2.getString("ptSDAY") %> ~ <%=rs2.getString("ptEDAY") %></td>
							<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=rs2.getInt("ptid")%>'" style="font-size: 15px"> <%= ptDAO.ptusername(rs2.getString("userid")) %></td>
					      	<td onclick="location.href='Detail_PartTime.jsp?ptid=<%=rs2.getInt("ptid")%>'" <%if(rs2.getString("ptstate").equals("마감")){ %>style="color: #D11E35; font-size: 15px"<%}
					      		else {%> style="color: #0F52FC;font-size: 15px"<%} %>> <%= rs2.getString("ptstate") %></td>
					      </tr>
					      <%
					    	}
					      %>
					   
					    </tbody>
					  </table>
					</div>
	    		</center>
	    		
	    		<!-- 자기 PR 테이블 부분  -->
			<center>
	    			<div class="container" style="width: 70%; height: 50%;">
	    			
					<b style="float: left; margin: 4% 0 0 0;font-size: 20px">자기 PR</b>
					  		<a href="TotalTable_PR.jsp">
					  		
					  		<!-- +버튼  -->
					   		<img src="images/pluse_button.png" style="width: 20px; height: 20px; float: right; margin: 4% 0 0 0;">       
					  		</a>
					  		
					  <table class="table table-striped"   style="background: #ffffff; text-align: center; margin:5% 0 1% 0" >
					    <thead>
					      <tr>
					        <th  style="text-align: center;font-size: 18px; width: 20%;background: #ffb955;color:white;">글번호</th>
					        <th style="text-align: center;font-size: 18px; width: 30%;background: #ffb955;color:white;">제목</th>
					        <th style="text-align: center;font-size: 18px; width: 30%;background: #ffb955;color:white;">일시</th>
					        <th style="text-align: center;font-size: 18px; width: 20%;background: #ffb955;color:white;">작성자</th>
					      </tr>
					    </thead>
					    <tbody>
					    <%
					     while(rs.next()){
					    %>
					      <tr>
					        <td onclick="location.href='Detail_PR.jsp?prid=<%=rs.getInt("prid")%>'" style="font-size: 15px"><%=rs.getInt("prid") %></td>
					        <td onclick="location.href='Detail_PR.jsp?prid=<%=rs.getInt("prid")%>'" style="font-size: 15px"><%= rs.getString("prtitle") %></td>
					        <td onclick="location.href='Detail_PR.jsp?prid=<%=rs.getInt("prid")%>'" style="font-size: 15px"><%= rs.getString("prday")%></td>
					        <td onclick="location.href='Detail_PR.jsp?prid=<%=rs.getInt("prid")%>'" style="font-size: 15px"><%= prDAO.prusername(rs.getString("userid")) %></td>
					      </tr>
					      <%
					    	 }
					      %>
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