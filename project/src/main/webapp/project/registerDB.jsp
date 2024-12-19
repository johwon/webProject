<%@page import="co.kh.edu.customer.model.CustomerDAO"%>
<%@page import="co.kh.edu.customer.model.CustomerVO"%>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Kablammo&family=Nanum+Gothic&family=Oxanium:wght@200..800&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/7ab22df35b.js"></script>
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<%@include file="./header.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");

	CustomerVO cvo = new CustomerVO(id, pwd, name, phone1, phone2, phone3, email, zipcode, address1, address2);
	CustomerDAO cdao = new CustomerDAO();
	boolean returnFlag = cdao.insertDB(cvo);
	%>

	<main>
		<section align="center">
			<div class="center">
				<%
				if (returnFlag) {
				%>
				<h2>회원가입이 완료되었습니다.</h2>
				<br> <a href="loginPage.jsp"><button class="button1">로그인하기</button></a>
				<%
				} else {
				%>
				<h2>회원가입이 실패되었습니다.</h2>
				<br> <a href="registerPage.jsp"><button class="button1">뒤로가기</button></a>
				<%
				}
				%>
			</div>
		</section>
		<aside class="right"></aside>
	</main>
	<%@ include file="./bottom.jsp"%>
</body>