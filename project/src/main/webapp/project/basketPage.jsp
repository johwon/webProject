<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.edu.basket.model.BasketVO"%>
<%@page import="co.kh.edu.basket.model.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");
BasketDAO bdao = BasketDAO.getInstance();
BasketVO vo = new BasketVO();
ArrayList<BasketVO> list = new ArrayList<BasketVO>();
vo.setcId(id);
list = bdao.selectDB(vo);
//주문여부 알기위해 카운트 가져오기
int count = bdao.selectCountDB(vo);
%>

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

table, th, td{
	border: 1px solid black;
	font-size: 25px;
	padding: 15px;
}
</style>
<script src="https://kit.fontawesome.com/7ab22df35b.js"></script>
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
	<main>
		<%@ include file="./aside.jsp"%>
		<section>
			<h2>나의 장바구니</h2>
			<%
			if (count == 0) {
			%>
			<h4>장바구니에 담긴 상품이 없습니다.</h4>
			<%
			} else {
			%>
			<form action="basketDeleteProc.jsp">
				<table id="basket_table">
					<tr>
						<th></th>
						<th>상품번호</th>
						<th>상품이름</th>
						<th>사이즈</th>
						<th>색상</th>
						<th>가격</th>
					</tr>
					<%
					for (BasketVO data : list) {
					%>
					<tr>
						<td><input type="checkbox" name="deleteProd"
							value="<%=data.getNum()%>"></td>
						<td><%=data.getpNum()%></td>
						<td><%=data.getpName()%></td>
						<td><%=data.getSize()%></td>
						<td><%=data.getColor()%></td>
						<td><%=data.getPrice()%></td>
					</tr>
					<%
					}
					}
					%>
				</table>
				<input type="submit" value="선택한 상품 삭제하기"> <input
					type="button" value="선택한 상품 주문하기">
			</form>
		</section>
	</main>
	<%@ include file="./bottom.jsp"%>
</body>
</html>