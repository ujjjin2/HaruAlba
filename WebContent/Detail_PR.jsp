<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    width: 80%;
    height: 90%;
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
	padding: 24px 16px 0px 16px;
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
	width: 90%;
    background: #fff;
    font-size: 14px;
    padding: 12px 62px 11px 12px;
    margin: 3% 0% 0% 0%;
   	float: left;
   	display:flex;
}


.write-wrap{
	margin: 0% 5% 5% 5%;
	
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
    font-size: 14px;
    outline: 0;
    height: 40px;
    float: right;
    display: flex;
    margin: 3% 0 0 0 ;
}

.space {
  border-bottom: 10px solid #ffffff;
}
input:focus{outline:none;}

</style>
<meta charset="UTF-8">
<title>상세정보_PR</title>
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
		<div class="center" style="background: #FFF2BE;">
		<!-- 흰색 -->
			<div class="center_write" style="background: #FFFFFF">
					<div class="header">
						<center>
							<a href="Main.jsp">
								<img src="images/harulogo.png" style="width: 150px; height: 150px;">
							</a>
						</center>
					</div>
					<!-- 세부사항 내용 -->
					<div class="article" style="background: #ffffff">
						<div class="article-header">
							<div class="article-title">[1-3개월 230-250만 고정급] 민족은행 농협 용산 고객센터</div>
							<div class="article-user">작성자 이름</div>
							<div class="article-location">인천</div>
						</div>	
						<div class="article-content-wrap">
							<div class="article-info">
								<table>
								<colgroup>
									<col style="width: 120px;">
								</colgroup>
									<tbody>
										<tr>
											<th>나이</th>
											<td>21세</td>
										</tr>
										<tr class="space"></tr>										
										<tr>
											<th>업직종</th>
											<td>택배, 배송기사, 화물,운송이사, 쿠팡친구</td>
										</tr>
										<tr class="space"></tr>	
										<tr>
											<th>근무가능기간</th>
											<td>2022년 12월 1일 ~ 2022년 12월 8일</td>
										</tr>
										<tr class="space"></tr>	
										<tr>
											<th>근무가능 요일</th>
											<td>월화수목금</td>
										</tr>
										<tr class="space"></tr>	
											<th>시급</th>
											<td>15000원</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="article-content">
								<p>알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.
								알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.알바할사람 구해요.
								알바할사람 구해요.알바할사람 구해요.</p>							
							</div>
							<div class="article-content">
								<p>알바하고싶습니다알바하고싶습니다알바하고싶습니다알바하고싶습니다알바하고싶습니다</p>							
							</div>
						</div>
					</div>
					
					<div class="comment-wrap" style="background: #FFFFFF">
						<div class="comment-header" style="background: #EDF0F4" >
							<div class="comment-title">댓글</div>
						</div>
						
						<div>
							
							<!-- 댓글이 없을 때 -->
							<div class="comment-not">
								<div>댓글이 없습니다.</div>						
							</div>
							
							<!-- 댓글이 있을 때 -->
							<ul class="ul">
								<li>
									<div class="comment">
										<div class="comment-name">
											<span>손윤호</span>
										</div>
										<div class="comment-content">
											<p class="p">여기에 댓글이 나타납니다.</p>
										</div>
									</div>
								</li>
							</ul>
			
						</div>	
					</div> <!-- 댓글 창 끝 -->
					
					<!-- 댓글 입력 창 -->
					<div class="write-wrap">
						<form action="Main.jsp" method="get">
							<input type="text"  class="comment-write" name="userName" placeholder="댓글을 입력해주세요." style="background: #EDF0F4">
							<button type="submit" class="btn">글쓰기</button>
						</form>
					</div>
			
			</div> <!-- 흰색 끝 --> 
			
		</div>
		<!--  노란색  -->
		
		<div class="background" style="background: #525CDE;"></div>
	
	</div>


</body>
</html>
