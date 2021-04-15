<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateClientPw</title>
</head>
<body>
	<h1>비밀번호 수정</h1>
	<form action="<%=request.getContextPath()%>/UpdateClientPwController" method="post">
	<table>
		<tr>
			<td>새 비밀번호</td>
			<td><input type="password" name="clientPw" required="required"></td>
		</tr>
	</table>
	<button type="submit">변경</button>
	</form>
</body>
</html>