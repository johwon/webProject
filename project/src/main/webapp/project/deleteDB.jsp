<%@page import="co.kh.edu.customer.model.CustomerDAO"%>
<%@page import="co.kh.edu.customer.model.CustomerVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String id = (String) session.getAttribute("id");
String pwd = request.getParameter("pwd");
CustomerVO cvo = new CustomerVO();
CustomerDAO cdao = new CustomerDAO();
cvo.setId(id);
cvo.setPwd(pwd);
boolean flag = cdao.deleteDB(cvo);
if (flag == true) {
	session.invalidate();
%>
<html>
<head>
<title>회원탈퇴</title>
</head>

<meta http-equiv="Refresh" content="3;url=login.jsp">
<body>
	<script>
	alert("탈퇴가 완료되었습니다."); 
	history.go(-1);
	</script>
	<%
// 로그인 페이지로 리다이렉트
response.sendRedirect("loginPage.jsp");
%>
	<%
	} else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
<%@ include file="./bottom.jsp"%>
</html>