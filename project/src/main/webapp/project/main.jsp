<%@page import="co.kh.edu.reviewBoard.model.ReviewBoardVO"%>
<%@page import="co.kh.edu.reviewBoard.model.ReviewBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.edu.noticeBoard.model.NoticeBoardVO"%>
<%@page import="co.kh.edu.noticeBoard.model.NoticeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
NoticeBoardVO vo = new NoticeBoardVO();
ArrayList<NoticeBoardVO> list = dao.selectDB();

ReviewBoardDAO rdao = ReviewBoardDAO.getInstance();
ReviewBoardVO rvo = new ReviewBoardVO();
ArrayList<ReviewBoardVO> rlist = rdao.selectDB();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지</title>
<link rel="stylesheet" href="./main.css?after" type="text/css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Kablammo&family=Nanum+Gothic&family=Oxanium:wght@200..800&display=swap')
	;
</style>
<script src="https://kit.fontawesome.com/7ab22df35b.js"></script>
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<%@ include file="./common/header.jsp"%>
	<div class="carousel">
		<%@ include file="./carousel/carousel.jsp"%>
	</div>
	<main>
		<aside class="left">
			<br>
			<h1>ALL</h1>
			<br>
			<hr>
			<br>
			<ul class="nav1">
				<a href="<%=request.getContextPath()%>/project/prodPage.jsp"><strong>TOP</strong></a>
				<div class="ul_body">
					<li><a
						href="<%=request.getContextPath()%>/project/prodPage.jsp">아우터</a></li>
					<li><a href="#">가디건,니트</a></li>
					<li><a href="#">후드/맨투맨</a></li>
					<li><a href="#">티셔츠</a></li>
					<li><a href="#">셔츠,블라우스</a></li>
				</div>
			</ul>
			<br>
			<ul class="nav2">
				<a href="#"><strong>BOTTOM</strong></a>
				<div class="ul_body">
					<li><a href="#">와이드팬츠</a></li>
					<li><a href="#">데님</a></li>
					<li><a href="#">슬랙스</a></li>
					<li><a href="#">츄리닝</a></li>
				</div>
			</ul>
			<br>
			<ul class="nav3">
				<a href="#"><strong>ACC</strong></a>
				<div class="ul_body">
					<li><a href="#">모자</a></li>
					<li><a href="#">가방</a></li>
					<li><a href="#">신발</a></li>
					<li><a href="#">쥬얼리</a></li>
					<li><a href="#">기타</a></li>
				</div>
			</ul>
			<br>
			<form action="searchProdProc.jsp">
				<input type="text" name="name" placeholder="찾고있는 상품이 있나요?" required>
				<button type="submit">
					<i class="fa-solid fa-magnifying-glass" onClick="submit"></i>
				</button>
			</form>
		</aside>
		<section>
		<div class="center">
			<div class="new_prod">
				<h1 align="center">NEW!</h1>
				<div class="prod">
					<a href="prodDetailPage.jsp?pNum=10001" id="10001"> <img
						src="./media/prod10001.jpg">
						<p>T-SHIRT</p>
						<p class="price">25,000원</p>
					</a> <a href="prodDetailPage.jsp?pNum=10002" id="10002"> <img
						src="./media/prod10002.jpg">
						<p>정장 셋업</p>
						<p class="price">80,000원</p>
					</a>
					</a> <a href="prodDetailPage.jsp?pNum=10003" id="10003"> <img
						src="./media/prod10003.jpg">
						<p>자켓</p>
						<p class="price">65,000원</p>
					</a>
				</div>
				<br>
			</div>
			<hr>
			<div class="mainBoard">
				<div class="notice">
					<a href="<%=request.getContextPath()%>/project/board/noticeList.jsp">
					<h2 align="center">공지사항</h2></a>
					 <br>
					<div class="notice_table">
					<%
					for (NoticeBoardVO data : list) {
					%>
					<a
						href="<%=request.getContextPath()%>/project/board/noticeContent.jsp?num=<%=data.getNum()%>&pageNum=1">
						<p style="color: grey;"><%=data.getSubject()%></p>
						<p style="color: grey;"><%=data.getRegdate()%></p>
					</a> <br>
					<%
					}
					%>
					</div>
				</div>
				<div class="review">
					<a
						href="<%=request.getContextPath()%>/project/board/reviewList.jsp"><h2 align="center">BEST
							REVIEW</h2></a> <br>
							<div class="notice_table">
					<%
					for (ReviewBoardVO data : rlist) {
						if (data.getDepth() == 0) {
					%>
					<a
						href="<%=request.getContextPath()%>/project/board/reviewContent.jsp?num=<%=data.getNum()%>&pageNum=1">
						<p style="color: grey;"><%=data.getSubject()%></p>
						<p style="color: grey;"><%=data.getRegdate()%></p>
					</a> <br>
					<%
					}
					}
					%>
					</div>
				</div>
			</div>
			</div>
		</section>
	</main>
	<%@ include file="./common/footer.jsp"%>
</body>
</html>