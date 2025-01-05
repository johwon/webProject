<%@page import="co.kh.edu.noticeBoard.model.NoticeBoardDAO"%>
<%@page import="co.kh.edu.noticeBoard.model.NoticeBoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
NoticeBoardVO vo = new NoticeBoardVO();
vo.setNum(num);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
try {
	NoticeBoardDAO bdao = NoticeBoardDAO.getInstance();
	NoticeBoardVO bvo = bdao.selectBoardDB(vo);
	int _num = vo.getNum();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지</title>
<link rel="stylesheet" href="../main.css?after" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Kablammo&family=Nanum+Gothic&family=Oxanium:wght@200..800&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/7ab22df35b.js"></script>
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<main>
	<section align="center">
		<div class="center">
			<form>
				<table width="800" cellspacing="0" cellpadding="0" align="center" class="content">
					<tr>
						<th align="center" >글번호</th>
						<td align="left" colspan="3"><%=bvo.getNum()%></td>
					</tr>
					<tr>
						<th align="center">작성자</th>
						<td align="left" colspan="3"><%=bvo.getWriter()%></td>
					</tr>
					<tr>
						<th align="center" >작성일</th>
						<td align="left" align="center"><%=sdf.format(bvo.getRegdate())%></td>
						<th align="center" >조회수</th>
						<td align="left" align="center"><%=bvo.getReadcount()%></td>
					</tr>
					<tr>
						<th align="center">글제목</th>
						<td align="left" colspan="3"><%=bvo.getSubject()%></td>
					</tr>
					<tr>
						<td align="left" width="375" colspan="4" class="content_text"><pre><%=bvo.getContent()%></pre></td>
					</tr>
				</table>
				<br>
						<div align="center">
							<input type="button" value="글수정" class="my_input"
							onclick="document.location.href='noticeUpdateForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
							&nbsp;&nbsp;&nbsp;&nbsp; 
							
							<input type="button" value="글삭제" class="my_input"
							onclick="document.location.href='noticeDeleteForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
							&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="button" value="글목록" class="my_input"
							onclick="document.location.href='noticeList.jsp?pageNum=<%=pageNum%>'">
						</div>
			</form>
		</div>
	</section>
	<aside class="right"></aside>
</main>
<%@ include file="../common/footer.jsp"%>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>