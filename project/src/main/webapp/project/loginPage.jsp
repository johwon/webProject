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
		<section align="center">
			<div class="center">
				<%
				// 1. 세션 정보를 가져오기 (세션이 없으면 null 반환)
				if (sessionId == null) {
				%>
				<h2>LOGIN</h2>
				<br>
				<form action="loginCheck.jsp" method="post" id="loginForm">
					<fieldset style="border: 0px">
						<table align="center">
							<tr>
								<td><input type="text" name="id" id="id" placeholder="아이디를 입력하세요"></td>
							</tr>
							<tr>
								<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요"></td>
							</tr>
						</table>
					</fieldset>
					<input type="submit" value="로그인" size="300px"> <br>
					<a href='registerPage.jsp'><input type='button' value='회원가입'></a>
				</form>
				<%
				} else {
				%>
				<table width='400' align="center">
					<tr>
						<td width='300' align='center'><%=sessionId%> 님 어서오세요.</td>
					</tr>
					<tr>
						<td align='center'><a href=modifyPage.jsp>회원정보 수정</a>
							&nbsp;&nbsp; <a href=deletePage.jsp>회원 탈퇴</a> &nbsp;&nbsp; <a
							href='logout.jsp'>로그아웃</a></td>
					</tr>
				</table>
				<%
				}
				%>
			</div>
		</section>
		<aside class="right"></aside>
	</main>
	<%@ include file="./bottom.jsp"%>
</body>
</html>