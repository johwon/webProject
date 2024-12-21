<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지</title>
<link rel="stylesheet" href="./main.css?after" type="text/css">
<link rel="stylesheet" href="./carousel.css" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Kablammo&family=Nanum+Gothic&family=Oxanium:wght@200..800&display=swap')
	;
</style>
<script src="https://kit.fontawesome.com/7ab22df35b.js"></script>
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<header>
		<a href="main.jsp"><i class="fa-solid fa-shirt"></i>
			<h2 id="title">SHOP</h2></a>
		<ul>
			<li class="dropdown"><a href="#">BEST</a>
				<div class="dropdown_content">
					<a href="#">1.menu</a> <a href="#">2.menu</a> <a href="#">3.menu</a>
				</div></li>
			<li><a href="#">공지사항</a></li>
			<li><a href="boardList.jsp">문의게시판</a></li>
			<li><a href="#">REVIEW</a></li>
		</ul>
		<div class="header_icon">
			<%
			String sessionId = (String) session.getAttribute("id");
			if (sessionId == null) {
			%>
			<a href="loginPage.jsp" class="sign"><li>로그인</li></a> <a
				href="registerPage.jsp" class="sign"><li>회원가입</li></a>
			<!-- <a href="#"><i class="fa-solid fa-phone"></i></a>
            <a href="#"><i class="fa-regular fa-comments"></i></a> -->
			<%
			} else {
			%>
			<a href="loginPage.jsp" class="sign"><li>마이페이지</li></a> <a href=#><i
				class="fa-solid fa-basket-shopping"></i></a>
			<%
			}
			%>
		</div>
	</header>
	<div class="carousel">
		<%@ include file="carousel.jsp"%>
	</div>
	<main>
		<aside class="left">
			<br>
			<h1>ALL</h1>
			<br>
			<hr>
			<br>
			<ul class="nav1">
				<a href="#"><strong>TOP</strong></a>
				<div class="ul_body">
					<li><a href="#">아우터</a></li>
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
			<br> <input type="text" placeholder="찾고있는 상품이 있나요?"> <a><i
				class="fa-solid fa-magnifying-glass"></i></a>
		</aside>
		<section>
			<div class="new_prod">
				<h1>NEW!</h1>
				<div class="prod">
					<a href="prodDetailPage.jsp" id="10001"> <img src="">
						<p>상품이름1</p>
						<p>가격</p>
					</a> 
					<a href="detailPage.jsp" id="10001" > <img src="">
						<p>상품이름2</p>
						<p>가격</p>
					</a> 
					<a href="detailPage.jsp" id="10001" > <img src="">
						<p>상품이름3</p>
						<p>가격</p>
					</a>
				</div>
				<br>
				<div class="prod">
					<a href="#"> <img src="">
						<p>상품이름1</p>
						<p>가격</p>
					</a> <a href="#"> <img src="">
						<p>상품이름2</p>
						<p>가격</p>
					</a> <a href="#"> <img src="">
						<p>상품이름3</p>
						<p>가격</p>
					</a>
				</div>
			</div>
			<div class="notice">
				<a><h2>
						<공지사항>
					</h2></a> <br> <a><p>최신공지내용~~~~</p></a>
				<p>작성일</p>
				<a><p>최신공지내용~~~~</p></a>
				<p>작성일</p>
			</div>
		</section>
	</main>
	<footer></footer>
</body>
</html>