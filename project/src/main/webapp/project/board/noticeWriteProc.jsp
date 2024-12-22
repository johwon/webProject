<%@page import="co.kh.edu.noticeBoard.model.NoticeBoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" scope="page"
	class="co.kh.edu.noticeBoard.model.NoticeBoardVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<!-- 2. curd -->
<%
vo.setRegdate(new Timestamp(System.currentTimeMillis()));
vo.setIp(request.getRemoteAddr());
NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
boolean flag = dao.insertDB(vo);
if (flag == true) {
	response.sendRedirect("noticeList.jsp");
}else{
%>
<script>
	alert("글 등록이 실패되었습니다.")
	history.go(-1);
</script>
<%
}
%>