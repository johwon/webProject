<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지</title>
<link rel="stylesheet" href="./main.css?after" type="text/css">
<link rel="stylesheet" href="./carousel.css" />
<!-- 내부 자바스크립트 -->
<script language="javascript">
	function begin() {
		document.myForm.pass.focus();
	}
	function checkIt() {
		if (!document.myForm.pass.value) {
			alert("비밀번호를 입력하지 않았습니다");
			document.myForm.pass.focus();
			return false;
		}
	}
</script>
</head>
<script src="https://kit.fontawesome.com/7ab22df35b.js"></script>
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>

</head>
<body onload="begin()">
	<%@ include file="./header.jsp"%>
	<main>
		<section>
			<form name="myForm" method="post" action="deleteDB.jsp"
				onsubmit="return checkPass()">
				<table width="280" border="1" align="center">
					<tr>
						<td colspan="2" align="center"><b>회원 탈퇴</b></td>
					</tr>
					<tr>
						<td width="170"><b>비밀번호입력</b></td>
						<td width="110"><input type="password" name="pwd" size="15"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="회원탈퇴"> <input type="button" value="취  소"
							onclick="javascript:window.location='loginPage.jsp'"></td>
					</tr>
				</table>
			</form>
		</section>
		<aside class="right"></aside>
	</main>
	<footer></footer>
</body>
</html>