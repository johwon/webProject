<%@page import="co.kh.edu.board.model.BoardVO"%>
<%@page import="co.kh.edu.board.model.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
BoardVO vo = new BoardVO();
vo.setNum(num);
%>
<%
try {
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO article = bdao.selectBoardOneDB(vo);
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
<%@ include file="../header.jsp"%>
<main>
	<section align="center">
		<div class="center">
		<b>글수정</b> <br>
		<form method="post" name="writeform" 
			action="updateProc.jsp?pageNum=<%=pageNum%>"
			onsubmit="return writeSave()" style="background-color: white">
			<input type="hidden" name="num" value="<%=article.getNum()%>">
			<table width="600px" border="1" cellspacing="0" cellpadding="0"
				align="center" >
				<tr>
					<td width="200px" align="center">이 름</td>
					<td align="left" width="500px"><input type="text" size="30"
						maxlength="10" name="writer" value="<%=article.getWriter()%>">
					</td>
				</tr>
				<tr>
					<td width="200px" align="center">제 목</td>
					<td align="left" width="500px"><input type="text" size="60"
						maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
				</tr>
				<tr>
					<td width="200px" align="center">Email</td>
					<td align="left" width="500px"><input type="text" size="60"
						maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
				</tr>
				<tr>
					<td width="200px" align="center">내 용</td>
					<td align="left" width="500px"><textarea name="content"
							rows="20" cols="60">
 <%=article.getContent()%></textarea></td>
				</tr>
				<tr>
					<td width="200px" align="center">비밀번호</td>
					<td align="left" width="500px"><input type="password" size="15"
						maxlength="12" name="pass"></td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="글수정"> 
						<input type="reset"	value="다시작성"> 
						<input type="button" value="목록보기" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
		</div>
	</section>
	<aside class="right"></aside>
</main>
<%
	} catch (Exception e) {
	}
	%>
<%@ include file="../bottom.jsp"%>