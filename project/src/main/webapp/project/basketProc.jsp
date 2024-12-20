<%@page import="co.kh.edu.basket.model.BasketVO"%>
<%@page import="co.kh.edu.basket.model.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	if(id==null){
		%>
		<script>alert("로그인 후 이용해주세요!");
		history.go(-1);
		</script>
		<%
		return;
	}
	int pNum = Integer.parseInt(request.getParameter("pNum")) ;
	String size = request.getParameter("size");
	String color = request.getParameter("color");
	
	BasketDAO bdao = BasketDAO.getInstance();
	BasketVO vo = new BasketVO();
	vo.setcId(id);
	vo.setpNum(pNum);
	vo.setSize(size);
	vo.setColor(color);
	
	boolean flag = bdao.insertDB(vo);
	if(flag){
    %>
    <script>
    alert("장바구니에 담았습니다.");
    history.go(-1);
    </script>
    <%
	}else{
    %>
    <script>
    alert("장바구니에 담지 못했습니다. 잠시후에 다시 시도해주세요.");
    history.go(-1);
    </script>
    <%
	}
    %>
