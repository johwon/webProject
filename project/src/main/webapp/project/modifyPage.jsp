<%@page import="co.kh.edu.customer.model.CustomerDAO"%>
<%@page import="co.kh.edu.customer.model.CustomerVO"%>
<%@page import="java.beans.Customizer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pwd = (String) session.getAttribute("pwd");

CustomerVO cvo = new CustomerVO();
cvo.setId(id);
cvo.setPwd(pwd);
CustomerDAO cdao = new CustomerDAO();
cvo = cdao.selectOneDB(cvo);
%>
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
<%@ include file="./header.jsp"%>
<main>
	<aside class="left"></aside>
	<section align="center">
		<div class="center">
			<h3 align="center">회원정보 수정</h3>
			<form action="modifyDB.jsp" method="post" name="modifyForm">
				<fieldset style="border: 0px;">
					<table align="center">
						<tr>
							<th>아이디</th>
							<td><%= cvo.getId() %></td>
						</tr>
						<tr>
							<th><label for="pwd">비밀번호</label></th>
							<td><input type="password" name="pwd" id="pwd"
								value="<%= cvo.getPwd() %>" size="31px">&nbsp;</td>
						</tr>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input type="text" name="name" id="name" value="<%= cvo.getName() %>">&nbsp;</td>
						</tr>
						<tr>
							<th><label for="phone">전화번호</label></th>
							<td><input type="text" name="phone1" id="phone1" value="<%= cvo.getPhone1() %>" size="2px">
								- <input type="text" name="phone2" id="phone2" value="<%= cvo.getPhone2() %>" size="3px">-
								<input type="text" name="phone3" id="phone3" value="<%= cvo.getPhone3() %>" size="3px">&nbsp;
							</td>
						</tr>
						<tr>
							<th><label for="email1">이메일</label></th>
							<td><input type="text" name="email1" id="email1" value="<%= cvo.getEmail() %>" size="5px">
								@ <select name="email2" id="email2">
									<option value="naver">naver.com</option>
									<option value="gmail">gmail.com</option>
									<option value="daum">daum.net</option>
									<option value="other">직접 입력</option>
							</select>
						</tr>
						<tr>
							<th><label for="zipcode">우편번호</label></th>
							<td><input type="text" name="zipcode" id="zipcode" value="<%= cvo.getZipcode() %>"><input
								type="button" value="찾기" onClick="zipcodeCheck()" name="button1"
								id="button1" /></td>
						</tr>
						<tr>
							<th><label for="address1">주소</label></th>
							<td><input type="text" name="address1" id="address1"
								value="<%= cvo.getAddress1() %>" size="31px"></td>
						</tr>
						<tr>
							<th><label for="address2">상세주소</label></th>
							<td><input type="text" name="address2" id="address2"
								value="<%= cvo.getAddress2() %>" size="31px"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button"
								value="회원정보 수정 완료" onClick="modifyCheck()" /></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</div>
	</section>
	<aside class="right"></aside>
</main>
<%@ include file="./bottom.jsp"%>
</body>
</html>