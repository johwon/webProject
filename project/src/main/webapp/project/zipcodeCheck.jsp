<%@page import="co.kh.edu.customer.model.ZipCodeDAO"%>
<%@page import="co.kh.edu.customer.model.ZipCodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String check = request.getParameter("check");
String dong = request.getParameter("dong");
ArrayList<ZipCodeVO> zipList = null;

if(check.equals("n")){
ZipCodeVO zvo = new ZipCodeVO();
zvo.setDong(dong);
ZipCodeDAO zdao = new ZipCodeDAO();
zipList = zdao.dongCheck(zvo);
}
%>

<html>
<head>
<title>우편번호검색</title>
<script src="script.js"></script>
<style>
 main {
 	MARGIN: 0 AUTO;
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	justify-content: center;
	align-content: center;
 }
</style>
</head>
<body>
	<main>
		<b>우편번호 찾기</b>
		<form name="zipForm" method="post" action="zipcodeCheck.jsp">
			<input type="hidden" name="check" value="n">
			<table>
				<tr>
					<td>동이름 입력 : <input name="dong" type="text"> <input
						type="button" value="검색" onclick="dongCheck()" />
					</td>
				</tr>
			</table>
		</form>
		<table>
			<!-- ③ -->
			<%
			if (check.equals("n")) {
				if (zipList.isEmpty()) {
			%>
			<tr>
				<td align="center"><br />검색된 결과가 없습니다.</td>
			</tr>
			<%
			} else {
			%>
			<tr>
				<td align="center"><br /> ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
			</tr>
			<%
			for ( ZipCodeVO data : zipList) {
				String tempZipcode = data.getZipcode();
				String tempSido = data.getSido();
				String tempGugun = data.getGugun();
				String tempDong = data.getDong();
				String tempBunji = data.getBunji();
				if (tempBunji == null)
					tempBunji = " ";
			%>
			<tr>
				<td><a href="javascript:sendAddress('<%=tempZipcode%>','<%=tempSido%>','<%=tempGugun%>','<%=tempDong%>','<%=tempBunji%>')">
						<%=data.toString()%></a><br>
					<%
					} //end for
				} //end zipList.isEmpty() else
 }//end if check.equals("n") 
 %></td>
			</tr>
			<tr>
				<td align="center"><a href="javascript:this.close();">닫기</a></td>
			</tr>
		</table>
	</main>
</body>
</html>