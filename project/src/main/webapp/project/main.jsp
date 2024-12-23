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
	<header>
		<a href="<%=request.getContextPath()%>/project/main.jsp"><i class="fa-solid fa-shirt"></i>
			<h2>SHOP</h2></a>
		<ul>
			<li class="dropdown"><a href="#">BEST</a>
				<div class="dropdown_content">
					<a href="<%=request.getContextPath()%>/project/prodPage.jsp">TOP</a> 
					<a href="<%=request.getContextPath()%>/project/prodPage.jsp">BOTTOM</a> 
					<a href="<%=request.getContextPath()%>/project/prodPage.jsp">ACC</a>
				</div></li>
			<li><a href="<%=request.getContextPath()%>/project/board/noticeList.jsp">공지사항</a></li>
			<li><a href="<%=request.getContextPath()%>/project/board/boardList.jsp">문의게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/project/board/reviewList.jsp">REVIEW</a></li>
		</ul>
		<div class="header_icon">
			<%
			String sessionId = (String) session.getAttribute("id");
			if (sessionId == null) {
			%>
			<a href="<%=request.getContextPath()%>/project/loginPage.jsp" class="sign"><li>로그인</li></a> <a
				href="<%=request.getContextPath()%>/project/registerPage.jsp" class="sign"><li>회원가입</li></a>
			<%
			} else {
			%>
			<a href="<%=request.getContextPath()%>/project/loginPage.jsp" class="sign"><li>마이페이지</li></a> 
			<a href="<%=request.getContextPath()%>/project/basketPage.jsp"><i class="fa-solid fa-basket-shopping"></i></a>
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
			<div class="new_prod">
				<br>
				<h1 align="center">NEW!</h1>
				<div class="prod">
					<a href="prodDetailPage.jsp?pNum=10001" id="10001"> <img
						src="./media/prod10001.jpg">
						<h2>T-SHIRT</h2>
						<p>25,000원</p>
					</a> <a href="prodDetailPage.jsp?pNum=10002" id="10002"> <img
						src="./media/prod10002.jpg">
						<h2>정장 셋업</h2>
						<p>80,000원</p>
					</a>
				</div>
				<br>
			</div>
			<hr>
			<div class="mainBoard">
				<div class="notice">
					<a href="<%=request.getContextPath()%>/project/board/noticeList.jsp">
					<h2 align="center"><공지사항></h2>
					</a> <br>
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
				<div class="review">
					<a
						href="<%=request.getContextPath()%>/project/board/reviewList.jsp"><h2 align="center">BEST
							REVIEW</h2></a> <br>
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
		</section>
	</main>
	<footer>
		<div class="center" align="center">
			<ul>
				<a href=#><li>회사소개</li></a>
				<a href=#><li>매장안내</li></a>
				<a href=#><li>이용안내</li></a>
				<a href=#><li>개인정보처리방침</li></a>
				<a href=#><li>이용약관</li></a>
			</ul>
			<br>
			<div>
				<p>상호 : (주)shop / 대표 : 조해원 / 주소 : 서울특별시 강남구 역삼동 호산빌딩</p>
				<p>반품주소 : 서울특별시 강남구 역삼동 호산빌딩</p>
				<p>사업자등록번호 : 000-00-00000 [사업자정보확인] / 통신판매업신고번호 : 제
					0000-서울-0000호</p>
			</div>
			<br>
			<p>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 구매안전서비스를 이용할 수 있습니다.</p>
			<br>
			<p>ⓒ (주)shop. All Rights reserved. design by cho.</p>

		</div>
	</footer>
</body>
</html>