<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.edu.product.model.ProductVO"%>
<%@page import="co.kh.edu.product.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProductDAO dao = ProductDAO.getInstance();
ProductVO vo = new ProductVO();
ArrayList<ProductVO> list = dao.selectAllDB(vo);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지</title>
<link rel="stylesheet" href="./main.css?after" type="text/css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Kablammo&family=Nanum+Gothic&family=Oxanium:wght@200..800&display=swap')
	;
</style>
<script src="https://kit.fontawesome.com/7ab22df35b.js"></script>
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<%@ include file="./header.jsp"%>
	<main style="height: 1300px">
		<%@ include file="./aside.jsp"%>
		<section >
			<div class="center">
				<%
				if(list.size()==0){
				%>
				<h2>상품이 없습니다.</h2>
				<%
				}else{
				%>
				<div class="prod">
				<%
				for(ProductVO data : list){
				%>
					<a href="prodDetailPage.jsp?pNum=<%=data.getNum()%>" id="<%=data.getNum()%>"> <img
						src="./media/prod<%=data.getNum()%>.jpg">
						<h4><%=data.getName()%></h4>
						<p><%=data.getPrice()%>원</p>
				<%
				} //end of for
				%>
				</div>
			<%
		}
			%>
				<br>
			</div>
		</section>
	</main>
	<%@ include file="./bottom.jsp"%>
</body>
</html>