<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertClient</title>
</head>
<body>
	<h1>회원가입</h1>
	
	<form action="${pageContext.request.contextPath}/InsertClientController" method="post">
		<table border="1">
			<tr>
				<td>Email</td>
				<td><input type="text" name="clientMail" required="required"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="clientPw" required="required"></td>
			</tr>
		</table>
		<button type="submit">회원가입</button>
		<a href="${pageContext.request.contextPath}/IndexController"><button type="button">HOME</button></a>
	</form>
</body>
</html>