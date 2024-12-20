<%@page import="co.kh.edu.product.model.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ProductVO vo = new ProductVO();
%>
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
	<%@ include file="./header.jsp"%>
	<main>
		<%@ include file="./aside.jsp"%>
		<section>
			<div class="detail">
				<form action="basketProc.jsp">
					<div class="detail_top">
						<img src="./media/prod1.jpg" alt="">
						<div>
							<input type="hidden" name="pNum" value="10001">
							<p>상품이름1</h2>
							<p>가격</h3>
							<p>설명어쩌구저쩌구이랫구저랫구구</p>
							<!-- <hr> -->
							<P>색상</P>
							<select name="color" id="color" required>
								<option value="" selected disabled hidden>선택해주세요</option>
								<option value="black">black</option>
								<option value="white">white</option>
							</select>
							<P>사이즈</P>
							<select name="size" id="size" required>
								<option value="" selected disabled hidden>선택해주세요</option>
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
							<!-- <hr> -->
							<p>총 상품 금액</p>
							10000
							<p>원</p>
							<input type="button" value="구매하기"></input> 
							<input type="submit" value="장바구니 담기"></input>
						</div>
					</div>
				</form>
				<div class="detail_bottom">
				<img src="#" alt="">
				<div>
					<img src="#"> <img src="#"> <img src="#">
					<p>설명어쩌구저쩌구이랫구저랫구구</p>
				</div>
			</div>
			</div>
		</section>
	</main>
	<footer></footer>
</body>
</html>