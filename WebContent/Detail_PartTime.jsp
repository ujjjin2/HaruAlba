<%@page import="pt.PtDAO"%>
<%@page import="user.UserDAO"%>
<%@page import="pt_comment.Ptcomment"%>
<%@page import="java.util.List"%>
<%@page import="pt_comment.PtcommentDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
    

<!DOCTYPE html>


<%
	String userid = (String)session.getAttribute("userid");
	response.setHeader("Pragma", "no-cache"); 
	response.setHeader("Cache-Control", "no-store"); 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost/haru?serverTimezone=UTC", "haru", "haru");
	String sql = "SELECT userLOCATION, ptTITLE, userNAME, ptINFO, ptROLE, ptSDAY, ptEDAY, ptMONEY, ptGIVE, ptCONTENT, ptSTATE FROM pt, user where pt.userID = user.userID AND ptID = ? ";
	pstmt = conn.prepareStatement(sql);
	
	int ptID = 0;
	String ptstate = null;
	String cmtuserid = null;
	
	if(request.getParameter("ptid") != null) {
		ptID = Integer.parseInt(request.getParameter("ptid"));
	}
	pstmt.setInt(1, ptID);
	
	rs = pstmt.executeQuery();
	

	PtDAO ptDAO = new PtDAO();
	PtcommentDAO pt_comment = new PtcommentDAO();
	List<Ptcomment> ptlist = pt_comment.selectptcmt(ptID);
	
	UserDAO userDAO = new UserDAO();
	
	if(rs.next()){
		String userName = rs.getString("userNAME");
		String title = rs.getString("ptTITLE");
		String info = rs.getString("ptINFO");
		String role = rs.getString("ptROLE");
		String sday = rs.getString("ptSDAY");
		String eday = rs.getString("ptEDAY");
		String money = rs.getString("ptMONEY");
		String give = rs.getString("ptGIVE");
		String content = rs.getString("ptCONTENT");
		String state = rs.getString("ptSTATE");
		String location = rs.getString("userLOCATION");
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

.article-state{
    font-size: 18px;
    color: #0F52FC;
    font-weight: bold;
}

.article-content-wrap{
	overflow: auto;
}

.article-info{
	padding: 30px 16px 10px 16px;
	font-size: 16px;
}
.article-content{
    width: 100%;
    box-sizing: border-box;
    padding: 24px 16px;
    line-height: 24px;
    font-size: 16px;
    word-wrap: break-word;
    word-break: break-word;
}

.article-user{
	float: left;
	font-size: 15px;
}

.article-location{
	float: right;
	color: #7b858e;
	font-size: 15px;
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
  border-bottom: 20px solid #ffffff;
}
*{
	font-family: 'Jua', sans-serif;
}


.ex{
	height: 100%;
	display: flex;
	flex-direction: row;
}
input:focus{outline:none;}

</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>상세정보_단기알바</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<!-- 파란색 배경 -->
<body style="background-color:#525CDE">



	<!-- 헤더 -->
	<div class="parent" style="width: 100%; height: 100%; background: #585858;">
		<div class="background" style="background: #525CDE;"></div>
		
		<!-- 노란색 -->
		<div class="center" style="background: #FFF2BE;height: 1200px">
		<!-- 흰색 -->
			<div class="center_write" style="background: #FFFFFF;height: 85%">
					<div class="header">
						<center>
							<a href="Main.jsp">
								<img src="images/harulogo.png" style="width: 170px; height: 170px;">
							</a>
						</center>
					</div>
					<!-- 세부사항 내용 -->
					<div class="article" style="background: #ffffff">
						<div class="article-header">
							<div class="article-state" <%if(state.equals("마감")){ %>style="color: #D11E35;vertical-align: middle; font-size: 17px"<%}
					      		else {%> style="color: #0F52FC;vertical-align: middle; font-size: 17px"<%} %>> <%= state %></div>
							<div class="article-title"><%=title %></div>
							<div class="article-user"><%=userName %></div>
							<div class="article-location"><%=location%></div>
						</div>	
						
						<div class="article-content-wrap">
							<div class="article-info">
								<table>
								<colgroup>
									<col style="width: 80px;">
								</colgroup>
									<tbody>
										<tr>
											<th>매장정보</th>
											<td><%=info %></td>
										</tr>
										<tr class="space"></tr>										
										<tr>
											<th>역할</th>
											<td><%=role %></td>
										</tr>
										<tr class="space"></tr>	
										<tr>
											<th>일시</th>
											<td><%=sday %> ~ <%=eday %></td>
										</tr>
										<tr class="space"></tr>	
										<tr>
											<th>시급</th>
											<td><%=money %></td>
										</tr>
										<tr class="space"></tr>
										<tr>
											<th>지급방법</th>
											<td><%=give %></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="article-content">
								<p><%=content %></p>							
							</div>
						</div>
						<%
							}
						%>
					</div>
					
					<div class="comment-wrap" style="background: #FFFFFF">
						<div class="comment-header" style="background: #EDF0F4" >
							<div class="comment-title">지원</div>
						</div>
						
						
						<div>
							
							
							<ul class="ul">
								<li>
								<%
								
								ptstate = ptDAO.ptSTATE(ptID);
								
								if(userid.equals(ptDAO.ptiduserid(ptID)) && ptstate.equals("모집중") ){
								for(Ptcomment ptcomment : ptlist) {
									
									cmtuserid = ptcomment.getUserID();
							
								%>
									<div class="comment">
										<div class="comment-name">
											<span><%= ptDAO.ptusername(ptcomment.getUserID())%> (평점 : <%= ptDAO.ptrating(ptcomment.getUserID()) %>) </span> 
										</div>
										<div class="comment-content">
											<p class="p"><%= ptcomment.getComment() %>
											<form action="SelectAction.jsp" method="post">
											<button type="submit" class="btn">선택하기</button>
											<input type="hidden" name="ptALBA" value="<%= cmtuserid %>">
											<input type="hidden" name="ptID" value="<%= ptID %>">
											</form>
										</div>
									</div>
									<%
										}
										if(ptlist.size() == 0) {
									%>
									<div class="comment-not">
										<div>지원이 없습니다.</div>						
									</div>
									<%
										}
								}else if (userid.equals(ptDAO.ptiduserid(ptID)) && ptstate.equals("마감") ){
									%>
									<div class="comment-not">
										<div>이미 처리된 구인글 입니다.</div>						
									</div>
									<%
									}
									%>
								</li>
							</ul>
			
						</div>	
					</div> <!-- 댓글 창 끝 -->
					<%
					
					if(!userid.equals(ptDAO.ptiduserid(ptID)) && ptstate.equals("모집중") ){
							
					%>
					<!-- 댓글 입력 창 -->
					<div class="write-wrap">
						<form action="Comment_PT_Action.jsp" method="post">
							<div class="ex">
								<input type="text"  class="comment-write" name="comment" placeholder="연락받을 번호와 간단한 동기를 적어주세요!" style="background: #EDF0F4">
								<input type="hidden" name="ptID" value=<%=ptID %>>
								<button type="submit" class="btn">지원하기</button>
							</div>
						</form>
					</div>
					<%
					}else if(!userid.equals(ptDAO.ptiduserid(ptID)) && ptstate.equals("마감") ){
					%>
					<div class="comment-not">
						<div>모집 완료된 글입니다.</div>						
					</div>
					<%
					}
					%>
			</div> <!-- 흰색 끝 --> 
			
		</div>
		<!--  노란색  -->
		
		<div class="background" style="background: #525CDE;"></div>
	
	</div>


</body>
</html>
