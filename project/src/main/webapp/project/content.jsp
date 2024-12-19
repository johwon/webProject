<%@page import="co.kh.edu.board.model.BoardDAO"%>
<%@page import="co.kh.edu.board.model.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="view/color.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
BoardVO vo = new BoardVO();
vo.setNum(num);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
try {
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO bvo = bdao.selectBoardDB(vo);
	int _num = vo.getNum();
	int ref = bvo.getRef();
	int step = bvo.getStep();
	int depth = bvo.getDepth();
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
	<section align="center">
		<div class="center">
			<b>글내용 보기</b> <br></br>
			<form style="background-color: white">
				<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
					<tr height="30">
						<td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
						<td align="center" width="125" align="center"><%=bvo.getNum()%></td>
						<td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
						<td align="center" width="125" align="center"><%=bvo.getReadcount()%></td>
					</tr>
					<tr height="30">
						<td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
						<td align="center" width="125" align="center"><%=bvo.getWriter()%></td>
						<td align="center" width="125" bgcolor="<%=value_c%>">작성일</td>
						<td align="center" width="125" align="center"><%=sdf.format(bvo.getRegdate())%></td>
					</tr>
					<tr height="30">
						<td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
						<td align="center" width="375" align="center" colspan="3"><%=bvo.getSubject()%></td>
					</tr>
					<tr>
						<td align="center" width="125" bgcolor="<%=value_c%>">글내용</td>
						<td align="left" width="375" colspan="3"><pre><%=bvo.getContent()%></pre></td>
					</tr>
					<tr height="30">
						<td colspan="4" bgcolor="<%=value_c%>" align="right"><input
							type="button" value="글수정"
							onclick="document.location.href='updateForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
							<input type="button" value="답글쓰기" 
						onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&step=<%=step%>&depth=<%=depth%>'">
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제"
							onclick="document.location.href='boardDeleteForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
							&nbsp;&nbsp;&nbsp;&nbsp; <!-- 수정<1> --> <input type="button"
							value="글목록"
							onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">

						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<aside class="right"></aside>
</main>
<%@ include file="./bottom.jsp"%>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>