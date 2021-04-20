<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clientOne</title>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	
	<h1>회원정보</h1>
	
	<table border="1">
		
			<tr>
				<th>clientNo</th>
				<td>${clientOne.clientNo}</td>
			</tr>
			<tr>
				<th>clientMail</th>
				<td>${clientOne.clientMail}</td>
			</tr>
			<tr>
				<th>clientDate</th>
				<td>${clientOne.clientDate}</td>
			</tr>		
	</table>
	
	<a href="${pageContext.request.contextPath}/UpdateClientPwController"><button type="button">비밀번호 수정</button></a>
	<a href="${pageContext.request.contextPath}/DeleteClientController"><button type="button">회원탈퇴</button></a>
</body>
</html>