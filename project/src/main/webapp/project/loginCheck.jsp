<%@page import="co.kh.edu.customer.model.CustomerDAO"%>
<%@page import="co.kh.edu.customer.model.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
%>

<%
boolean successFlag = false;
if (id != null && pwd != null) {
	CustomerVO cvo = new CustomerVO();
	cvo.setId(id);
	cvo.setPwd(pwd);

	CustomerDAO cdao = new CustomerDAO();
	int check = cdao.selectLoginCheck(cvo);

	if (check==1) {	//로그인성공
		session.setAttribute("id", id);
		session.setAttribute("pass", pwd);
		response.sendRedirect("loginPage.jsp");
	} else if(check==0){	//아이디는 있는데 비밀번호 틀림
%>
<script>
	alert('비밀번호가 틀렸습니다.');
	history.go(-1);		/* 이전화면으로 돌아감 */
</script>
<%
}else {	//아이디 자체가 존재하지 않는 경우
	%>
	<script>
	alert('아이디가 존재하지 않습니다.');
	history.go(-1);		/* 이전화면으로 돌아감 */
</script>
<%
}
}
%>