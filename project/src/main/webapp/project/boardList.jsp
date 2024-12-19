<%@page import="co.kh.edu.board.model.BoardDAO"%>
<%@page import="co.kh.edu.board.model.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="view/color.jsp"%>
<%
// 1. 페이징기법 -  페이지 사이즈:1페이지에 10개 보이기
int pageSize = 10;
// 2. 페이징기법 - 페이지번호 선택
request.setCharacterEncoding("utf-8");
String pageNum = request.getParameter("pageNum");
if (pageNum == null) {
	pageNum = "1";
}
//3. 현재페이지 설정, start, end 
int currentPage = Integer.parseInt(pageNum);
int start = (currentPage - 1) * pageSize + 1; //4페이지 시작보여줘		(4-1)*10+1=>31
int end = (currentPage) * pageSize; //4페이지 끝번호 보여줘 4*10 =>40

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
//4. 해당된 페이지 10개를 가져온다
int number = 0;
ArrayList<BoardVO> boardList = null;
BoardDAO bdao = BoardDAO.getInstance();

int count = bdao.selectCountDB();//전체 글수
if (count > 0) {
	//현재페이지 내용 10개만 가져온다
	boardList = bdao.selectStartEndDB(start, end);
}
//5. 만약 4페이지를 가져왔다면(31~40)을 가져왔따면 NUMBER = 40 전체객수 100 1페이지(100~91) 2페이지(90~81)
number = count - (currentPage - 1) * pageSize;
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
				<b>글목록(전체 글:<%=count%>)
				</b>
				<table width="1000" style="background-color: white">
					<tr>
						<td align="right"><a href="writeForm.jsp">글쓰기</a></td>
					</tr>
				</table>
				<%
				if (count == 0) {
				%>
				<table width="1000" border="1" cellpadding="0" cellspacing="0"
					style="background-color: white">
					<tr>
						<td align="center">게시판에 저장된 글이 없습니다.</td>
				</table>
				<%
				} else {
				%>
				<table border="1" width="1000" cellpadding="0" cellspacing="0"
					align="center">
					<tr height="30">
						<th align="center" width="50">번 호</th>
						<th align="center" width="250">제 목</th>
						<th align="center" width="100">작성자</th>
						<th align="center" width="150">작성일</th>
						<th align="center" width="50">조 회</th>
						<th align="center" width="100">IP</th>
					</tr>
					<%
					for (BoardVO article : boardList) {
					%>
					<tr height="30">
						<td align="center" width="50"><%=number--%></td>
						<td align="left" width="250">
							<!-- 수정 <5> --> <a
							href="content.jsp?num=<%=article.getNum()%>&pageNum=1"> <!-- 수정<6> -->
								<%
								//6. depth 값에 따라서 5배수 증가를 해서 화면에 보여줘야한다
								//depth : 1 => 길이:5, 2=>10
								int wid = 0;
								if (article.getDepth() > 0) {
									wid = 5 * article.getDepth();
								%> <img src="images/level.gif" width="<%=wid%>" height="16">
								<!-- 공백 --> <img src="images/re.gif"> <%
 }
 %> <%=article.getSubject()%></a> <%
 if (article.getReadcount() >= 20) {
 %> <img src="images/hot.gif" border="0" height="16"> <%
 }
 %>
						</td>
						<td align="center" width="100"><a
							href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a></td>
						<td align="center" width="150"><%=sdf.format(article.getRegdate())%></td>
						<td align="center" width="50"><%=article.getReadcount()%></td>
						<td align="center" width="100"><%=article.getIp()%></td>
					</tr>
					<%
					}
					%>
					<%
					}
					%>
				</table>
				<br> <br>
				<!-- 수정 <7> -->
				<div align="center">
					<%
					if (count > 0) {
						int pageBlock = 3; //보여줄페이지
						int imsi = count % pageSize == 0 ? 0 : 1;
						int pageCount = count / pageSize + imsi;
						int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						if (endPage > pageCount)
							endPage = pageCount;
						if (startPage > pageBlock) {
					%>
					<a href="boardList.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>

					<%
					}
					for (int i = startPage; i <= endPage; i++) {
					if (currentPage == i) {
					%>
					<a href="boardList.jsp?pageNum=<%=i%>"><b>[<%=i%>]
					</b> </a>
					<%
					} else {
					%>
					<a href="boardList.jsp?pageNum=<%=i%>">[<%=i%>]
					</a>
					<%
					}
					%>

					<%
					}
					if (endPage < pageCount) {
					%>
					<a href="boardList.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
					<%
					}
					}
					%>
				</div>
			</div>
		</section>
		<aside class="right"></aside>
	</main>
	<%@ include file="./bottom.jsp"%>