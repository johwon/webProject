<%@page import="co.kh.edu.noticeBoard.model.NoticeBoardDAO"%>
<%@page import="co.kh.edu.noticeBoard.model.NoticeBoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String pass = request.getParameter("pass");
%>
<%
NoticeBoardDAO bdao = NoticeBoardDAO.getInstance();
NoticeBoardVO vo = new NoticeBoardVO();
vo.setNum(num);
vo.setPass(pass);
boolean check = bdao.deleteDB(vo);
if (check) {
%>
<meta http-equiv="Refresh" content="0;url=noticeList.jsp?pageNum=<%=pageNum%>">
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