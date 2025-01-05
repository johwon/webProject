<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지</title>
<link rel="stylesheet" href="../main.css?after" type="text/css">
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
	<%@ include file="../common/header.jsp"%>
	<main>
		<section>
			<div class="center">
			<form name="myForm" method="post" action="deleteDB.jsp"
				onsubmit="return checkPass()">
				<table align="center" class="myPage">
					<tr>
						<th colspan="2" align="center"><b>회원 탈퇴</b></th>
					</tr>
					<tr>
						<td ><b>비밀번호 입력</b></td>
						<td ><input type="password" name="pwd" size="15"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="회원탈퇴" style="padding:10px; font-size:20px"> 
							<input type="button" value="취  소" style="padding:10px; font-size:20px"
								onclick="javascript:window.location='loginPage.jsp'">
						</td>
					</tr>
				</table>
			</form>
			</div>
		</section>
		<aside class="right"></aside>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>