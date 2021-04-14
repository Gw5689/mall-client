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
		<thead>
			<tr>
				<th>clientNo</th>
				<th>clientMail</th>
				<th>clientDate</th>
			</tr>
		</thead>
		<tbody>	
			<tr>
				<td><%=clientOne.getClientNo() %></td>
				<td><%=clientOne.getClientMail() %></td>
				<td><%=clientOne.getClientDate() %></td>
			</tr>
		</tbody>
	</table>
	
	<a href=""><button type="button">비밀번호 수정</button></a>
	<a href=""><button type="button">회원탈퇴</button></a>
</body>
</html>