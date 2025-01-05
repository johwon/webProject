<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
		<a href="<%=request.getContextPath()%>/project/main.jsp"><i class="fa-solid fa-shirt"></i>
			<h2>SHOP</h2></a>
		<ul>
			<li class="dropdown"><a href="#">BEST</a>
				<div class="dropdown_content">
					<a href="<%=request.getContextPath()%>/project/product/prodPage.jsp">TOP</a> 
					<a href="<%=request.getContextPath()%>/project/product/prodPage.jsp">BOTTOM</a> 
					<a href="<%=request.getContextPath()%>/project/product/prodPage.jsp">ACC</a>
				</div></li>
			<li><a href="<%=request.getContextPath()%>/project/board/noticeList.jsp">공지사항</a></li>
			<li><a href="<%=request.getContextPath()%>/project/board/boardList.jsp">문의게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/project/board/reviewList.jsp">REVIEW</a></li>
		</ul>
		<div class="header_icon">
			<%
			String sessionId = (String) session.getAttribute("id");
			if (sessionId == null) {
			%>
			<a href="<%=request.getContextPath()%>/project/member/loginPage.jsp" class="sign"><li>로그인</li></a> <a
				href="<%=request.getContextPath()%>/project/member/registerPage.jsp" class="sign"><li>회원가입</li></a>
			<%
			} else {
			%>
			<a href="<%=request.getContextPath()%>/project/member/loginPage.jsp" class="sign"><li>마이페이지</li></a> 
			<a href="<%=request.getContextPath()%>/project/product/basketPage.jsp"><i class="fa-solid fa-basket-shopping"></i></a>
			<%
			}
			%>
		</div>
	</header>