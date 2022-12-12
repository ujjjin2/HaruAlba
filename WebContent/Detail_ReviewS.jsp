<%@page import="review_comment.ReviewS_CmtDAO"%>
<%@page import="review.Review_S_DAO"%>
<%@page import="review_comment.Review_Cmt"%>
<%@page import="java.util.List"%>
<%@page import="review_comment.Review_CmtDAO"%>
<%@page import="review.Review_A_DAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%

    request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE html>

<%

// 로그아웃 버튼 후 캐시 삭제
	
	String userid = (String)session.getAttribute("userid");
	response.setHeader("Pragma", "no-cache"); 
	response.setHeader("Cache-Control", "no-store"); 

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost/haru?serverTimezone=UTC", "haru", "haru");
	String sql = "SELECT userNAME, rTITLE, rCONTENT FROM reviewS, user where reviewS.userID = user.userID AND rID = ? ";
	pstmt = conn.prepareStatement(sql);
	
	int rID = 0;
	if(request.getParameter("rid") != null) {
		rID = Integer.parseInt(request.getParameter("rid"));
	}
	pstmt.setInt(1, rID);
	
	rs = pstmt.executeQuery();
	
	Review_S_DAO prDAO = new Review_S_DAO();
	
	ReviewS_CmtDAO pr_comment = new ReviewS_CmtDAO();
	List<Review_Cmt> prlist = pr_comment.selectprcmt(rID);
	
	
	if(rs.next()){
		String userID = rs.getString("userNAME");
		String title = rs.getString("rTITLE");
		String content = rs.getString("rCONTENT");
%>

<html>
<head>
<style>
.parent{
    display: flex;
    overflow: auto;
}
.center_write{
    display: flex;
    height:90%;
    flex-direction: column;
    margin: 5% 10% 5% 10%;
}

.article{
    display: flex;
    flex-direction: column;
    margin: 0% 5% 0% 5%;
  	border-bottom: 1px solid #000000;
}

.article-header{
	padding: 24px 16px;
    border-bottom: 1px solid #000000;
}

.article-title{
    line-height: 36px;
    font-size: 20px;
    color: #1e2022;
    word-wrap: break-word;
    word-break: break-all;
    overflow: auto;
}

.article-content-wrap{
	overflow: auto;
}

.article-info{
	padding: 24px 16px 24px 16px;
	border-bottom: 1px solid #EDF0F4;
}
.article-content{
    width: 100%;
    box-sizing: border-box;
    padding: 0 16px 0 16px;
    line-height: 24px;
    font-size: 16px;
    word-wrap: break-word;
    word-break: break-word;
}

.article-user{
	float: left;
}

.article-location{
	float: right;
	color: #7b858e;
}

.comment-wrap{
	display: flex;
	flex-direction: column;
    margin: 3% 5% 0% 5%;
    background-color: #fff;
}
.comment-header{
	position: relative;
    padding: 16px;
    display: flex;
  	border-bottom: 1px solid #000000;
}

.comment-title{
	line-height: 21px;
    font-size: 18px;
}

.ul{
	list-style: none;
	margin: 0;
    padding: 0;
    border: 0;
}

.p{
	margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
}

.comment-not{
	padding: 32px 0;
    text-align: center;
    border-bottom: 1px solid #000000;
}

.comment-name{
    font-weight: 700;
    color: #1e2022;
    word-wrap: break-word;
    word-break: break-all;
}

.comment{
	position: relative;
    padding: 12px 12px 12px 36px;
	border-bottom: 1px solid #000000;
}

.comment-content{
	margin-top: 8px;
    line-height: 20px;
    font-size: 14px;
    color: #1e2022;
    word-wrap: break-word;
    word-break: break-all;
    overflow: auto;
    max-height: 400px;
}

.comment-write{
	border-radius: 4px;
	box-sizing: border-box;
	border: 0;
	width: 85%;
    font-size: 14px;
    padding: 12px 62px 11px 12px;
    margin: 3% 3% 0% 0%;
    flex-grow: 5;
}


.write-wrap{
	margin: 0% 5% 5% 5%;
	height: 100%;
}

.background {
    flex: 1;
    overflow: auto;
}
.center {
    flex: 3;
}

.header{
	margin: 30px 0 0 0px;
	width: 100%;
	height: 20%;
}

.btn{	
	background: #FA4E29;
	color: #FFFFFF;
    outline: 0;
    height: 40px;
    margin: 3% 0 0 0 ;
    float: right;
    flex-grow: 1;
}

.space {
  border-bottom: 10px solid #ffffff;
}

.content-title{	
	padding: 8px 16px 0 16px;
	font-weight: bold;
}

.bold-title{
	font-weight: bold;
}

.ex{
	height: 100%;
	display: flex;
	flex-direction: row;
}
*{
	font-family: 'Jua', sans-serif;
}
input:focus{outline:none;}

</style>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>상세정보_PR</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<!-- 파란색 배경 -->
<body style="background-color:#ffb955">
	
	<!-- 헤더 -->
	<div class="parent" style="width: 100%; height: 100%; background: #ffb955;">
		<div class="background" style="background: #ffb955;"></div>
		
		<!-- 노란색 -->
		<div class="center" style="background: #ffb955;">
		<!-- 흰색 -->
			<div class="center_write" style="background: #FFFFFF;box-shadow: 10px 10px 20px gray;">
					<div class="header">
						<center>
							<a href="Main.jsp">
								<img src="images/harulogo.png" style="width: 140px; height: 140px;">
							</a>
						</center>
					</div>
					<!-- 세부사항 내용 -->
					<div class="article" style="background: #ffffff">

						<div class="article-header">
							<div class="article-title"><%=title%></div>
							<div class="article-user"><%=userID%></div>
						</div>	
						<div class="article-content-wrap">
							<div class="article-content">
								<p style="margin: 10px 0 10px 0"><%=content%></p>							
							</div>
						</div>
						<%
						}
						%>
					</div>
					
					<div class="comment-wrap" style="background: #FFFFFF">
						<div class="comment-header" style="background: #EDF0F4" >
							<div class="comment-title">댓글</div>
						</div>
						
						<div>
							
							
							<!-- 댓글이 있을 때 -->
							<ul class="ul">
								<li>
								<%
								for(Review_Cmt prcomment : prlist) {
								%>
									<div class="comment">
										<div class="comment-name">
											<span><%= prDAO.prusername(prcomment.getUserID()) %></span>
										</div>
										<div class="comment-content">
											<p class="p"><%= prcomment.getComment() %></p>
										</div>
									</div>
									<%
										}		
										if(prlist.size() == 0) {
									%>
									<!-- 댓글이 없을 때 -->
									<div class="comment-not">
										<div>댓글이 없습니다.</div>						
									</div>
									<%
										}
									%>
								</li>
							</ul>
			
						</div>	
					</div> <!-- 댓글 창 끝 -->
					
					<!-- 댓글 입력 창 -->
					<div class="write-wrap">
						<form action="Comment_ReviewS_Action.jsp" method="post">
							<div class="ex">
								<input type="text"  class="comment-write" name="comment" placeholder="댓글을 입력해주세요." style="background: #EDF0F4">
								<input type="hidden" name="rID" value=<%= rID %>>
								<button type="submit" class="btn">글쓰기</button>
							</div>
						</form>
					</div>
			
			</div> <!-- 흰색 끝 --> 
			
		</div>
		<!--  노란색  -->
		
		<div class="background" style="background: #ffb955;"></div>
	
	</div>


</body>
</html>
