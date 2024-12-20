<%@page import="co.kh.edu.basket.model.BasketVO"%>
<%@page import="co.kh.edu.basket.model.BasketDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] str = request.getParameterValues("deleteProd");
	BasketDAO bdao = BasketDAO.getInstance();
	BasketVO vo = new BasketVO();
	boolean flag = false;
	for(String s : str){
		vo.setNum(Integer.parseInt(s));
		flag = bdao.deleteDB(vo);
		if(flag){
			%>
			<script>
			alert("삭제가 완료되었습니다.");
			location.href="basketPage.jsp";
			</script>
			<%
		}else{
			%>
			<script>
			alert("삭제 실패되었습니다. 잠시후에 다시 시도해주세요.");
			history.go(-1);
			</script>
			<%
		}
	}
%>