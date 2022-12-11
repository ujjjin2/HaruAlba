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
	.banner {position: relative; width: 600px; height: 170px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 600px; height: 170px; margin:0; padding:0;}

//-->
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script language="JavaScript">

</script> 
<!-- 롤링 배너 -->

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
    
    #detail_summary{
        color: black;
        font-size: 20px;
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
	          <li><a href="#">문의사항</a></li>
	        </ul>
	      </li>
	    </ul>
  </div>
  </nav>
  		<div class="mainfunction" style="background:#ffffff; width: 100%; height: 100%;">
			
			<!-- 테이블 부분  -->
			<center>
	    			<div class="container" style="width: 70%; height: 100%;">
					  	<h3 style="margin: 5% 0 5% 0;"><a href=" Question.jsp" style="text-decoration: none; color: black;font-size: 30px">문 의 사 항</a></h3>
						
						
						<b style="font-size: 20px">자주 묻는 질문</b>
						<hr style="width: 100%;height: 3px; background-color: black;">
							<p>
							<details style="font-size: 15px;color: gray;padding-top: 10px">
								<summary id="detail_summary">▶ 하루 알바는 무엇인가요?</summary>
								하루 알바는 단기 구인 구직을 위한 사이트입니다. <p>
							</details>
							<p>
							<details style="font-size: 15px;color: gray;padding-top: 10px">
								<summary id="detail_summary">▶ 하루 알바에는 어떤 기능이 있나요?</summary>
								하루 알바에는 사장님 회원과 아르바이생 회원에 따른 기능 차이가 있습니다.<p>
								사장님 회원<p>
								단기 알바 구인 구직 글쓰기 가능, 아르바이트생 평점, 아르바이트생에 대한 후기, 지역별 알바보기, 알바생들의 후기를 볼 수 있습니다. 
								<p>아르바이트 생 회원 <p>
								단기 알바에서 댓글을 통해 지원을 할 수 있습니다. 지원을 하면 마이페이지를 통해 신청한 글을 확인할 수 있고, 일을 성공적으로 진행
								하면 해당 사장님의 평점을 부여할 수 있습니다. 알바 후기를 작성하여 자신이 어떤 일을 해봤고 일이 어땠는지 글을 쓸 수 있으며, 댓글을
								달아 다른 아르바이트생과 소통이 가능합니다. 
							</details>
							<p>
							<details style="font-size: 15px;color: gray;padding-top: 10px">
								<summary id="detail_summary">▶ 시급</summary>
								고용노동부는 2023년도 적용 최저임금을 시간급 9,620원으로 8월 5일(금) 고시하였다.

이를 월급으로 환산할 경우 1주 소정근로 40시간 근무 시(유급 주휴 포함, 월 209시간 기준) 2,010,580원이며, 업종별 구분 없이 전 사업장에 동일한 최저임금이 적용된다.

내년도 최저임금 수준과 월 환산액 병기, 업종별 구분적용 여부는최저임금위원회에서 이해관계자 간담회(4회), 현장방문(3회) 및 8차례의 전원회의를 거쳐서 심의.의결하였고, 고용노동부는 7.8. `2023년 적용 최저임금안`을 고시한 이후 7.18.까지 이의 제기 기간을 운영하였으며, 이 기간 동안 노동계(민주노총), 경영계(한국경영자총협회, 중소기업중앙회, 소상공인연합회)에서 4건의 이의 제기를 하였으나 최저임금법 규정 내용·취지 및 최저임금위원회 심의.의결 과정 등을 종합적으로 고려하여 수용하지 않았다.

정부는 내년도 최저임금의 현장 안착을 위해 적극적인 홍보.안내와 함께 사업장에 대한 교육.상담 및 노무관리 지도 등을 통해 최저임금 준수율을 높여나갈 계획이다.

한편, 이번 최저임금 심의과정에서 최저임금위원회 공익위원의 권고에 대해서는 현행 통계현황, 해외사례 등을 면밀히 검토하고, 관계기관 협의, 노·사 의견수렴 등을 거쳐 관련 기초연구를 추진할 계획이다.

이정식 고용노동부 장관은 “코로나19 장기화, 고물가 상황에서 최저임금위원회가 대내외 경제 여건과 고용상황, 저임금근로자 및 영세소상공인의 어려운 사정 등을 종합적으로 고려하여 결정된 것으로 이는 존중되어야 한다.”라고 강조하면서, 앞으로 “최저임금이 저임금근로자의 처우개선과 생활안정에 기여할 수 있도록 최선을 다하겠으며, 노사도 현장에서 최저임금이 잘 준수될 수 있도록 함께 노력해 주시길 당부드린다.”라고 하였다.<p>
-고용 노동부-
							</details>
							<p>
							<details style="font-size: 15px;color: gray;padding-top: 10px">
								<summary id="detail_summary">▶ 아이디와 비밀번호를 잊어버렸어요</summary>
								아이디 찾기<p>
								로그인 창에 있는 아이디 찾기에서 해당되는 정보를 입력하시면 검색할 수 있습니다. <p>
								사장 회원,아르바이트 회원 : 가입시 입력한 성함과 전화번호를 입력하시면 찾을수 있습니다. <p>
								<p>
								비밀번호 찾기<p>
								사장/알바 회원님은 가입하신 아이디, 이름, 전화번호가 일치하면 새로운 비밀번호를 설정할 수 있습니다.<p> 
							</details>
							<p>
							<details style="font-size: 15px;color: gray;padding-top: 10px">>
								<summary id="detail_summary">▶ 아르바이트 회원으로 가입하면 단기 알바 구인구직을 올릴 수 없나요?</summary>
								해당 (주)하루알바는 아르바이트 회원으로 단기 알바 구인 구직을 할 수 있는 기능을 제공하지 않습니다.
								사장 회원으로 회원가입을 하여 진행해 주세요.
							</details>
							<p>
							<details style="font-size: 15px;color: gray;padding-top: 10px">
								<summary id="detail_summary">▶ 선택한 알바생을 어디서 확인 할 수 있나요?</summary>
								사장님/아르바이트생 회원 다 마이페이지를 통해 자신과 관련된 정보, 글들을 확인할 수 있습니다. 
							</details>
							<p>
							<details style="font-size: 15px;color: gray;padding-top: 10px">
								<summary id="detail_summary">▶ 평점은 어떻게 주는 건가요?</summary>
								사장님/아르바이트생 회원 다 마이페이지를 통해 평점을 상대방에게 부여해 줄 수 있으며, 
								사장님이 글쓴 구인구직에 아르바이생이 댓글을 달고 사장 회원님이 선택을 하시면 매칭이 된것이며,
								서로에게 평점을 줄 수 있습니다. 
							</details>
							<p>
							<details style="font-size: 15px;color: gray;padding-top: 10px">
								<summary id="detail_summary">▶ 평점은 어떤 기준으로 작성되는 건가요?</summary>
								평점은 지금 까지 집계된 평점들의 평균들을 표시 한 것입니다. <p>
								평점은 사장님과 아르바이생 회원간의 쌍방향 평가로 주관적일수 있다는 점 주의 바랍니다.  
							</details>
						
					</div>
	    		</center>
  
  
	   		 
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