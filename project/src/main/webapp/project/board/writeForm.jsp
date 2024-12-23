<%@ page contentType="text/html; charset=UTF-8"%>
<%
//새로운 글로 입력(num=0, ref=0, step=0, depth=0)
//부모글에 대한 답변으로 입력(num=부모값, ref=부모값, step=부모값, depth=부모값)
int num = 0, ref = 1, step = 0, depth = 0;
try {
	if (request.getParameter("num") != null) {
		num = Integer.parseInt(request.getParameter("num"));
		ref = Integer.parseInt(request.getParameter("ref"));
		step = Integer.parseInt(request.getParameter("step"));
		depth = Integer.parseInt(request.getParameter("depth"));
	}
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
	<%@ include file="../header.jsp"%>
	<main>
		<section align="center">
			<div style="margin-top:50px;">
				<h2>글 작성</h2><br>
				<form method="post" name="writeForm" id="writeForm"
					action="writeProc.jsp" onsubmit="return writeSave()"
					class="content">
					<input type="hidden" name="num" value="<%=num%>"> 
					<input type="hidden" name="ref" value="<%=ref%>"> 
					<input type="hidden" name="step" value="<%=step%>"> 
					<input type="hidden" name="depth" value="<%=depth%>">
					<table width="800" cellpadding="0" cellspacing="0"
						align="center">
						<tr>
							<th align="right" colspan="2""><a href="boardList.jsp">글목록</a></th>
						</tr>
						<tr>
							<th width="150" align="center">이름</th>
							<td width="330"><input type="text" size="12" maxlength="12"
								name="writer" /></td>
						</tr>
						<tr>
							<th width="150" align="center">이메일</th>
							<td width="330"><input type="text" size="30" maxlength="30"
								name="email" /></td>
						</tr>
						<tr>
							<th width="150" align="center">제목</th>
							<td width="330">
								<%
								if (request.getParameter("num") == null) {
								%> <input type="text" size="50" maxlength="50" name="subject" /> <%
 } else {
 %> <input type="text" size="50" maxlength="50" name="subject"
								value="[답변]" /> <%
 }
 %>
							</td>
						</tr>
						<tr>
							<th width="100" align="center">내용</th>
							<td width="330"><textarea name="content" rows="13" cols="50"></textarea>
							</td>
						</tr>
						<tr>
							<th width="100" align="center">비밀번호</th>
							<td width="330"><input type="password" size="10"
								maxlength="10" name="pass" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<input type="submit" value="글쓰기" class="my_input"/> 
							<input type="reset" value="다시작성" class="my_input"/> 
							<input type="button" value="목록" class="my_input" 
								onClick="window.location='boardList.jsp'"></td>
						</tr>
					</table>
				</form>
				<%
				} catch (Exception e) {
				}
				%>
			</div>
		</section>
	</main>
	<%@ include file="../bottom.jsp"%>