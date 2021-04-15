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
				<th>clientNo</th>
				<td><%=clientOne.getClientNo() %></td>
			</tr>
			<tr>
				<th>clientMail</th>
				<td><%=clientOne.getClientMail() %></td>
			</tr>
			<tr>
				<th>clientDate</th>
				<td><%=clientOne.getClientDate() %></td>
			</tr>		
	</table>
	<!-- UpdateClientPwController.doGet() -> updateClientPw.jsp -->
	<!-- UpdateClientPwController -> ClientDao.updateClientPw() 리턴0,1 ->session.invalidate() -> redirect:/IndexController -->
	<a href="<%=request.getContextPath()%>/UpdateClientPwController"><button type="button">비밀번호 수정</button></a>
	<!-- DeleteClientController ->CartDao.deleteCartByClient(mail), ClientDao.deleteClientPw() 리턴0,1 ->session.invalidate() -> redirect:/IndexController -->
	<a href="<%=request.getContextPath()%>/DeleteClientController"><button type="button">회원탈퇴</button></a>
</body>
</html>