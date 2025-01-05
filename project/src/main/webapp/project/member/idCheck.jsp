<%@page import="co.kh.edu.customer.model.CustomerDAO"%>
<%@page import="co.kh.edu.customer.model.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	CustomerVO cvo = new CustomerVO();
	cvo.setId(id);
	CustomerDAO cdao = new CustomerDAO();
	boolean returnFlag = cdao.idCheck(cvo);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복체크</title>
</head>
<body>  
<%
	if(returnFlag){
%>
<h2>사용 가능한 아이디입니다.</h2>
<%
	}else{
%>
<h2>중복된 아이디입니다. 다른 아이디를 입력해주세요.</h2>
</body>
</html>
<%
	}
%>