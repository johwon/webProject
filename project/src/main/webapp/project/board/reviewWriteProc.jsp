<%@page import="co.kh.edu.reviewBoard.model.ReviewBoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" scope="page" class="co.kh.edu.reviewBoard.model.ReviewBoardVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<!-- 2. curd -->
<%
vo.setRegdate(new Timestamp(System.currentTimeMillis()));
vo.setIp(request.getRemoteAddr());
ReviewBoardDAO bdao = ReviewBoardDAO.getInstance();
boolean flag = bdao.insertDB(vo);
if (flag == true) {
	response.sendRedirect("reviewList.jsp");
}else{
%>
<script>
	alert("글 등록이 실패되었습니다.")
	history.go(-1);
</script>
<%
}
%>