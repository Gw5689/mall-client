<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clientOne</title>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	
<%
	// client 리스트 가져오기
	Client clientOne = (Client)(request.getAttribute("clientOne"));
%>
	<h1>회원정보</h1>
	<table border="1">
		<tr>
			<td>clientMail</td>
			<td>clientDate</td>
		</tr>
		
		<tr>
			<td><%=clientOne.getClientMail() %></td>
			<td><%=clientOne.getClientDate() %></td>
		</tr>
	</table>
</body>
</html>