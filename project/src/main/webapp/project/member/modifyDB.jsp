<%@page import="co.kh.edu.customer.model.CustomerDAO"%>
<%@page import="co.kh.edu.customer.model.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String id = (String)session.getAttribute("id");
 	String pwd = request.getParameter("pwd");
 	String name = request.getParameter("name");
 	String phone1 = request.getParameter("phone1");
 	String phone2 = request.getParameter("phone2");
 	String phone3 = request.getParameter("phone3");
 	String email = request.getParameter("email1")+"@"+request.getParameter("email2");
 	String zipcode = request.getParameter("zipcode");
 	String address1 = request.getParameter("address1");
 	String address2 = request.getParameter("address2");
 
 	CustomerVO cvo = new CustomerVO(id,pwd,name,phone1,phone2,phone3,email,zipcode,address1,address2);
 	CustomerDAO cdao = new CustomerDAO();
 	boolean returnFlag = cdao.updateDB(cvo);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%
	if(returnFlag){
%>
<script>alert("회원수정이 완료되었습니다.");
history.go(-2);</script>
<%
	}else{
%>
	<script>alert("회원수정이 실패되었습니다.");
history.go(-1);</script>
<%
	}
%>
</body>
</html>