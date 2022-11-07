<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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


table > thead > tr > td{
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
<script type="text/javascript">
<!-- 
	function modify(new_text){
	var t1 = document.getElementById("t1");
	t1.firestChild.nodeValue = new_text;
}

//-->
</script>

<!-- 2022-11-06 허유진 파란 배경색  -->
<body style="background-color:#525CDE">

<!-- 2022-11-06 허유진 헤더 부분  -->
	<div class="parent" style="width: 100%; height: 930px; background: #585858;">
	    <div class="background" style="background: #525CDE;"></div>
	    
	    <!-- 2022-11-06 허유진 헤더 부분의 흰색 센터 부분 -->
	    <div class="center" style="background: #ffffff;">
				<nav id="menu">
		            <ul id = "top_menu">
		                <li>허유진(ujin7339)</li><li>|</li>
		                <li><a href="Mypage.jsp" style="text-decoration: none; color: black">마이페이지</a></li><li>|</li>
		                <li><a href="Login.jsp"  style="text-decoration: none; color: black">logout</a></li>
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
			
			<!-- 테이블 부분  -->
			<center>
	    			<div class="container" style="width: 85%; height: 100%;">
					  <h2>알바리스트</h2>
					  <p>The .table-striped class adds zebra-stripes to a table:</p>            
					  <table class="table table-striped" style="background: #ffffff; text-align: center;" >
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