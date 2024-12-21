<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="co.kh.edu.noticeBoard.model.NoticeBoardVO"%>
<%@page import="co.kh.edu.noticeBoard.model.NoticeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. 페이징기법 - 페이지사이즈:1페이지에 10개
	int pageSize = 10;
//2. 페이징기법 - 페이지번호 선택
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
//3. 현재페이지 설정, start end
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage-1)*pageSize+1;
	int end = currentPage * pageSize;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

//4. 해당된 페이지 10개를 가져온다
	int number = 0;	
	ArrayList<NoticeBoardVO> boardList = null;
	NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
	
	int count = dao.selectCountDB();
	if(count>0){
		boardList = dao.selectStartEndDB(start, end);
	}
	number = count - (currentPage -1) * pageSize;	//글번호
	
	NoticeBoardVO vo = new NoticeBoardVO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹사이트</title>
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
	<%@ include file="../header.jsp"%>
	<main>
		<section align="center">
			<div class="center">
				<b>공지사항(전체 글:<%=count%>)</b>
				<div align="right">
					<form action="boardSearchProc.jsp">
						<select name="searchOpt">
							<option value="subject">제목</option>
						</select> 
						<input type="text" name="search"> 
						<input type="submit" value="검색">
					</form>
				</div>
				<table width="1000">
					<tr>
						<td align="right"><a href="writeForm.jsp">글쓰기</a></td>
					</tr>
				</table>
				<%
				if(count==0){
				%>
				<table width="1000" border="1" cellpadding="0" cellspacing="0"
					style="background-color: white">
					<tr>
						<td align="center">게시판에 저장된 글이 없습니다.</td>
					</tr>
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
					</tr>
					<%
					for(NoticeBoardVO article : boardList){
					%>
					<tr height="30">
						<td align="center" width="50"><%=number--%></td>
						<td align="left" width="250">
			</div>
		</section>
	</main>
</body>
</html>